<?php


header('Access-Control-Allow-Methods: GET, POST');
include("functions.php");

if (isset($_POST['katID']) && isset($_POST['ime'])  && isset($_POST['cena']) && isset($_POST['url'])) {


    $katID = $_POST['katID'];
    $ime = $_POST['ime'];
    $cena = $_POST['cena'];
    $url = $_POST['url'];
    


    echo addProizvod($katID, $ime,  $cena, $url);
}


?>