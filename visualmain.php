<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>

</style>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="images/logo.jpg" alt="Oops Logo">
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Tìm kiếm sản phẩm...">
            <span>🔍</span>
        </div>
        <div class="user-actions">
            <span>🔔</span>
            <span>👤</span>
            <span>🛒</span>
        </div>
        </header>
        <div class="banner">
            <img src="images/banner.jpg" alt="banner">
        </div>
        <nav class="categories">
            <a href="#">Iphone</a>
            <a href="#">Samsung</a>
            <a href="#">Oppo</a>
            <a href="#">Xiaomi</a>
            <a href="#">Khác</a>
        </nav>
    

    <!-- Product Grid -->
    <section class="product-grid">
        <h2>Products</h2>
        <div class="products">
            <?php
            // Fake data (thay thế bằng cơ sở dữ liệu thực tế nếu cần)
            $products = [
                ["name" => "Ốp lưng JCPAL", "price" => "90,000đ", "image" => "images/product1.jpg"],
                ["name" => "Ốp lưng Samsung nhựa", "price" => "35,000đ", "image" => "images/product2.jpg"],
                ["name" => "Ốp lưng Đen nhám mờ", "price" => "35,000đ", "image" => "images/product3.jpg"],
                ["name" => "Ốp lưng silicon", "price" => "40,000đ", "image" => "images/product4.jpg"],
            ];

            foreach ($products as $product) {
                echo '
                <div class="product-item">
                    <img src="'.$product['image'].'" alt="'.$product['name'].'">
                    <h3>'.$product['name'].'</h3>
                    <p>Price: '.$product['price'].'</p>
                    <button>Buy Now</button>
                </div>
                ';
            }
            ?>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div>
            <p><strong>Thông tin liên hệ</strong></p>
            <p>Địa chỉ: Hoàng Diệu 2, Thủ Đức, Hồ Chí Minh</p>
            <p>SDT: 03587xxxxx</p>
        </div>
        <div>
            <p><strong>Chính sách</strong></p>
            <p>Giao hàng</p>
            <p>Bảo hành</p>
            <p>Tích điểm</p>
        </div>
        <div>
            <p><strong>Hỗ trợ</strong></p>
            <p>Tra cứu đơn hàng</p>
            <p>Thanh toán</p>
            <p>Liên hệ</p>
        </div>
        <div>
            <p><strong>Mạng xã hội</strong></p>
            <p>Facebook</p>
            <p>Tiktok</p>
            <p>Shopee</p>
        </div>
    </footer>
</body>
</html>
