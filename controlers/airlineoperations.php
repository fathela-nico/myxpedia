<?php
require_once("../models/airline.php");

$airline = new Airline();

if (isset($_POST['saveairline'])) {
    $airlineid   = (int)($_POST['airlineid'] ?? 0);
    $airlinename = trim($_POST['airlinename'] ?? '');
    $countryid   = (int)($_POST['countryid'] ?? 0);

    $response = $airline->saveairline($airlineid, $airlinename, $countryid);
    echo json_encode($response);
    exit;
}
?>
