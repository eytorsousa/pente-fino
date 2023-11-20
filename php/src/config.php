<?php
#$servername = $_ENV['DB_HOST'];
$username = $_ENV['MYSQL_USER'];
$password = $_ENV['MYSQL_PASSWORD'];
$dbName =  $_ENV['MYSQL_DATABASE'];
#$port= $_ENV['DB_PORT'];


try {
  $conn = new PDO("mysql:host=db;dbname=$dbName", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?> 