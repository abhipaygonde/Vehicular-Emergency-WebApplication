<?php

    class db{
        //Proprties
        private $dbhost = '';
        private $dbuser = '';
        private $dbpass = '';
        private $dbname = '';

        //Connect
        public function connect(){
            $mysql_conn_str = "mysql:host=$this->dbhost;dbname=$this->dbname";
            $dbConnection = new PDO($mysql_conn_str, $this->dbuser, $this->dbpass);
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConnection;
        }
    }
?>
