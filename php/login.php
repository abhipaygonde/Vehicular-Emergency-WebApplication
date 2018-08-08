<?php
                    @session_start();

//THIS CODE WILL ACCEPT DATA FROM LOGIN.HTML AND AUTHENTICATE....................................
// require '../../db/db.php';
 require '../db/db.php';




//Entry point***********************************************************************************
 if(isset($_POST["x"])){

        $obj = json_decode($_POST["x"], false);
        //Fetching data
        $username = $obj->username;
        $password = $obj->password;
        $remember = $obj->remember;

        $success = login($username, $password);

        if($success == true){
            if($remember = true){
                // echo "remember kiya";
                setcookie("Admin", $_SESSION["unique_key"], time() + (86400 * 30), "/"); // 86400 = 1 day
            }
            echo'{"Status" : "Success", "Message" : "Login successful :)", "RescueType" : "'.$_SESSION["rescueCenterType"].'"}';
        }elseif($success == false){
            echo'{"Status" : "Failure", "Message" : "Wrong login credentials :( "}';
        }elseif($success == "err"){
            echo'{"Status" : "Failure", "Message" : "Problem with system, Try after some time :( "}';
        }


    }
    
   elseif(isset($_COOKIE["Admin"])) {

        $unique_key = $_COOKIE["Admin"];
    $success = autoLogin($unique_key);

    if($success == true){
            setcookie("Admin", $unique_key, time() + (86400 * 30), "/"); // 86400 = 1 day
            echo'{"Status" : "Success", "Message" : "Login successful with auto login :)", "RescueType" : "'.$_SESSION["rescueCenterType"].'"}';
    }else{
            echo'{"Status" : "Failure", "Message" : "Login again :)"}';
    }
        die();
    }
    
    
    
    
    else{
        echo'{"Status" : "Failure", "Message" : "Login again :)"}';
    }





//LOGIN FUNCTION********************************************************************************
        function login($username, $password){
            //Create query........................................
            $sql = "SELECT * FROM users WHERE username = :username && password = :password";
            try{
                //Get DB Object........
                $db = new db();
                
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);
            
                //Binding values............
                $stmt->bindParam(':username', $username);

                $stmt->bindParam(':password', $password);

                $stmt->execute();
                $data = $stmt->fetchAll();
                if($data){
                 foreach($data as $row){
                    $res = createSession($row);
                    if($res == true)
                        return true;
                    else{
                        echo'{"Status" : "Failure", "Message" : "Cannot start session!"}';
                        die();
                    }
                }
            }else{
                    return false;
                }


            } catch(PDOException $e){
                return "err";
            }
        }





//AUTO LOGIN FUNCTION***************************************************************************
        function autoLogin($unique_key){

            $sql = "SELECT * FROM users WHERE unique_key = :unique_key";
            try{
                //Get DB Object........
                $db = new db();
                
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);    
                $stmt->bindParam(':unique_key', $unique_key);

                $stmt->execute();
                $data = $stmt->fetchAll();

                if($data){
                    // print_r($data);
                    foreach($data as $row){
                        if($row["username"] == "" && $row["password"] == ""){
                            return false;
                        }else{
                            $res = createSession($row);
                            if($res == true)
                                return true;
                            else{
                                echo'{"Status" : "Failure", "Message" : "Cannot start session!"}';
                                die();
                            }

                        }
                    }
                }else{
                    return false;
                }


            } catch(PDOException $e){
                echo "exception de rha hai : ".$e;

                return "err";
            }
        }






//CREATE SESSION FUNCTION********************************DONO ISE ACCESS KRENGE***************************************
        function createSession($param){
            $table = $param["rescuetype"];
            $id = $param["rescueid"];
            $sql = "SELECT * FROM $table WHERE id = $id";
            
            
            
            try{
                //Get DB Object........
                $db = new db();
                
                //Connect............
                $db = $db->connect();

                //Prepared statement.......
                $stmt = $db->prepare($sql);            
                $stmt->execute();
                $data = $stmt->fetchAll();
                
                // echo"create session me hu";
                
                if($data){
                    foreach($data as $row);
                    // $row = $data[0];
                    $_SESSION["centerName"] = $row["centerName"];
                    $_SESSION["lat"] = $row["locLatitude"];
                    $_SESSION["lng"] = $row["locLongitude"];
                    $_SESSION["contactNo"] = $row["contactNo"];
                    $_SESSION["address"] = $row["address"];
                    $_SESSION["city"] = $row["city"];
                    $_SESSION["pincode"] = $row["pincode"];
                    $_SESSION["state"] = $row["state"];
                    $_SESSION["rescueid"] = $id;        //rescue table se rescueCenter ka id
                    $_SESSION["unique_key"] = $param["unique_key"]; //Userid from users table
                    $_SESSION["rescueCenterType"] = $table;

                    // echo("session ko dikha rha hu".$_SESSION["rescueCenterType"]);

                    //notId for notifications table.......
                    if($table == "hospital"){
                        $_SESSION["notId"] = "hosp".$id;
                    }elseif($table == "policestation"){
                        $_SESSION["notId"] = "ps".$id;
                    }elseif($table == "carworkshop"){
                        $_SESSION["notId"] = "cws".$id;
                    }elseif($table == "civiloffice"){
                        $_SESSION["notId"] = "cvof".$id;
                    }

                    //contact number split kiye
                    $contact = json_decode($row["contactNo"], false);
                    // $_SESSION["mobNo"] = $contact->Mobile;
                    // $_SESSION["phoneNo"] = $contact->Phone;
                    

                    return true;
                    
                }else{
                    echo"false bheja";
                    return false;
                }


            } catch(PDOException $e){
                echo"idhar err hai ".$e;
                return "err";
            }

        }



        
?>