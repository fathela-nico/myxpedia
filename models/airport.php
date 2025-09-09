<?php
require_once("db.php");

class Airport extends db {

    function checkAirport($airport_ID, $airport_Name){
        $airport_ID   = (int)$airport_ID;
        $airport_Name = addslashes($airport_Name);
        $sql = "CALL sp_checkAirport($airport_ID, '$airport_Name')";
        return $this->getData($sql)->rowCount();
    }

   function saveAirport($airport_ID, $airport_Name, $city_ID) {
    if ($this->checkAirport($airport_ID, $airport_Name)) {
        return [
            "status"  => "exists",
            "message" => "Airport already exists"
        ];
    }

    // Handle blank city ID 
    $city_ID = !empty($city_ID) ? (int)$city_ID : "NULL";

    $sql = "CALL sp_saveairport($airport_ID, '$airport_Name', $city_ID)";
    $this->getData($sql);
    return [
        "status"  => "success",
        "message" => "Airport saved successfully"
    ];
}


    function get_airport(){
        $sql = "CALL sp_get_airports()";
        return $this->getJSON($sql);
    }

    function getAirportDetails($airport_ID){
        $sql = "CALL sp_getairportDetails($airport_ID)";
        return $this->getJSON($sql);
    }

    function delete_airport($airport_ID){
        $sql = "CALL sp_delete_airport($airport_ID)";
        $this->getData($sql);
        return [
            "status"  => "success",
            "message" => "Airport was deleted successfully"
        ];
    }

     function filter_airport($city_ID = null, $airport_Name = null){
        $city_ID = $city_ID !== null ? (int)$city_ID : "NULL";
        $airport_Name = $airport_Name !== null ? ("'".addslashes($airport_Name)."'") : "NULL";
        $sql = "CALL sp_filterAirport($city_ID, $airport_Name)";
        return $this->getJSON($sql);
    }
}
?>
