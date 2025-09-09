<?php

    require_once("../models/booking.php");
    $booking = new Booking();

    // Save Booking
    if (isset($_POST['savebooking'])) {
        $bookingid      = $_POST['bookingid'] ?? 0;
        $customerid     = $_POST['customerid'] ?? 0;
        $flightid       = $_POST['flightid'] ?? 0;
        $bookingclassid = $_POST['bookingclassid'] ?? 0;
        $bookingdate    = $_POST['bookingdate'] ?? '';
        $bookingdate = $_POST['bookingdate'] ?? null; // accept null if not set

        if (empty($bookingdate)) {
            $bookingdate = date('Y-m-d H:i:s');
        }

$response = $booking->saveBooking($bookingid, $customerid, $flightid, $classid, $bookingdate);


        $response = $booking->saveBooking($bookingid, $customerid, $flightid, $bookingclassid, $bookingdate);
        echo json_encode($response);
    }

    // Delete Booking
    if (isset($_POST['deletebooking'])) {
        $bookingid = $_POST['bookingid'] ?? 0;
        $response = $booking->delete_booking($bookingid);
        echo json_encode($response);
    }

    // Get all bookings
    if (isset($_GET['getbookings'])) {
        echo $booking->get_bookings();
    }

    // Get booking details
    if (isset($_GET['getbookingdetails'])) {
        $bookingid = $_GET['bookingid'] ?? 0;
        echo $booking->getBookingDetails($bookingid);
    }

?>
