<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Lấy ID đơn hàng từ URL
$order_id = $_GET['order_id'];

// Lấy thông tin đơn hàng
$sql_order = "SELECT * FROM orders WHERE order_id='$order_id'";
$result_order = $conn->query($sql_order);
$order = $result_order->fetch_assoc();

// Lấy chi tiết đơn hàng
$sql_details = "SELECT od.product_id, od.quantity, od.unit_price, od.phone_deli, od.address_delivery, p.product_name 
                FROM order_details od 
                JOIN products p ON od.product_id = p.id 
                WHERE od.order_id='$order_id'";
$result_details = $conn->query($sql_details);

if (!$result_order || !$result_details) {
    die("Lỗi truy vấn: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <div class="mb-3">
            <a href="index.php" class="btn btn-secondary">Trở về trang chủ</a>
        </div>
        <h1 class="text-center mb-4">Chi tiết đơn hàng</h1>

        <div class="card p-4">
            <h3>Thông tin đơn hàng</h3>
            <p><strong>ID đơn hàng:</strong> <?= $order['order_id'] ?></p>
            <p><strong>ID người đặt:</strong> <?= $order['user_id'] ?></p>
            <p><strong>Ngày đặt hàng:</strong> <?= $order['order_date'] ?></p>
            <p><strong>Ngày yêu cầu giao hàng:</strong> <?= $order['required_date'] ?></p>
        </div>

        <h3 class="mt-4">Chi tiết sản phẩm</h3>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                    <th>Số điện thoại nhận hàng</th>
                    <th>Địa chỉ nhận hàng</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result_details->fetch_assoc()): ?>
                <tr>
                    <td><?= $row['product_id'] ?></td>
                    <td><?= $row['product_name'] ?></td>
                    <td><?= $row['quantity'] ?></td>
                    <td><?= number_format($row['unit_price'], 0, ',', '.') ?> VNĐ</td>
                    <td><?= number_format($row['quantity'] * $row['unit_price'], 0, ',', '.') ?> VNĐ</td>
                    <td><?= $row['phone_deli'] ?></td>
                    <td><?= $row['address_delivery'] ?></td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <a href="manage_orders.php" class="btn btn-secondary">Quay lại</a>
    </div>

    
</body>
</html>

<?php $conn->close(); ?>