<?php

//SESSION KA KAAM BAKI HAI--------

    // require("../../db/db.php");
    require("../db/db.php");
    session_start();
    if(isset($_SESSION["unique_key"])){

        if(isset($_GET["Id"]) && isset($_GET["Action"])){
            if($_GET["Action"] == "Accept")
                $response = "Accepted";
            else
                $response = "Rejected";

            notificationAction($_GET["Id"], $response);
        }else{

            //$rescueCenterId = $_SESSION["rescueCenterId"];
            $rescueCenterId = $_SESSION["notId"];
            $lastId = $_GET["lastId"];
            getNotification($rescueCenterId, $lastId);
        }
        
    }



    function getNotification($rescueCenterId, $lastId)
    {
        //PREPARE QUERY-----------------------------------------------------
     
           $sql = 'SELECT * FROM notifications WHERE (rescueid = :rescueid && response = "Pending" && id > :lastId) ORDER BY id DESC LIMIT 1';
  
            try{
            //Get DB Object........
            $db = new db();
            //Connect............
            $db = $db->connect();

            //Prepared statement.......
            $stmt = $db->prepare($sql);


            //Binding values............    
            $stmt->bindParam(':rescueid', $rescueCenterId);
            $stmt->bindParam(':lastId', $lastId);
            //$stmt->bindParam(':tableName', $tableName);
            $stmt->execute();
            if($data = $stmt->fetchAll()){
                //return $data["response"];
                foreach ($data as $row) {
                        $message = $row['message'];
                        echo'{"Status":"Success", "Message":'.$message.', "id":'.$row["id"].'}';
                }
            }else{
                echo'{"Status":"Failure", "Message":"There are no notifications for you right you."}';
            }
            } catch(PDOException $e){
                // echo $e;
                echo'{"Status":"Failure", "Message" : "Something went wrong while fetching notifications."}'.$e;
            }


    }


    function notificationAction($id, $response){
        $select = 'SELECT * FROM notifications WHERE id = :id';
        $update = 'UPDATE notifications SET response = :response WHERE id = :id';
  
        try{
        //Get DB Object........
        $db = new db();
        //Connect............
        $db = $db->connect();

        //Prepared statement.......
        $stmt = $db->prepare($select);
        $stmt1 = $db->prepare($update);

        //Binding values............    
        $stmt->bindParam(':id', $id);
        $stmt1->bindParam(':id', $id);
        
        //$stmt->bindParam(':tableName', $tableName);
        $stmt->execute();
        if($data = $stmt->fetchAll()){
            //return $data["response"];
            foreach ($data as $row) {
                if($row["response"] == "Timeout"){
                    echo'{"Status":"Failure", "Message":"Oops. You got late to respond :("}';
                    die();
                }elseif($row["response"] == "Pending"){

                    if($response == "Accepted")
                        $message = "Thank you so much for helping :)";
                    else
                        $message = "Request rejected :(";



                    $stmt1->bindParam(':response', $response);
                    $stmt1->execute();
                    echo'{"Status":"'.$response.'", "Title":"Done" , "Message":"'.$message.'"}';
                    die();
                }
            }

        }else{
            echo'{"Status":"Failure", "Message":"I think there is something wrong with this emergency"}';
            die();
        }
        } catch(PDOException $e){
            // echo $e;
            echo'{"Status":"Failure", "Message" : "Something went wrong while performing action. Please contact the needy manually."}';
            die();
        }

    }

