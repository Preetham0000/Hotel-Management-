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
            <h2>Thank you for booking!</h2>
            <p>Your booking details:</p>
            <div id="booking-details">
                <?php
                $host = 'localhost';
                $dbUsername = 'root';
                $dbPassword = '1234';
                $dbName = 'hotel_hotel';
               
                $connection = new mysqli($host, $dbUsername, $dbPassword, $dbName);
            
                if ($connection->connect_error) {
                    die("Connection failed: " . $connection->connect_error);
                }

                // Get the 'cid' value from the URL
                $cid = $_GET['cid'];
                $bid = $_GET['bid'];
                $rno = $_GET['rno'];
               
                // Prepare and execute the query using prepared statements
                $sql = "SELECT cid, name, email, gender, phone_no FROM customer WHERE cid = ?";
                $stmt = $connection->prepare($sql);
                $stmt->bind_param("i", $cid);
                $stmt->execute();
                $result = $stmt->get_result();
                
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<p style="font-size: 20px; color: blue;">Customer Details: <br> </p>';
                        echo "ID: " . $row['cid'] . "<br>";
                        echo "Name: " . $row['name'] . "<br>";
                        echo "Gender: " . $row['gender'] . "<br>";
                        echo "Phone Number: " . $row['phone_no'] . "<br>";
                        echo "Email: " . $row['email'] . "<br><br><br>";
                    }
                } else {
                    echo "No data found.";
                }

                // Prepare and execute the query using prepared statements
                $sql1 = "SELECT bid, check_in, check_out, room_type,no_of_guests FROM booking WHERE bid = ?";
                $stmt = $connection->prepare($sql1);
                $stmt->bind_param("i", $bid);
                $stmt->execute();
                $result1 = $stmt->get_result();
                
                if ($result1->num_rows > 0) {
                    while ($row1 = $result1->fetch_assoc()) {
                        echo '<p style="font-size: 20px; color: blue;">Booking Details: <br> </p>';
                        echo "Booking ID: " . $row1['bid'] . "<br>";
                        echo "Check In Date: " . $row1['check_in'] . "<br>";
                        echo "Check Out Date: " . $row1['check_out'] . "<br>";
                        echo "Room Type: " . $row1['room_type'] . "<br>";
                        echo "Number Of Guests: " . $row1['no_of_guests'] . "<br>";
                        $checkInDate = strtotime($row1['check_in']); // Convert to Unix timestamp
                        $checkOutDate = strtotime($row1['check_out']); // Convert to Unix timestamp
                        
                        // Calculate the number of nights based on check-in and check-out dates
                        $nightDifference = ($checkOutDate - $checkInDate) / (60 * 60 * 24);  
                    }
                } else {
                    echo "No data found.";
                }
                $roomSql = "SELECT rno,price FROM room WHERE rno = ?";
                $stmt = $connection->prepare($roomSql);
                $stmt->bind_param("i", $rno);
                $stmt->execute();
                $roomResult = $stmt->get_result();

                if ($roomResult->num_rows > 0) {
                    $roomData = $roomResult->fetch_assoc();
                    $pricePerNight = $roomData['price'];
            
                    // Calculate the total price for the booking
                    $totalPrice = $pricePerNight * $nightDifference;

                    echo "<p><strong>Total Price:</strong> Rs. " . $totalPrice . "</p>";
    } 
                
                $connection->close();
                ?>  
            </div>
        </section>
        <section>
            <h2>Payment</h2>
            <p>Click the button below to proceed to the payment page:</p>
            <button id="payment-button" onclick="openPaymentPage()">Proceed to Payment</button>
        </section>

        <script>
            function openPaymentPage() {
            window.location.href = 'payment.html';
    }
        </script>
    </main>
</body>
</html>
