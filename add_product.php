<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Xử lý thêm sản phẩm
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $product_name = $_POST['product_name'];
    $phone_brand_id = $_POST['phone_brand_id'];
    $unit_price = $_POST['unit_price'];
    $description = $_POST['description'];
    $image_url = $_POST['image_url'];

    // Thêm sản phẩm vào bảng products
    $sql = "INSERT INTO products (id, product_name, phone_brand_id, unit_price, description, image_url) 
            VALUES ('$id', '$product_name', '$phone_brand_id', $unit_price, '$description', '$image_url')";
    if ($conn->query($sql) === TRUE) {
        // Thêm sản phẩm vào bảng stocks với số lượng mặc định là 1
        $sql_stock = "INSERT INTO stocks (product_id, quantity) VALUES ('$id', 1)";
        if ($conn->query($sql_stock) === TRUE) {
            header("Location: index.php"); // Chuyển hướng sau khi thêm thành công
            exit;
        } else {
            echo "Lỗi khi thêm vào bảng stocks: " . $sql_stock . "<br>" . $conn->error;
        }
    } else {
        echo "Lỗi: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Thêm sản phẩm mới</h1>
        <form method="POST" class="card p-4">
            <div class="mb-3">
                <label for="id" class="form-label">ID:</label>
                <input type="text" id="id" name="id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="product_name" class="form-label">Tên sản phẩm:</label>
                <input type="text" id="product_name" name="product_name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="phone_brand_id" class="form-label">ID thương hiệu:</label>
                <input type="text" id="phone_brand_id" name="phone_brand_id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="unit_price" class="form-label">Giá:</label>
                <input type="number" id="unit_price" name="unit_price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Mô tả:</label>
                <textarea id="description" name="description" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label for="image_url" class="form-label">URL hình ảnh:</label>
                <input type="text" id="image_url" name="image_url" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
        </form>
        <a href="index.php" class="btn btn-secondary mt-3">Quay lại</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>