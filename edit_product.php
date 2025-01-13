<?php
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$id = $_GET['id'];
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $product_name = $_POST['product_name'];
    $phone_brand_id = $_POST['phone_brand_id'];
    $unit_price = $_POST['unit_price'];
    $description = $_POST['description'];
    $image_url = $_POST['image_url'];

    $sql = "UPDATE products SET product_name='$product_name', phone_brand_id='$phone_brand_id', unit_price=$unit_price, description='$description', image_url='$image_url' WHERE id='$id'";
    if ($conn->query($sql) === TRUE) {
        header("Location: index.php");
    } else {
        echo "Lỗi: " . $sql . "<br>" . $conn->error;
    }
}

$sql = "SELECT * FROM products WHERE id='$id'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Sửa sản phẩm</h1>
        <div class="card p-4">
            <form method="POST">
                <div class="mb-3">
                    <label for="product_name" class="form-label">Tên sản phẩm:</label>
                    <input type="text" id="product_name" name="product_name" class="form-control" value="<?= $row['product_name'] ?>" required>
                </div>
                <div class="mb-3">
                    <label for="phone_brand_id" class="form-label">ID thương hiệu:</label>
                    <input type="text" id="phone_brand_id" name="phone_brand_id" class="form-control" value="<?= $row['phone_brand_id'] ?>" required>
                </div>
                <div class="mb-3">
                    <label for="unit_price" class="form-label">Giá:</label>
                    <input type="number" id="unit_price" name="unit_price" class="form-control" value="<?= $row['unit_price'] ?>" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả:</label>
                    <textarea id="description" name="description" class="form-control" required><?= $row['description'] ?></textarea>
                </div>
                <div class="mb-3">
                    <label for="image_url" class="form-label">URL hình ảnh:</label>
                    <input type="text" id="image_url" name="image_url" class="form-control" value="<?= $row['image_url'] ?>" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="index.php" class="btn btn-secondary">Quay lại</a>
                </div>
            </form>
        </div>
    </div>

    
</body>
</html>

<?php $conn->close(); ?>