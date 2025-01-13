<?php
session_start();

// Kết nối cơ sở dữ liệu
$connection = new mysqli("localhost", "root", "", "oops");
if ($connection->connect_error) {
    die("Kết nối cơ sở dữ liệu thất bại: " . $connection->connect_error);
}

// Lấy từ khóa tìm kiếm từ AJAX
$query = isset($_GET['query']) ? trim($_GET['query']) : '';

if ($query) {
    // Tìm kiếm sản phẩm gần giống với từ khóa
    $stmt = $connection->prepare("SELECT id, product_name FROM products WHERE product_name LIKE CONCAT('%', ?, '%') LIMIT 10");
    $stmt->bind_param("s", $query);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        while ($product = $result->fetch_assoc()) {
            echo "
            <div class='search-item' data-url='detail.php?id=" . htmlspecialchars($product['id']) . "'>
                " . htmlspecialchars($product['product_name']) . "
            </div>";
        }
    } else {
        echo "<div>Không tìm thấy sản phẩm nào.</div>";
    }
}
$connection->close();
?>
