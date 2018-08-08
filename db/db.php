<?php

    class db{
        //Proprties
        private $dbhost = 'localhost';
        private $dbuser = 'id6154337_sachin123';
        private $dbpass = 'sachin123';
        private $dbname = 'id6154337_project';

        //Connect
        public function connect(){
            $mysql_conn_str = "mysql:host=$this->dbhost;dbname=$this->dbname";
            $dbConnection = new PDO($mysql_conn_str, $this->dbuser, $this->dbpass);
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConnection;
        }
    }
?>