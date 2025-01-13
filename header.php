<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="logo">
            <!-- Thêm liên kết để quay về trang chủ -->
            <a href="visualmain.php">
                <img src="images/logo.png" alt="Oops Logo">
            </a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Tìm kiếm sản phẩm...">
            <span>🔍</span>
        </div>
        <div class="user-actions">
            <span>🔔</span>  
        </div>
        <div style="display: flex; justify-content: flex-end; align-items: center; padding: 10px;">
            <!-- Biểu tượng người dùng -->
            <a href="login.php" style="font-size: 15px; text-decoration: none; margin-right: 10px;">
                👤
            </a>

            <!-- Biểu tượng giỏ hàng -->
            <a href="cart.php" style="font-size: 15px; text-decoration: none; margin-right: 10px;">
                🛒
                <span style="font-size: 16px; color: red; font-weight: bold;">
                    <?php echo isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0; ?>
                </span>
            </a>
        </div>
    </header>
</body>
</html>
