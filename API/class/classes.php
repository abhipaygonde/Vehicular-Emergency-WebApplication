<?php

//THIS CODE CONTAINS CLASSES OF FUNCTIONS WHICH WILL EXECUTE STEPS OF MAIN EMERGENCY API

    //THIS CLASS functions FUNCTIONS WHICH ARE NEEDED FOR THE API TO WORK ACCORDINGLY
    class functions{
        //Haversine ------------------------------------------------------------
        //THIS FUNCTION WILL GIVE NEAREST 5 OR 1 RESCUE CENTER USING HAVERSINE FORMULA
        public function haversine($lat, $lng, $tableName){

            //PREPARE QUERY-----------------------------------------------------
            if($tableName == "policestation" || $tableName == "civiloffice"){
                $limit = 1;
            }else{
                $limit = 5;
            }
            //echo "CONTENT OF REQUEST OBJECT IS : ".$request->getParam('ownerName');
            //echo "\n TILL HERE";

            //THE  QUERY COTAINS THE HAVERSINE FORMULA
            $sql = "SELECT id, locLatitude, locLongitude, ( 6371 * acos( cos( radians(:lat) ) * cos( radians( locLatitude ) ) * 
            cos( radians( locLongitude ) - radians(:lng) ) + sin( radians(:lat2) ) * 
            sin( radians( locLatitude ) ) ) ) AS distance FROM $tableName HAVING
            distance < 50 ORDER BY distance LIMIT $limit";


                try{
                //Get DB Object........
                $db = new db();
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);

                //Binding values............
                $stmt->bindParam(':lat', $lat);
                $stmt->bindParam(':lat2', $lat);    //Here :lat 2 = :lat1 just for prepare statement we made two diff parameters....
                $stmt->bindParam(':lng', $lng);
                //$stmt->bindParam(':tableName', $tableName);
                $stmt->execute();
                $data = $stmt->fetchAll();
                //print_r($data);
                return($data);
                } catch(PDOException $e){
                    return "failed";
                }

        }


        //Distance Matrix ---------------------------------------------------------------
        //THIS FUNCTION WILL ACCESS GOOGLE MAPS DISTANCE MATRIX API AND RETURN VAUES SUCH AS ROAD DISTANCE AND TRAVEL TIME BETWEEN 2 PLACES
        public function distanceMatrix($lat, $lng, $destLat, $destLng){

            // $lat1 = "18.747352";
            // $long1 = "73.408549";
        
            // $lat2 = "18.546084";
            // $long2 = "73.215125";

            $len = sizeof($lat);
            $origin = '';
            for($z=0; $z<$len; $z++){
                if($origin == ''){
                    $origin = ''.$lat[$z].','.$lng[$z];
                }else{
                    $origin = $origin.'|'.$lat[$z].','.$lng[$z];
                }
            }

            // foreach ($lat as $lt) {
            //     return $row['response'];
            // }

        
            $url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$origin."&destinations=".$destLat.",
                                                                                    ".$destLng."&mode=driving&key=AIzaSyD-T_nIRGhX2QPlgkOM5xmocn94qIDOgz0";
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            $response = curl_exec($ch);
            curl_close($ch);
            $response_a = json_decode($response, true);

        //     echo"\n FROM ".$response_a['origin_addresses'][0]." TO ".$response_a['destination_addresses'][0];

        //     echo "\n".$dist = $response_a['rows'][0]['elements'][0]['distance']['text'];
        //     echo "\n".$time = $response_a['rows'][0]['elements'][0]['duration']['text'];
        
        //     echo"FROM ".$response_a['origin_addresses'][1]." TO ".$response_a['destination_addresses'][0];
        
        //     echo "\n".$dist = $response_a['rows'][1]['elements'][0]['distance']['text'];
        //     echo "\n".$time = $response_a['rows'][1]['elements'][0]['duration']['text'];
        
        
        //    // print_r(array('distance' => $dist, 'time' => $time));
        //    echo"array is";
        //    print_r($response_a);
        
           return($response_a);

        }

        //NOTIFY
        //THIS FUNCITON WILL ENTER A NOTIFICATION MESSAGE IN TABLE notifications
        public function notify($message, $rescueid, $table){
                        //PREPARE QUERY-----------------------------------------------------
                if($table == "policestation" || $table == "civiloffice"){
                    $sql = 'INSERT INTO notifications (message, rescueid, response) 
                    VALUES(:message, :rescueid, "Sent")';
                }else{

                        $sql = "INSERT INTO notifications (message, rescueid) 
                                                    VALUES(:message, :rescueid)";
                    }
                            try{
                            //Get DB Object........
                            $db = new db();
            
                            //Connect............
                            $db = $db->connect();
            
                            //Prepared statement.......
                            $stmt = $db->prepare($sql);
            
                            //Binding values............
                            $stmt->bindParam(':message', $message);
                            $stmt->bindParam(':rescueid', $rescueid);
                            $stmt->execute();
                            return($db->lastInsertId());
                            } catch(PDOException $e){
                                echo '{"Result": "Failure", "Message" : "There is an error with the system in sending notification"}';
                                die();
                            }
            
            
        }

        //THIS FUNCTION WHEN CALLED CHECKS THE RESPONCE FROM RESCUE CENTER FOR RESPECTIVE NOTIFICATION FOR A TIME PERIOD
        public function checkResponce($noficationId, $action)
        {
            //PREPARE QUERY-----------------------------------------------------
            if($action == 6){
                $sql = 'UPDATE notifications SET response = "Timeout" WHERE id = :id';  //Dhyan me rakh Timeout krna hai......
            }else{
                $sql = "SELECT * FROM notifications WHERE id = :id";
            }
                try{
                //Get DB Object........
                $db = new db();
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);

                //Binding values............
                $stmt->bindParam(':id', $noficationId);
                //$stmt->bindParam(':tableName', $tableName);
                $stmt->execute();
                if($action < 6){
                    $data = $stmt->fetchAll();
                    //return $data["response"];
                    foreach ($data as $row) {
                            return $row['response'];
                    }
                }else{
                    return"Rejected";
                }
                } catch(PDOException $e){
                    // echo $e;
                    echo '{"Result": "Failure", "Message" : "A notification is sent to rescue center"}';
                    die();
                }


        }
    

        //THIS FUNCTION CHECKS A RESPONCE FOR A NOTIFICATION ONLY ONE TIME
        public function checkSingleResponce($noficationId)
        {
            //PREPARE QUERY-----------------------------------------------------
                $sql = "SELECT * FROM notifications WHERE id = :id";
            
                try{
                //Get DB Object........
                $db = new db();
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);

                //Binding values............
                $stmt->bindParam(':id', $noficationId);
                //$stmt->bindParam(':tableName', $tableName);
                $stmt->execute();
                    $data = $stmt->fetchAll();
                    //return $data["response"];
                    foreach ($data as $row) {
                            return $row['response'];
                    }
               
                } catch(PDOException $e){
                    // echo $e;
                    echo '{"Result": "Failure", "Message" : "A notification is sent to rescue center"}';
                    die();
                }


        }
    

    }

//THIS CLASS CONNTAINS HANDLER FUNCTIONS WHICH WILL CALL AND HANDLE THE RETURN VALUES OF FUNCTIONS FROM CLASS functions
    class handlers{
        private $ownerName, $ownerAddress, $mobNo, $carNo, $carModel, $carColor, $locLatitude, $locLongitude, $emergencyType, $timeDate;
        private $ids;

        //CONSTRUCTOR WHICH WILL SET VALUES
        function handlers($ownerName, $ownerAddress, $mobNo, $carNo, $carModel, $carColor, $locLatitude, $locLongitude, $emergencyType, $timeDate){
            $this->ownerName = $ownerName;
            $this->ownerAddress = $ownerAddress;
            $this->mobNo = $mobNo;
            $this->carNo = $carNo;
            $this->carModel = $carModel;
            $this->carColor = $carColor;
            $this->locLatitude = $locLatitude;
            $this->locLongitude = $locLongitude;
            $this->emergencyType = $emergencyType;
            $this->timeDate = $timeDate;
        }

        //FUNCIOTN WHICH WILL HANDLE THE FUNCTIONS SUCH AS haversine() and distanceMatrix()
        public function handle($table, $pre){
                //Haversine.....................................................................
                $fn = new functions();


                $haversineObj = $fn->haversine($this->locLatitude,  $this->locLongitude, $table);    
                // echo"Haversine obj executed ";
                if($haversineObj == "failed"){
                    echo '{"Result": "Failure", "Message" : "There is an error with the system in finding rescue center"}';
                    die();
                }

                    $loopLength = sizeof($haversineObj);

                    // echo"Length of array is ".$loopLength;

                    // echo " center check kiya  for  ".$table;

                    if($loopLength == 0){
                        // echo '{"Result": "Failure", "Message" : "There is no '.$table.' within 50 kilometer radius of range!"}';
                        return "noCenter";
                    }
                    else{

                        // echo"Else execute kr rha hai for ".$table;
                            $latArr = array();
                            $lngArr = array();
                            $id = array();
                            $i = 0;

                            foreach ($haversineObj as $row) {
                            $latArr[$i] = $row["locLatitude"];
                            $lngArr[$i] = $row["locLongitude"];
                            $id[$i] = $row["id"];
                                $i += 1;
                            }

                        //DistanceMatrix......................................................................
                            $distanceMatrix = $fn->distanceMatrix($latArr,$lngArr,$this->locLatitude, $this->locLongitude);


                        /////////////-------------------------------------------Message formation------------------------------------------///////////////////////////////////////
                            for ($x = 0; $x < $loopLength; $x++) {
                            
                            $distance = $distanceMatrix['rows'][$x]['elements'][0]['distance']['text'];
                            $travelTime = $distanceMatrix['rows'][$x]['elements'][0]['duration']['text'];
                            $sourceLat = $latArr[$x];
                            $sourceLng = $lngArr[$x];
                            $destinationTxt = $distanceMatrix['destination_addresses'][0];
                            $notificationMsg = '{"emergencyType": "'.$this->emergencyType.'", "timeDate" : "'.$this->timeDate.'",
                                                "destination" : {"lat" : '.$this->locLatitude.', "lng" : '.$this->locLongitude.'},
                                                "source" : {"lat" : '.$sourceLat.', "lng" : '.$sourceLng.'},
                                                "travelTime" : "'.$travelTime.'", "distance" : "'.$distance.'", "location" : "'.$destinationTxt.'",
                                                "ownerName" : "'.$this->ownerName.'", "mobNo" : '.$this->mobNo.', "carNo" : "'.$this->carNo.'",
                                                "carModel" : "'.$this->carModel.'", "carColor" : "'.$this->carColor.'", "ownerAddress" : "'.$this->ownerAddress.'"}';
                            $rescueid = "".$pre.$id[$x];
                        
                        //Notify..........................................................................
                            $notify = $fn->notify($notificationMsg, $rescueid, $table);

                        //Don't wait for police station and civil office
                            if($table == "hospital" || $table == "carworkshop"){
                            // sleep(50);
                            for ($y = 0; $y <= 6; $y++){
                                sleep(6);

                                $rescueCenterResponce = $fn->checkResponce($notify, $y);                //$y is a Counter 7*10 = 60sec---------------
                                if($rescueCenterResponce == "Accepted" || $rescueCenterResponce == "Rejected" ){
                                    // echo $rescueCenterResponce." y = ".$y." x = ".$x;
                                    break;
                                }

                            }

                            if($rescueCenterResponce == "Accepted"){
                                // date_default_timezone_set('Asia/Kolkata');
                                // echo date('h:i:s');
                                //echo"response accepted";
                                break;
                            }
                        }else{
                            sleep(30);

                            $rescueCenterResponce = $fn->checkSingleResponce($notify);
                        }
                        //$rescueCenterId = $request->getParam('rescueCenterId');
                        }
                            return($rescueCenterResponce);

                        }                    
                        
                    }        



                //THIS FUNCTION WILL PUT AN ENTRY INTO TABLE emergencyLog
                public function putLogEntry($responded){

                $sql = "INSERT INTO EmergencyLog (ownerName, ownerAddress, mobNo,
                                                    carNo, carModel, carColor,
                                                    locLatitude, locLongitude, emergencyType,
                                                    timeDate, responded) 
                            VALUES (:ownerName, :ownerAddress, :mobNo, 
                                    :carNo, :carModel, :carColor,
                                    :locLatitude, :locLongitude, :emergencyType, 
                                    :timeDate, :responded)";

                        try{
                        //Get DB Object........
                        $db = new db();

                        //Connect............
                        $db = $db->connect();

                        //Prepared statement.......
                        $stmt = $db->prepare($sql);

                        //Binding values............
                        $stmt->bindParam(':ownerName', $this->ownerName);
                        $stmt->bindParam(':ownerAddress', $this->ownerAddress);
                        $stmt->bindParam(':mobNo', $this->mobNo);
                        $stmt->bindParam(':carNo', $this->carNo);
                        $stmt->bindParam(':carModel', $this->carModel);
                        $stmt->bindParam(':carColor', $this->carColor);
                        $stmt->bindParam(':locLatitude', $this->locLatitude);
                        $stmt->bindParam(':locLongitude', $this->locLongitude);
                        $stmt->bindParam(':emergencyType', $this->emergencyType);
                        $stmt->bindParam(':timeDate', $this->timeDate);
                        $stmt->bindParam(':responded', $responded);
                        $stmt->execute();

                        // echo '{"Result": "Success", "Message" : "'.$message.'"}';

                        } catch(PDOException $e){
                        // echo '{"error": {"text":'.$e->getMessage().'}';

                        }

            }
        }
    

