<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
    <style>
       .categories {
    display: flex; /* Sử dụng Flexbox */
    justify-content: space-around; /* Chia đều không gian giữa các mục */
    align-items: center; /* Căn giữa theo chiều dọc */
    padding: 20px 0;
    background-color: #f8f9fa; /* Màu nền nhẹ (tùy chỉnh nếu cần) */
}

.brand-item {
    position: relative;
    text-align: center; /* Căn giữa nội dung trong từng mục */
}

.brand-item a {
    text-decoration: none;
    font-size: 16px;
    color: #000;
    font-weight: bold;
}

.brand-item:hover .category-dropdown {
    display: block;
}

.category-dropdown {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 10px;
    z-index: 10;
}

.category-dropdown a {
    display: block;
    text-decoration: none;
    color: #333;
    padding: 5px 10px;
    font-size: 14px;
}

.category-dropdown a:hover {
    background-color: #f0f0f0;
}

.products {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4 sản phẩm mỗi dòng */
    gap: 20px; /* Khoảng cách giữa các sản phẩm */
    padding: 20px 0;
}

.product-item {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 10px;
    text-align: center;
    background-color: #fff;
    border-radius: 8px;
}

.product-item img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.product-item h3 {
    font-size: 16px;
    margin: 10px 0;
    color: #333;
}

.product-item p {
    font-size: 14px;
    color: #333;
}

.product-item button {
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.product-item button:hover {
    background-color: #0056b3;
}

.pagination {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin: 20px 0;
}

.pagination a {
    text-decoration: none;
    padding: 5px 10px;
    color: #007bff;
    border: 1px solid #007bff;
    border-radius: 4px;
}

.pagination a.active {
    background-color: #007bff;
    color: #fff;
}
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="Oops Logo">
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

    <!-- Banner -->
    <div class="banner">
        <img src="images/banner.jpg" alt="banner">
    </div>

    <!-- Categories -->
    <nav class="categories">
        <?php
        // Kết nối cơ sở dữ liệu
        $connection = new mysqli("localhost", "root", "", "oopsdb");

        if ($connection->connect_error) {
            die("Kết nối thất bại: " . $connection->connect_error);
        }

        // Lấy danh sách các thương hiệu từ bảng `phone_brands`
        $sql_brands = "SELECT id, brand_name FROM phone_brands";
        $result_brands = $connection->query($sql_brands);

        if ($result_brands->num_rows > 0) {
            while ($brand = $result_brands->fetch_assoc()) {
                echo '<div class="brand-item">';
                echo '<a href="#">' . htmlspecialchars($brand['brand_name']) . '</a>';

                // Lấy danh sách các danh mục liên quan từ bảng `products` và `categories`
                $brand_id = $brand['id'];
                $sql_categories = "
                    SELECT DISTINCT c.phone_model
                    FROM products p
                    INNER JOIN categories c ON p.id = c.product_id
                    WHERE p.phone_brand_id = '$brand_id'
                ";
                $result_categories = $connection->query($sql_categories);

                if ($result_categories->num_rows > 0) {
                    echo '<div class="category-dropdown">';
                    while ($category = $result_categories->fetch_assoc()) {
                        echo '<a href="?category=' . urlencode($category['phone_model']) . '">' . htmlspecialchars($category['phone_model']) . '</a>';
                    }
                    echo '</div>';
                }

                echo '</div>';
            }
        } else {
            echo '<p>Không có thương hiệu nào.</p>';
        }
        ?>
    </nav>

    <!-- Products -->
    <section class="product-grid">
        <h2>Products</h2>
        <div class="products">
            <?php
            // Lấy số trang hiện tại
            $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
            $limit = 10; // Số sản phẩm mỗi trang
            $offset = ($page - 1) * $limit;

            // Lấy danh mục hiện tại (nếu có)
            $category_filter = isset($_GET['category']) ? $_GET['category'] : null;

            // Đếm tổng số sản phẩm
            $sql_total = "
                SELECT COUNT(DISTINCT p.id) AS total 
                FROM products p
                INNER JOIN categories c ON p.id = c.product_id
            ";
            if ($category_filter) {
                $sql_total .= " WHERE c.phone_model = '" . $connection->real_escape_string($category_filter) . "'";
            }
            $total_result = $connection->query($sql_total);
            $total_products = $total_result->fetch_assoc()['total'];
            $total_pages = ceil($total_products / $limit);

            // Lấy sản phẩm cho trang hiện tại
            $sql_products = "
                SELECT DISTINCT
                    p.id, 
                    p.product_name, 
                    p.unit_price, 
                    p.description, 
                    p.image_url 
                FROM products p
                INNER JOIN categories c ON p.id = c.product_id
            ";
            if ($category_filter) {
                $sql_products .= " WHERE c.phone_model = '" . $connection->real_escape_string($category_filter) . "'";
            }
            $sql_products .= " GROUP BY p.id LIMIT $limit OFFSET $offset";
            

            $result_products = $connection->query($sql_products);

            if ($result_products->num_rows > 0) {
                while ($product = $result_products->fetch_assoc()) {
                    echo '
                    <div class="product-item">
                        <a href="detail.php?id=' . htmlspecialchars($product['id']) . '">
                            <img src="anh/'. htmlspecialchars($product['image_url']) . '" alt="' . htmlspecialchars($product['product_name']) . '">
                            <h3>' . htmlspecialchars($product['product_name']) . '</h3>
                        </a>
                        <p>Price: ' . number_format($product['unit_price'], 0, ',', '.') . 'đ</p>
                        <form action="checkout.php" method="POST">
                            <input type="hidden" name="product_id" value="' . htmlspecialchars($product['id']) . '">
                            <button type="submit">Buy Now</button>
                        </form>
                    </div>
                    ';
                }
            } else {
                echo '<p>Không có sản phẩm nào.</p>';
            }
            ?>
        </div>

        <!-- Pagination -->
                <div class="pagination">
            <?php
            // Xác định trang bắt đầu và kết thúc
            $start_page = max(1, $page - 2); // Bắt đầu từ 2 trang trước trang hiện tại
            $end_page = min($total_pages, $page + 2); // Kết thúc ở 2 trang sau trang hiện tại

            // Nếu tổng số trang lớn hơn 5, điều chỉnh lại
            if ($total_pages > 5) {
                if ($page <= 3) { // Trường hợp trang hiện tại ở đầu
                    $start_page = 1;
                    $end_page = 5;
                } elseif ($page > $total_pages - 3) { // Trường hợp trang hiện tại ở cuối
                    $start_page = $total_pages - 4;
                    $end_page = $total_pages;
                }
            }
            ?>

            <!-- Nút mũi tên trái -->
            <?php if ($page > 1): ?>
                <a href="?page=<?php echo $page - 1; ?><?php echo $category_filter ? '&category=' . urlencode($category_filter) : ''; ?>">&#8592;</a>
            <?php endif; ?>

            <!-- Hiển thị các trang -->
            <?php for ($i = $start_page; $i <= $end_page; $i++): ?>
                <a href="?page=<?php echo $i; ?><?php echo $category_filter ? '&category=' . urlencode($category_filter) : ''; ?>" 
                class="<?php echo $i == $page ? 'active' : ''; ?>">
                <?php echo $i; ?>
                </a>
            <?php endfor; ?>

            <!-- Nút mũi tên phải -->
            <?php if ($page < $total_pages): ?>
                <a href="?page=<?php echo $page + 1; ?><?php echo $category_filter ? '&category=' . urlencode($category_filter) : ''; ?>">&#8594;</a>
            <?php endif; ?>
        </div>

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
