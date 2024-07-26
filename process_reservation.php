<!-- ... HTML and header code ... -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Reservation</title>
    <link rel="stylesheet" href="room.css">
</head>
<body>
    <!--<header>
        <h1>Room Reservation</h1>
    </header>-->

    <main>
        <div class="reservation-container">
            <h1>Room Reservation</h1>
            <form id="reservationForm" action="" method="post">
                <!-- ... Other form inputs (check-in date, check-out date, guests, etc.) ... -->
                <label for="checkInDate">Check-in Date</label>
                <input type="date" id="checkInDate" name="checkInDate" required>

                <label for="checkOutDate">Check-out Date</label>
                <input type="date" id="checkOutDate" name="checkOutDate" required>

                <label for="roomType">Room Type</label>
                <select id="roomType" name="roomType" required>
                    <option value="single">Single Room</option>
                    <option value="deluxe">Deluxe Room</option>
                    <option value="esuite">Executive Suite</option>
                    <option value="psuite">Presidential Suite</option>
                </select>

                <label for="guests">Number of Guests:</label>
                <input type="number" id="guests" name="guests" min="1" max="6" value="1">

                <button type="submit" name="submit_booking">Reserve Room</button>
            </form>
        </div>
    </main>
</body>
</html>
<?php
// ... Database connection and other code ...
// Create a connection to your MySQL database
$connection = new mysqli('localhost', 'root', '1234', 'hotel_hotel');
if (isset($_GET['cid'])) {
    $cid = $_GET['cid'];
    //echo "Customer ID (cid): " . $cid . "<br>";

    // Use prepared statements to safely include the 'cid' value in the SQL query
    $sql = "SELECT * FROM customer WHERE cid = ?";
    $stmt = $connection->prepare($sql);
    $stmt->bind_param("i", $cid);
}
// Check for connection errors
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
// Check if the booking form was submitted
if (isset($_POST['submit_booking'])) {
    // Retrieve form data
    $check_in = $_POST['checkInDate'];
    $check_out = $_POST['checkOutDate'];
    $roomType = $_POST['roomType'];
    $guests = $_POST['guests'];

    // Find the corresponding room number (rno) based on the selected room type
    $roomSql = "SELECT rno FROM room WHERE type = ?";
    $stmt = $connection->prepare($roomSql);
    $stmt->bind_param("s", $roomType);
    $stmt->execute();
    $roomResult = $stmt->get_result();

    if ($roomResult->num_rows > 0) {
        $roomData = $roomResult->fetch_assoc();
        $rno = $roomData['rno'];

        // Insert booking data into the "booking" table
        $cid = $_GET['cid'];
        $sql = "INSERT INTO booking (cid, check_in, check_out, room_type, NO_OF_GUESTS) VALUES (?, ?, ?, ?, ?)";
        $stmt = $connection->prepare($sql);
        $stmt->bind_param("isssi", $cid, $check_in, $check_out, $roomType, $guests);

        if ($stmt->execute()) {
            // Get the booking ID (bid) of the newly inserted booking
            $bid = $stmt->insert_id;

            // Get the customer ID (cid) from the URL
            $cid = $_GET['cid'];

            // Insert data into the "reservation" table
            $reservationSql = "INSERT INTO reservation (cid, bid, rno) VALUES (?, ?, ?)";
            $stmt = $connection->prepare($reservationSql);
            $stmt->bind_param("iii", $cid, $bid, $rno);

            if ($stmt->execute()) {
                // Redirect to a confirmation page or any other desired page
                header("Location:cono.php?cid=$cid&bid=$bid&rno=$rno");
                exit;
            } else {
                echo "Error: " . $stmt->error;
            }
        } else {
            echo "Error: " . $stmt->error;
        }
    } else {
        echo "Room not found for the selected room type.";
    }

    // Close the prepared statement
    $stmt->close();
}

// Close the database connection
$connection->close();
?>