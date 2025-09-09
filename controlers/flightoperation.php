<?php

    require_once("../models/flights.php");
    $flight = new Flight();

    // Save (insert/update) flight
    if (isset($_POST['saveflight'])) {
        $flightid     = $_POST['flightid'] ?? 0;
        $flightnumber = $_POST['flightnumber'] ?? '';
        $airportid    = $_POST['airportid'] ?? 0;

        $response = $flight->saveflight($flightid, $flightnumber, $airportid);
        echo json_encode($response);
    }

    // Delete flight
    if (isset($_POST['deleteflight'])) {
        $flightid = $_POST['flightid'] ?? 0;
        $response = $flight->deleteflight($flightid);
        echo json_encode($response);
    }

    // Get all flights
    if (isset($_GET['getflights'])) {
        echo $flight->getflights();
    }

    // Get one flight details
    if (isset($_GET['getflightdetails'])) {
        $flightid = $_GET['flightid'] ?? 0;
        echo $flight->getflightdetails($flightid);
    }

    // Filter flights (by airport or flight number)
    if (isset($_GET['filterflights'])) {
        $airportid     = $_GET['airportid'] ?? null;
        $flightnumber  = $_GET['flightnumber'] ?? null;
        echo $flight->filterflights($airportid, $flightnumber);
    }

?>
