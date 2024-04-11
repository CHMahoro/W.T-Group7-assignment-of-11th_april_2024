<?php
// Connection
// MWEZI winner (222015643),winnermwezi025@gmail.com
$host = "localhost";
$user = "admin";
$pass = "bityear2@2024";
$database = "bityeartwo2024";
// Create the connection
$conn = new mysqli($host, $user, $pass, $database);
// Check if the connection passed
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Prepare and bind the parameters
    $stmt = $conn->prepare("INSERT INTO profile(userid, Campus, College, School, Department, Level, `Group`, Regnumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $userid, $Campus, $College, $School, $Department, $Level, $GroupName, $Regnumber);
    // Set parameters and execute
    $userid = $_POST['userid'];
    $Campus = $_POST['campus'];
    $College = $_POST['college'];
    $School = $_POST['school'];
    $Department = $_POST['dept'];
    $Level = $_POST['lev'];
    $GroupName = $_POST['grpname'];
    $Regnumber = $_POST['regno'];
    
   
    if ($stmt->execute() == TRUE) {
        echo "New record has been added successfully";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}
// Close the previous statement before executing a new one
if ($result = $conn->query("SELECT * FROM profile")) {
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detail information Of Profile</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
    
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
    
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
    <h2>Table of Profile Data</h2>
    
    <table id="dataTable">
        <tr>
            <th>Pid</th>
            <th>Userid</th>
            <th>Campus</th>
            <th>College</th>
            <th>School</th>
            <th>Department</th>
            <th>Level</th>
            <th>GroupName</th>
            <th>Regnumber</th>
        </tr>
        <?php
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["pid"] . "</td><td>" . $row["userid"] . "</td><td>" . $row["Campus"] . "</td><td>" . $row["College"] . "</td><td>" . $row["School"] . "</td><td>" . $row["Department"] . "</td><td>" . $row["Level"] . "</td><td>" . $row["Group"] . "</td><td>" . $row["Regnumber"] . "</td></tr>";
        }
        ?>
    </table>
    
    </body>
    </html>
    <?php
    $result->close();
} else {
    echo "Error: " . $conn->error;
}

// Close connection
$conn->close();
?>
