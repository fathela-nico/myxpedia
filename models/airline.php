<?php
require_once("db.php");

class airline extends db {

    //  Check if airline exists (by ID or Name)
    function checkAirline($airline_ID, $airline_Name){
        $airline_ID   = (int)$airline_ID;
        $airline_Name = addslashes($airline_Name);

        $sql = "CALL sp_checkAirline('$airline_Name')";
        $result = $this->getData($sql);
        return $result->rowCount();
    }

    //  Save airline (insert)
    function saveAirline($airline_ID, $airline_Name, $country_ID){
        if ($this->checkAirline($airline_ID, $airline_Name)) {
            return [
                "status"  => "exists",
                "message" => "Airline name already exists"
            ];
        }

        $sql = "CALL sp_saveAirline($airline_ID, '$airline_Name', $country_ID)";
        $this->getData($sql);

        return [
            "status"  => "success",
            "message" => "Airline saved successfully"
        ];
    }

    //  Get all airlines
    function get_airlines(){
        $sql = "CALL sp_get_airlines()";
        return $this->getJSON($sql);
    }

    //  Get one airline details
    function getAirlineDetails($airline_ID){
        $airline_ID = (int)$airline_ID;
        $sql = "CALL sp_getAirlineDetails($airline_ID)";
        return $this->getJSON($sql);
    }

    //  Delete airline
    function delete_airline($airline_ID){
        $airline_ID = (int)$airline_ID;
        $sql = "CALL sp_delete_airline($airline_ID)";
        $this->getData($sql);

        return [
            "status"  => "success",
            "message" => "Airline was deleted successfully"
        ];
    }
}
?>
