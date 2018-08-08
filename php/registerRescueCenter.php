<?php

//THIS CODE WILL REGISTER NEW USER IN RELATIVE TABLE IN DATABASE "PROJECT"

// require '../../db/db.php';                  //THIS WILL INCLUDE db.php WHICH CONTAINS CLASS WHICH CONTACTS  TO DATABASE MYSQL
require '../db/db.php';                  //THIS WILL INCLUDE db.php WHICH CONTAINS CLASS WHICH CONTACTS  TO DATABASE MYSQL
header("Content-Type: application/json; charset=UTF-8");
$obj = json_decode($_POST["x"], false);


    //Fetching data
    $rescueType = $obj->rescueType;
    $rescueName = htmlentities($obj->rescueName);
    $mobileNo   = $obj->mobileNo;
    $phoneNo    = $obj->phoneNo;
    $address    = htmlentities($obj->address);
    $city       = htmlentities($obj->city);
    $pincode    = $obj->pincode;
    $state      = htmlentities($obj->state);
    $latitude   = $obj->latitude;
    $longitude  = $obj->longitude;
    $username   = htmlentities($obj->userName);
    $password   = htmlentities($obj->password);
    $uniqueKey  = $obj->uniqueKey;

    //CHECK CONDITIONS--------------------------------------------------
    if($rescueType == "Hospital"){
        $table = "hospital";
    }elseif($rescueType == "Police Station"){
        $table = "policestation";
    }elseif($rescueType == "Civil Office"){
        $table = "civiloffice";
    }elseif($rescueType == "Car Workshop"){
        $table = "carworkshop";
    }

    $contactNo = '"Mobile" : "'.$mobileNo.'", "Phone" : "'.$phoneNo.'"';



    //PREPARE QUERY-----------------------------------------------------
    $sql = "INSERT INTO $table (centerName, locLatitude, locLongitude,
                                contactNo, address,city,
                                pincode, state
                                )
                        VALUES (
                            :rescueName, :latitude, :longitude,
                            :contactNo, :address, :city,
                            :pincode, :state
                        )";

    $keyUpdate = "UPDATE users SET keyactive = 1,
                                        username = :username,
                                        password = :password,
                                        rescuetype = :rescuetype,
                                        rescueid = :rescueid
                                        WHERE unique_key = :uniqueKey";

try{
    //Get DB Object........
    $db = new db();
    
    //Connect............
    $db = $db->connect();

    //Prepared statement.......
    $stmt = $db->prepare($sql);
    $stmt1 = $db->prepare($keyUpdate);

    //Binding values............
    $stmt->bindParam(':rescueName', $rescueName);
    $stmt->bindParam(':latitude', $latitude);
    $stmt->bindParam(':longitude', $longitude);
    $stmt->bindParam(':contactNo', $contactNo);
    $stmt->bindParam(':address', $address);
    $stmt->bindParam(':city', $city);
    $stmt->bindParam(':pincode', $pincode);
    $stmt->bindParam(':state', $state);
    $stmt->execute();
    $rescueid = $db->lastInsertId();

    $stmt1->bindParam(':uniqueKey', $uniqueKey);
    $stmt1->bindParam(':username', $username);
    $stmt1->bindParam(':password', $password);
    $stmt1->bindParam(':rescuetype', $table);
    $stmt1->bindParam(':rescueid', $rescueid);


    $stmt1->execute();

    echo '{ "Status":"Success", "Message":"Registred :)"}';
    $resObj[] = array(
        'Status' => 'Success',
        'Message' => 'Registered :)'
    );
   // $responce = '"Status":"Success","Message":"Registration successfull"';
    //echo "<h1>hello</h1>";
} catch(PDOException $e){
   // echo '{ "Status":"Failure", "Message":"Some error occured :("}';
   echo $e;
}

?>