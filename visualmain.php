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
    <?php 
        include 'header.php';
    ?>

    <!-- Banner -->
    <div class="banner">
        <img src="images/banner.jpg" alt="banner">
    </div>

    <?php 
        include 'categories.php';
    ?>

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
                SELECT COUNT(*) AS total 
                FROM products p
                INNER JOIN categories c ON p.id = c.product_id
            ";
            if ($category_filter) {
                $sql_total .= " WHERE c.phone_model = '" . $conn->real_escape_string($category_filter) . "'";
            }
            $total_result = $conn->query($sql_total);
            $total_products = $total_result->fetch_assoc()['total'];
            $total_pages = ceil($total_products / $limit);

            // Lấy sản phẩm cho trang hiện tại
            $sql_products = "
                SELECT 
                    p.id, 
                    p.product_name, 
                    p.unit_price, 
                    p.description, 
                    p.image_url 
                FROM products p
                INNER JOIN categories c ON p.id = c.product_id
            ";
            if ($category_filter) {
                $sql_products .= " WHERE c.phone_model = '" . $conn->real_escape_string($category_filter) . "'";
            }
            $sql_products .= " LIMIT $limit OFFSET $offset";

            $result_products = $conn->query($sql_products);

            if ($result_products->num_rows > 0) {
                while ($product = $result_products->fetch_assoc()) {
                    echo '
                    <div class="product-item">
                        <a href="detail.php?id=' . htmlspecialchars($product['id']) . '">
                            <img src="' . htmlspecialchars($product['image_url']) . '" alt="' . htmlspecialchars($product['product_name']) . '">
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
    </section>

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

    <?php 
        include 'footer.php';
    ?>

</body>
</html>