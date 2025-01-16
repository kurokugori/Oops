<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Xử lý cập nhật số lượng tồn kho
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];

    $sql = "UPDATE stocks SET quantity=$quantity WHERE product_id='$product_id'";
    if ($conn->query($sql) === TRUE) {
        echo "<div class='alert alert-success'>Cập nhật thành công!</div>";
    } else {
        echo "<div class='alert alert-danger'>Lỗi: " . $sql . "<br>" . $conn->error . "</div>";
    }
}

// Lấy danh sách sản phẩm và số lượng tồn kho
$sql = "SELECT p.id, p.product_name, s.quantity FROM products p JOIN stocks s ON p.id = s.product_id";
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
    <title>Quản lý hàng tồn kho</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <div class="mb-3">
            <a href="index.php" class="btn btn-secondary">Trở về trang chủ</a>
        </div>
        <h1 class="text-center mb-4">Quản lý hàng tồn kho</h1>

        <?php if ($result->num_rows > 0): ?>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng tồn kho</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?= $row['id'] ?></td>
                    <td><?= $row['product_name'] ?></td>
                    <td><?= $row['quantity'] ?></td>
                    <td>
                        <form method="POST" class="d-flex">
                            <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
                            <input type="number" name="quantity" value="<?= $row['quantity'] ?>" class="form-control me-2" required>
                            <button type="submit" class="btn btn-primary btn-sm">Cập nhật</button>
                        </form>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <?php else: ?>
        <div class="alert alert-warning">Không có sản phẩm nào trong kho.</div>
        <?php endif; ?>

        <a href="index.php" class="btn btn-secondary">Quay lại</a>
    </div>

    
</body>
</html>

<?php $conn->close(); ?>