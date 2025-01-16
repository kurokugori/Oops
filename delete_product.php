<?php
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}


$id = $_GET['id'];
$sql = "DELETE FROM products WHERE id='$id'";
if ($conn->query($sql) === TRUE) {
    header("Location: index.php");
} else {
    echo "Lỗi: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>