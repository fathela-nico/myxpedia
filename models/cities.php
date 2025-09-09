<?php
    require_once("db.php");

    class city extends db {
        
        function checkcity($city_ID, $city_Name){
            $city_ID   = (int)$city_ID;
            $city_Name = addslashes($city_Name);
            $sql = "CALL sp_checkCity($city_ID, '$city_Name')";
            return $this->getData($sql)->rowCount();
        }

        function savecity($city_ID, $city_Name, $country_ID){
            if ($this->checkcity($city_ID, $city_Name)) {
                return [
                    "status"  => "exists",
                    "message" => "city name already exists"
                ];
            }

            $sql = "CALL sp_saveCity($city_ID, '$city_Name', $country_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "city save success"
            ];
        }

        function getcities(){
            $sql = "CALL sp_getCities()";
            return $this->getJSON($sql);
        }

        function getcitydetails($city_ID){
            $sql = "CALL sp_getCityDetails($city_ID)";
            return $this->getJSON($sql); 
        }

        function deletecity($city_ID){
            $sql = "CALL sp_deleteCity($city_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "city was deleted successfully"
            ];
        }


        function filtercities($country_ID = null, $city_Name = null){
            $country_ID = $country_ID !== null ? (int)$country_ID : "NULL";
            $city_Name  = $city_Name !== null ? addslashes($city_Name) : "NULL";

            $sql = "CALL sp_filterCities($country_ID, " . 
                ($city_Name === "NULL" ? "NULL" : "'$city_Name'") . ")";
            return $this->getJSON($sql);
        }

    }
?>
