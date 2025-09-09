<?php

    require_once("../models/cities.php");
    $city = new City();

    if (isset($_POST['savecity'])) {
        $cityid     = $_POST['cityid'] ?? 0;
        $cityname   = $_POST['cityname'] ?? '';
        $countryid  = $_POST['countryid'] ?? 0;

        $response = $city->savecity($cityid, $cityname, $countryid);
        echo json_encode($response);
    }

    if (isset($_POST['deletecity'])) {
        $cityid = $_POST['cityid'] ?? 0;
        $response = $city->deletecity($cityid);
        echo json_encode($response);
    }

    if (isset($_GET['getcities'])) {
        echo $city->getcities();
    }

    if (isset($_GET['getcitydetails'])) {
        $cityid = $_GET['cityid'] ?? 0;
        echo $city->getcitydetails($cityid);
    }

    if (isset($_GET['filtercity'])) {
        $countryid = $_GET['countryid'] ?? null;
        $cityname  = $_GET['cityname'] ?? null;
        echo $city->filtercities($countryid, $cityname);
    }

?>
