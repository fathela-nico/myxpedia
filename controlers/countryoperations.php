<?php
require_once("../models/countries.php");
$country = new Country();

if (isset($_POST['savecountry'])) {
    $countryid   = $_POST['countryid'] ?? null;
    $countryname = trim($_POST['countryname'] ?? '');

    // Handle blank input
    if ($countryname === '') {
        echo json_encode(["status" => "blank"]);
        exit;
    }

    $response = $country->savecountry($countryid, $countryname);
    echo json_encode($response);
}
?>
