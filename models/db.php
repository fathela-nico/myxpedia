<?php 
session_start();

class db {
    private $servername;
    private $databasename;
    private $username;
    private $password;
    private $charset;
    private $port;

    function connect(){
        $this->servername   = 'localhost';
        $this->databasename = 'xpedia';
        $this->username     = 'root';
        $this->password     = '';
        $this->charset      = 'utf8mb4';
        $this->port         = 3307; // ✅ Important for your setup

        try {
            // ✅ Include port explicitly
            $dsn = "mysql:host={$this->servername};port={$this->port};dbname={$this->databasename};charset={$this->charset}";
            $pdo = new PDO($dsn, $this->username, $this->password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        } catch (PDOException $e) {
            die('Connection failed: '.$e->getMessage());
        }
    }

    function getData($sql){
        $conn = $this->connect();
        if ($conn) {
            return $conn->query($sql);
        }
        return null;
    }

    function getJSON($sql){
        $rst = $this->getData($sql);
        if ($rst) {
            return json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
        }
        return json_encode([]);
    }
}
?>
