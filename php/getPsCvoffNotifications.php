<?php

//SESSION KA KAAM BAKI HAI--------

    // require("../../db/db.php");
    require("../db/db.php");

    session_start();

    if(isset($_SESSION["unique_key"])){

    if(isset($_GET["Id"])){
        notificationAction($_GET["Id"]);
    }elseif(isset($_GET["lastId"])){

        //$rescueCenterId = $_SESSION["rescueCenterId"];
        $rescueCenterId = $_SESSION["notId"];
        $lastId = $_GET["lastId"];

        getNotification($rescueCenterId, $lastId);
    }

}

    function getNotification($rescueCenterId, $lastId)
    {
        //PREPARE QUERY-----------------------------------------------------
     
            $sql = 'SELECT * FROM notifications WHERE rescueid = :rescueid AND id > :lastId ORDER BY id DESC';
  
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
                $counter = 0;
               // echo"data ki length \n".count($data);
                echo'{"Status":"Success", "row": [';
                
                foreach ($data as $row) {
                        $message = $row['message'];
                        echo'{"Message":'.$message.', "id":'.$row["id"].', "response" : "'.$row["response"].'"}';
                        $counter++; 
                        if($counter == count($data)){
                          //do nothing  
                        }else{
                            echo',';
                        }
                }
                echo'], "totalRows" :'.$counter.'}';
            }else{
                echo'{"Status":"Failure", "Message":"There are no notifications for you right you."}';
            }
            } catch(PDOException $e){
                // echo $e;
                echo'{"Status":"Failure", "Message" : "Something went wrong while fetching notifications."}';
            }


    }


    function notificationAction($id){
        $update = 'UPDATE notifications SET response = "Seen" WHERE id = :id';
  
        try{
        //Get DB Object........
        $db = new db();
        //Connect............
        $db = $db->connect();

        //Prepared statement.......
        $stmt = $db->prepare($update);

        //Binding values............    
        $stmt->bindParam(':id', $id);
        
        //$stmt->bindParam(':tableName', $tableName);
        $stmt->execute();
        if($data = $stmt->fetchAll()){
            //return $data["response"];
            // foreach ($data as $row) {
            //     if($row["response"] == "Timeout"){
            //         echo'{"Status":"Failure", "Message":"Oops. You got late to respond :("}';
            //         die();
            //     }elseif($row["response"] == "Pending"){

            //         if($response == "Accepted")
            //             $message = "Thank you so much for helping :)";
            //         else
            //             $message = "Request rejected :(";



            //         $stmt1->bindParam(':response', $response);
            //         $stmt1->execute();
            //         echo'{"Status":"'.$response.'", "Title":"Done" , "Message":"'.$message.'"}';
            //         die();
            //     }
            // }

            echo'{"Status":"Failure", "Message":"Response submitted"}';

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

