<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <link rel="stylesheet" type="text/css" href="confirmation.css">
</head>
<body>
    <header>
        <h1>Booking Confirmation</h1>
    </header>

    <main>
        <section>
            <h2>Thank You for Your Booking!</h2>
            <p>Your booking details:</p>
            <div id="booking-details">
                <?php
                // Check if the 'cid' and 'bid' parameters are present in the URL
                if (isset($_GET['cid']) && isset($_GET['bid'])) {
                    // Create a connection to your MySQL database
                    $connection = new mysqli('localhost', 'root', '1234', 'hotel_hotel');

                    // Check for connection errors
                    if ($connection->connect_error) {
                        die("Connection failed: " . $connection->connect_error);
                    }

                    // Get the 'cid' and 'bid' values from the URL
                    $cid = $_GET['cid'];
                    $bid = $_GET['bid'];

                    // Query to get customer data
                    $customerSql = "SELECT * FROM customer WHERE cid = $cid";
                    $customerResult = $connection->query($customerSql);

                    // Query to get booking data
                    $bookingSql = "SELECT * FROM booking WHERE bid = $bid";
                    $bookingResult = $connection->query($bookingSql);

                    // Check if data is found for both customer and booking
                    if ($customerResult->num_rows > 0 && $bookingResult->num_rows > 0) {
                        // Fetch the customer and booking data from the query results
                        $customerData = $customerResult->fetch_assoc();
                        $bookingData = $bookingResult->fetch_assoc();
                ?>
                <h2>Customer Details</h2>
                <p><strong>Name:</strong> <?php echo $customerData['name']; ?></p>
                <p><strong>Email:</strong> <?php echo $customerData['email']; ?></p>
                <p><strong>Phone Number:</strong> <?php echo $customerData['phone_no']; ?></p>
                <p><strong>Age:</strong> <?php echo $customerData['age']; ?></p>
                <p><strong>Gender:</strong> <?php echo $customerData['gender']; ?></p>

                <h2>Booking Details</h2>
                <p><strong>Check-in Date:</strong> <?php echo $bookingData['check_in']; ?></p>
                <p><strong>Check-out Date:</strong> <?php echo $bookingData['check_out']; ?></p>
                <p><strong>Room Type:</strong> <?php echo $bookingData['room_type']; ?></p>
                <p><strong>Number of Guests:</strong> <?php echo $bookingData['NO_OF_GUESTS']; ?></p>
                <?php
                    } else {
                        echo "Data not found for the provided Customer ID and Booking ID.";
                    }

                    // Close the database connection
                    $connection->close();
                } else {
                    echo "Customer ID (cid) and/or Booking ID (bid) not found in URL parameters.";
                }
                ?>
            </div>
        </section>

        <section>
            <h2>Payment</h2>
            <p>Click the button below to proceed to the payment page:</p>
            <button id="payment-button">Proceed to Payment</button>
        </section>
