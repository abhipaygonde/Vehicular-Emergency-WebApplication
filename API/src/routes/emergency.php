<?php

//THIS CODE WILL ACCEPT THE DATA FROM RASPBERRY PIE AND WORK ACCORDINGLY
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;



$app->post('/emergency', function (Request $request, Response $response) {
    
    //Fetching data
    $ownerName      = $request->getParam('ownerName');
    $ownerAddress   = $request->getParam('ownerAddress');
    $mobNo          = $request->getParam('mobNo');
    $carNo          = $request->getParam('carNo');
    $carModel       = $request->getParam('carModel');
    $carColor       = $request->getParam('carColor');
    $locLatitude    = $request->getParam('locLatitude');
    $locLongitude   = $request->getParam('locLongitude');
    $emergencyType  = $request->getParam('emergencyType');
    $timeDate       = $request->getParam('timeDate');

    //CHECK CONDITIONS--------------------------------------------------
        if($emergencyType == "Accident"){
            $table = "hospital";
            $table2 = "policestation";
            $pre = "hosp";
            $pre2 = "ps";
        }elseif($emergencyType == "Medical"){
            $table = "hospital";
            $table2 = "";
            $pre = "hosp";
            $pre2 = "null";
        }elseif($emergencyType == "Crimanal"){
            $table = "policestation";
            $table2 = "";
            $pre = "ps";
            $pre2 = "null";
        }elseif($emergencyType == "Civil"){
            $table = "policestation";//cv of
            $table2 = "civiloffice";
            $pre = "ps";
            $pre2 = "cvof";
        }elseif($emergencyType == "Mechanical"){
            $table = "carworkshop";//cr ws
            $table2 = "";
            $pre = "cws";
            $pre2 = "null";
        }

        $responded = "No";

        $hd = new handlers($ownerName, $ownerAddress, $mobNo, $carNo, $carModel, $carColor, $locLatitude, $locLongitude, $emergencyType, $timeDate);
            
        $response = $hd->handle($table, $pre);
        
        if($response == "noCenter"){
            $message = 'Sorry no '.$table.' is there near you in radius of 50 kilometer';
        }elseif($response == "Accepted"){
            $responded ="Yes";
            $message = 'A '.$table.' will contact you soon';
        }elseif($response == "Rejected"){
            $message = 'Sorry all '.$table.'s near you seems to be busy.';
        }elseif($response == "Pending"){
            $message = 'Sorry all '.$table.'s near you seems to be busy.';
        }elseif($response == "Sent" || $response == "Seen"){
            $responded ="Yes";
            $message = 'A message is sent to '.$table.'';
        }elseif($response == "Timeout"){
            $message = 'Sorry all '.$table.'s near you seems to be busy.';
        }


        // date_default_timezone_set('Asia/Kolkata');
        // echo "before dusra table";
        // echo date('h:i:s');
        

        if(!($table2 == "")){
            // echo"going for second center type";
            $response2 = $hd->handle($table2, $pre2);
            if($response2 == "noCenter"){
                $message = $message.' And sorry no '.$table2.' is there near you in radius of 50 kilometer.';
            }elseif($response2 == "Sent" || $response == "Seen"){
                $responded ="Yes";
                $message = $message.'and a message is sent to '.$table2.'';
            }
        }


        // echo "before log";
        // echo date('h:i:s');
        
        $hd->putLogEntry($responded);


        // echo "after log";
        // echo date('h:i:s');

 
        echo '{"Result": "Success", "Message" :'.$message.'}';


    });
