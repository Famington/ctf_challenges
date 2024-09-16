<?php
$servername = "mysql";
$username = "root";
$password = "root";
$dbname = "ctf";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// SQL Injection vulnerability
$user = $_GET['user'];
$sql = "SELECT * FROM users WHERE username = '$user'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "Flag: ctf{sql_injection_success}";
} else {
  echo "No user found.";
}

$conn->close();
?>
