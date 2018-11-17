<?php

$hostname = "localhost"; //ou localhost
$base     = "pweb2";
$loginBD  = "root"; //ou "root"
$passBD   = "";
$pdo      = null;
try {
    $pdo = new PDO("mysql:server=$hostname; dbname=$base; charset=UTF8", "$loginBD", "$passBD");
} catch (PDOException $e) {
    die("Echec de connexion : " . $e->getMessage() . "\n");
}
