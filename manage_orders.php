<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Xử lý thay đổi trạng thái đơn hàng
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $order_id = $_POST['order_id'];
    $order_status = $_POST['order_status'];

    $sql = "UPDATE orders SET order_status=$order_status WHERE order_id='$order_id'";
    if ($conn->query($sql) === TRUE) {
        echo "<div class='alert alert-success'>Cập nhật trạng thái thành công!</div>";
    } else {
        echo "<div class='alert alert-danger'>Lỗi: " . $sql . "<br>" . $conn->error . "</div>";
    }
}

// Lấy danh sách đơn hàng
$sql = "SELECT * FROM orders";
$result = $conn->query($sql);

if (!$result) {
    die("Lỗi truy vấn: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đơn hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Quản lý đơn hàng</h1>

        <?php if ($result->num_rows > 0): ?>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID đơn hàng</th>
                    <th>ID người dùng</th>
                    <th>Ngày đặt hàng</th>
                    <th>Ngày yêu cầu</th>
                    <th>Ngày giao hàng</th>
                    <th>Tổng giá</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?= $row['order_id'] ?></td>
                    <td><?= $row['user_id'] ?></td>
                    <td><?= $row['order_date'] ?></td>
                    <td><?= $row['required_date'] ?></td>
                    <td><?= $row['shipped_date'] ?></td>
                    <td><?= number_format($row['total_prices'], 0, ',', '.') ?> VNĐ</td>
                    <td>
                        <form method="POST" class="d-flex">
                            <input type="hidden" name="order_id" value="<?= $row['order_id'] ?>">
                            <select name="order_status" class="form-select me-2" onchange="this.form.submit()">
                                <option value="1" <?= $row['order_status'] == 1 ? 'selected' : '' ?>>Đã đặt hàng</option>
                                <option value="2" <?= $row['order_status'] == 2 ? 'selected' : '' ?>>Đang xử lý</option>
                                <option value="3" <?= $row['order_status'] == 3 ? 'selected' : '' ?>>Đã giao hàng</option>
                                <option value="4" <?= $row['order_status'] == 4 ? 'selected' : '' ?>>Đã hủy</option>
                            </select>
                        </form>
                    </td>
                    <td>
    <a href="order_details.php?order_id=<?= $row['order_id'] ?>" class="btn btn-info btn-sm">Xem chi tiết</a>
</td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <?php else: ?>
        <div class="alert alert-warning">Không có đơn hàng nào.</div>
        <?php endif; ?>

        <a href="index.php" class="btn btn-secondary">Quay lại</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<?php $conn->close(); ?>
