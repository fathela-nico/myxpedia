<?php
    require_once("db.php");

    class flight extends db {
        
        function checkflight($flight_ID, $flight_Number){
            $flight_ID     = (int)$flight_ID;
            $flight_Number = addslashes($flight_Number);
            $sql = "CALL sp_checkFlight($flight_ID, '$flight_Number')";
            return $this->getData($sql)->rowCount();
        }

        function saveflight($flight_ID, $flight_Number, $airport_ID){
            if ($this->checkflight($flight_ID, $flight_Number)) {
                return [
                    "status"  => "exists",
                    "message" => "flight number already exists"
                ];
            }

            $sql = "CALL sp_saveFlight($flight_ID, '$flight_Number', $airport_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "flight save success"
            ];
        }

        function getflights(){
            $sql = "CALL sp_getFlights()";
            return $this->getJSON($sql);
        }

        function getflightdetails($flight_ID){
            $sql = "CALL sp_getFlightDetails($flight_ID)";
            return $this->getJSON($sql); 
        }

        function deleteflight($flight_ID){
            $sql = "CALL sp_deleteFlight($flight_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "flight was deleted successfully"
            ];
        }

        function filterflights($airport_ID = null, $flight_Number = null){
            $airport_ID     = $airport_ID !== null ? (int)$airport_ID : "NULL";
            $flight_Number  = $flight_Number !== null ? addslashes($flight_Number) : "NULL";

            $sql = "CALL sp_filterFlights($airport_ID, " . 
                ($flight_Number === "NULL" ? "NULL" : "'$flight_Number'") . ")";
            return $this->getJSON($sql);
        }

    }
?>
