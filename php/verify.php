<?php

//THIS CODE WILL VERIFY THE ENTRIES FROM FILE  register.html

// require '../../db/db.php';
require '../db/db.php';


header("Content-Type: application/json; charset=UTF-8");
$obj = json_decode($_POST["x"], false);


    //Fetching data
    $request = $obj->request;
    $value = $obj->value;

    if($request == "key"){
     $sql = "SELECT * FROM users WHERE unique_key = :value";
    }else if($request == "username"){

        // if($rescueType == "Hospital"){
        //     $table = "hospital";
        // }elseif($rescueType == "Police Station"){
        //     $table = "policestation";
        // }elseif($rescueType == "Civil Office"){
        //     $table = "civiloffice";
        // }  
     $sql = "SELECT * FROM users WHERE username = :value";
    }

    try{
        //Get DB Object........
        $db = new db();
        
        //Connect............
        $db = $db->connect();

        //Prepared statement.......
        $stmt = $db->prepare($sql);
        
        //Binding values............
            $stmt->bindParam(':value', $value);
       
        $stmt->execute();
        $data = $stmt->fetchAll();
        if($data){
            // print_r($data);
            foreach ($data as $row) {
                if($request == "username"){
                    echo '{ "Status":"Used"}';
                }else{
                    echo '{ "Status":"Verified", "Active" : '.$row['keyactive'].'}';
                }
            }
        }else{
            if($request == "username"){
                echo '{ "Status":"Available"}';
            }else{
                echo '{ "Status":"Invalid Key" }';
            }

        }


    } catch(PDOException $e){
        echo '{ "Status":"Failure" }';
    }

?>