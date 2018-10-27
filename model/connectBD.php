<?php

$hostname = "localhost"; //ou localhost
$base     = "pweb18_";
$loginBD  = "pweb18_froment"; //ou "root"
$passBD   = "25051999";
$pdo      = null;
try {
    $pdo = new PDO("mysql:server=$hostname; dbname=$base; charset=UTF8", "$loginBD", "$passBD");
} catch (PDOException $e) {
    die("Echec de connexion : " . $e->getMessage() . "\n");
}
