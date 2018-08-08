<?php
    @session_start();

    if($_SERVER['REQUEST_METHOD'] == "GET"){

        if(isset($_GET["x"]) && $_GET["x"] == "logout"){

            // $obj = json_decode($_GET["x"], false);

            // remove all session variables
            session_unset(); 

            // destroy the session 
            @session_destroy();
            setcookie("Admin", "", time() - 3600, "/"); // 86400 = 1 day

            echo '{"Status" : "Logged out"}';
        }else{
        if(isset($_SESSION["unique_key"])){
            echo '{"Status" : "Accept", "RescueType" : "'.$_SESSION["rescueCenterType"].'"}';
        }else{
            echo '{"Status" : "Reject"}';
        }
    }
    }else{
            echo '{"Status" : "Reject"}';
    }