<?php

    require_once("../models/airport.php");
    $airport = new Airport();

   if (isset($_POST['saveairport'])) {
    $airportid   = $_POST['airportid'] ?? 0;
    $airportname = $_POST['airportname'] ?? '';
    $countryid   = $_POST['countryid'] ?? 0;

    $response = $airport->saveAirport($airportid, $airportname, $countryid);
    echo json_encode($response);
}

if (isset($_POST['deleteairport'])) {
    $airportid = $_POST['airportid'] ?? 0;
    $response = $airport->delete_airport($airportid);
    echo json_encode($response);
}

if (isset($_GET['getairports'])) {
    echo $airport->get_airport();
}

if (isset($_GET['getairportdetails'])) {
    $airportid = $_GET['airportid'] ?? 0;
    echo $airport->getAirportDetails($airportid);
}

if (isset($_GET['filterairport'])) {
    $cityid      = $_GET['cityid'] ?? null;
    $airportname = $_GET['airportname'] ?? null;
    echo $airport->filter_airport($cityid, $airportname);
}

?>