<?php
    require_once("db.php");

    class country extends db{
        function checkcountr($country_ID  ,$Country_Name){
            $country_ID   = (int)$country_ID;
            $Country_Name = addslashes($Country_Name);
            $sql="call sp_checkcountry( $country_ID , '$Country_Name' )";
            return $this->getData($sql)-> rowCount();
        }

        function savecountry($country_ID, $country_Name){
            if($this->checkcountr($country_ID ,$country_Name)){
                     return [
                        "status"  => "exists",
                        "message" => "country name already exists"
                     ];
            }
            $sql="call sp_savecountry(  $country_ID, 
             '$country_Name'
            )";
            $this->getData($sql);
            return [
                "status"  => "success",
                "message" => "country save success"
            ];

        }

        function getcountries(){
          $sql="call sp_getCountries() "  ;
          return $this->getJSON($sql);

        }

        function getcountrydetails( $country_ID){
             $sql="call sp_getCountryDetails ( $country_ID ) "  ;
             return $this->getJSON($sql); 

        }

        function deletecountry($country_ID){
                $sql="call sp_delete_country( $country_ID)";
                $this->getData($sql);
                 return [
                "status"  => "success",
                "message" => "country was deleted sucessfully"
            ];
        }
    }

?>