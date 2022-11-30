<?php
namespace OOP\App;

class Database {

    protected static $conn; // menggunakan static agar dapat dipanggil secara langsung
    protected static $username = 'root';
    protected static $password = '';
    protected static $dbname   = 'db_staditek_m11';
    protected static $hostname = 'localhost';

    public function __construct()
    {
        Database::setConnection();
    }


    public static function setConnection(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".self::$dbname, 
            self::$username,
            self::$password
        );
        self::$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function setConnection2(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".self::$dbname, 
            self::$username,
            self::$password
        );


        self::$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function getConnection(){
        return self::$conn;
    }

}

?>