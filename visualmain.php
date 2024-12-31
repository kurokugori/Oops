<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-location">
            <p>📍 Hoàng Diệu 2, Thủ Đức, Hồ Chí Minh</p>
        </div>
        <div class="header-search">
            <input type="text" placeholder="Search...">
            <button>🔍</button>
        </div>
    </header>

    <!-- Banner -->
    <section class="banner">
        <img src="./banner.jpg" alt="Promo Banner">
    </section>

    <!-- Product Categories -->
    <section class="categories">
        <nav>
            <ul>
                <li><a href="#">iPhone</a></li>
                <li><a href="#">Samsung</a></li>
                <li><a href="#">Oppo</a></li>
                <li><a href="#">Xiaomi</a></li>
                <li><a href="#">Khác</a></li>
            </ul>
        </nav>
    </section>

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

   <!-- Footer Section -->
<footer>
    <div class="footer-container">
        <!-- Logo Section -->
        <div class="footer-logo">
            <img src="./logo.jpg" alt="Oops Logo">
            <p>Oops - Protect Your Phone</p>
        </div>

        <!-- Footer Links -->
        <div class="footer-links">
            <div class="footer-column">
                <h4>Thông tin liên hệ</h4>
                <p>68A, Đường Hoàng Diệu 2,<br> Thủ Đức, HCM</p>
                <p>SĐT: 0900-000-000</p>
            </div>
            <div class="footer-column">
                <h4>Chính sách</h4>
                <ul>
                    <li><a href="#">Bảo hành</a></li>
                    <li><a href="#">Đổi trả</a></li>
                    <li><a href="#">Hoàn tiền</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Hỗ trợ</h4>
                <ul>
                    <li><a href="#">Tra cứu đơn hàng</a></li>
                    <li><a href="#">Thanh toán</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Mạng xã hội</h4>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">TikTok</a></li>
                    <li><a href="#">Instagram</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Oops - Protect Your Phone. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
