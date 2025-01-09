<!DOCTYPE html>
<html>
<head>
    <style>
        .brand-list {
            margin-bottom: 20px;
        }
        .brand-item {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }
        .brand-item:hover {
            background-color: #f0f0f0;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr); /* Đảm bảo 5 cột */
            grid-gap: 10px;
        }
        .item {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <?php
        require_once "config.php"; // Kết nối cơ sở dữ liệu

        // Lấy danh sách thương hiệu điện thoại
        $sql = "SELECT * FROM phone_brands";
        $result = $conn->query($sql);
        $list_phone = [];
        if ($result) {
            $list_phone = $result->fetch_all(MYSQLI_ASSOC);
        }

        // Kiểm tra nếu có brand_id được gửi qua URL
        $brand_id = isset($_GET["brand_id"]) ? intval($_GET["brand_id"]) : 0;
    ?>

    <!-- Hiển thị danh sách thương hiệu điện thoại -->
    <div class="brand-list">
        <?php foreach ($list_phone as $brand): ?>
            <a class="brand-item" href="?brand_id=<?php echo $brand['id']; ?>">
                <?php echo $brand['brand_name']; ?>
            </a>
        <?php endforeach; ?>
    </div>

    <?php
    // Nếu có thương hiệu được chọn, hiển thị sản phẩm của thương hiệu đó
    if ($brand_id > 0) {
        $sql = "SELECT product_name, unit_price, description, image_url 
                FROM products 
                WHERE phone_brand_id = ? 
                LIMIT 10";

        // Sử dụng prepared statement để đảm bảo an toàn
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $brand_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            $products = $result->fetch_all(MYSQLI_ASSOC);
            ?>
            <!-- Hiển thị sản phẩm -->
            <div class="grid-container">
                <?php foreach ($products as $product): ?>
                    <div class="item">
                        <img src="./anh/<?php echo $product['image_url']; ?>" alt="Ảnh sản phẩm" style="width: 100px;"><br>
                        <?php echo $product['product_name']; ?><br>
                        <?php echo $product['unit_price']; ?> VND
                    </div>
                <?php endforeach; ?>
            </div>
            <?php
        } else {
            echo "<p>Không tìm thấy sản phẩm nào cho thương hiệu này.</p>";
        }
    }
    ?>
</body>
</html>
