<?php
require_once("db.php");

class Booking extends db {

    // Check if booking exists
   function checkBooking($booking_ID, $customer_ID, $flight_ID){
    $booking_ID   = (int)$booking_ID;
    $customer_ID  = (int)$customer_ID;
    $flight_ID    = (int)$flight_ID;

    $sql = "CALL sp_checkBooking($booking_ID, $customer_ID, $flight_ID)";
    return $this->getData($sql)->rowCount();
}


    // Save booking
    function saveBooking($booking_ID, $customer_ID, $flight_ID, $bookingClass_ID, $booking_Date) {
        if ($this->checkBooking($booking_ID, $customer_ID, $flight_ID, $bookingClass_ID, $booking_Date)) {
            return [
                "status"  => "exists",
                "message" => "Booking already exists"
            ];
        }

        $sql = "CALL sp_saveBooking($booking_ID, $customer_ID, $flight_ID, $bookingClass_ID, '$booking_Date')";
        $this->getData($sql);
        return [
            "status"  => "success",
            "message" => "Booking saved successfully"
        ];
    }

    // Get all bookings
    function get_bookings() {
        $sql = "CALL sp_getBookings()";
        return $this->getJSON($sql);
    }

    // Get booking details
    function getBookingDetails($booking_ID) {
        $booking_ID = (int)$booking_ID;
        $sql = "CALL sp_getBookingDetails($booking_ID)";
        return $this->getJSON($sql);
    }

    // Delete booking
    function delete_booking($booking_ID) {
        $booking_ID = (int)$booking_ID;
        $sql = "CALL sp_deleteBooking($booking_ID)";
        $this->getData($sql);
        return [
            "status"  => "success",
            "message" => "Booking deleted successfully"
        ];
    }
}
?>
