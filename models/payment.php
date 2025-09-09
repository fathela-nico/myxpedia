<?php
    require_once("db.php");

    class Payment extends db {
        
        function checkPayment($payment_ID, $reference_Number){
            $payment_ID       = (int)$payment_ID;
            $reference_Number = addslashes($reference_Number);
            $sql = "CALL sp_checkPayment($payment_ID, '$reference_Number')";
            return $this->getData($sql)->rowCount();
        }

        function savePayment($payment_ID, $reference_Number, $amount, $user_ID){
            if ($this->checkPayment($payment_ID, $reference_Number)) {
                return [
                    "status"  => "exists",
                    "message" => "payment reference already exists"
                ];
            }

            $sql = "CALL sp_savePayment($payment_ID, '$reference_Number', $amount, $user_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "payment save success"
            ];
        }

        function getPayments(){
            $sql = "CALL sp_getPaymentMethodes()";
            return $this->getJSON($sql);
        }

        function getPaymentDetails($payment_ID){
            $sql = "CALL sp_getPaymentDetails($payment_ID)";
            return $this->getJSON($sql); 
        }

        function deletePayment($payment_ID){
            $sql = "CALL sp_deletePayment_Methode($payment_ID)";
            $this->getData($sql);

            return [
                "status"  => "success",
                "message" => "payment was deleted successfully"
            ];
        }

        function filterPayments($user_ID = null, $reference_Number = null){
            $user_ID          = $user_ID !== null ? (int)$user_ID : "NULL";
            $reference_Number = $reference_Number !== null ? addslashes($reference_Number) : "NULL";

            $sql = "CALL sp_filterPayments_Methode($user_ID, " . 
                ($reference_Number === "NULL" ? "NULL" : "'$reference_Number'") . ")";
            return $this->getJSON($sql);
        }

    }
?>
