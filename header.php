<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .search-suggestions {
            position: absolute;
            top: 40px; /* Khoảng cách dưới thanh tìm kiếm */
            left: 0;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            max-height: 200px;
            overflow-y: auto;
            z-index: 1000;
            display: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .search-suggestions div {
            padding: 10px;
            cursor: pointer;
        }
        .search-suggestions div:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <!-- Thêm liên kết để quay về trang chủ -->
            <a href="index.php">
                <img src="images/logo.png" alt="Oops Logo">
            </a>
        </div>
        <div class="search-bar" style="position: relative;">
            <input 
                type="text" 
                id="search-input" 
                placeholder="Tìm kiếm sản phẩm..." 
                style="width: 300px; padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
            <span>🔍</span>
            <div id="search-suggestions" class="search-suggestions"></div>
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

    <script>
        $(document).ready(function() {
            $('#search-input').on('input', function() {
                const query = $(this).val().trim();
                if (query.length > 0) {
                    $.ajax({
                        url: 'search_suggestions.php',
                        type: 'GET',
                        data: { query: query },
                        success: function(data) {
                            $('#search-suggestions').html(data).fadeIn();
                        }
                    });
                } else {
                    $('#search-suggestions').fadeOut();
                }
            });

            $(document).on('click', '.search-item', function() {
                const productUrl = $(this).data('url');
                window.location.href = productUrl;
            });
        });
    </script>
</body>
</html>
