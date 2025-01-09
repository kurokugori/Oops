<?php
require_once "config.php";
include "header.php";

// Phần truy vấn sản phẩm
if (isset($_GET['id'])) {
    $product_id = $conn->real_escape_string($_GET['id']);
    
    // Join các bảng để lấy thông tin đầy đủ
    $sql = "SELECT p.*, pb.brand_name, c.category_id, s.quantity as stock_quantity
            FROM products p
            LEFT JOIN phone_brands pb ON p.phone_brand_id = pb.id
            LEFT JOIN categories c ON p.id = c.product_id
            LEFT JOIN stocks s ON p.id = s.product_id
            WHERE p.id = '$product_id'";
    
    $result = $conn->query($sql);
    
    if ($result && $result->num_rows > 0) {
        $product = $result->fetch_assoc();
        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title><?php echo htmlspecialchars($product['product_name']); ?></title>
            <style>
                .product-container {
                    display: flex;
                    max-width: 1200px;
                    margin: 20px auto;
                    padding: 20px;
                    gap: 40px;
                }
                .product-images {
                    flex: 1;
                }
                .main-image img {
                    width: 100%;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }
                .product-info {
                    flex: 1;
                    padding: 20px;
                }
                .price {
                    font-size: 24px;
                    color: #e53935;
                    font-weight: bold;
                    margin: 20px 0;
                }
                .options {
                    margin: 20px 0;
                }
                .phone-model select {
                    width: 100%;
                    padding: 10px;
                    margin: 10px 0;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                }
                .quantity-selector {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    margin: 20px 0;
                }
                .quantity-selector button {
                    padding: 5px 15px;
                    border: 1px solid #ddd;
                    background: #fff;
                    cursor: pointer;
                }
                .quantity-selector input {
                    width: 60px;
                    padding: 5px;
                    text-align: center;
                }
                /* Style cho các nút */
                .button-group {
                    display: flex;
                    flex-direction: column;
                    gap: 10px;
                    margin-top: 20px;
                }
                .add-to-cart, .buy-now {
                    width: 100%;
                    padding: 15px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    font-size: 16px;
                    font-weight: bold;
                    transition: background-color 0.3s;
                }
                .add-to-cart {
                    background-color: #4CAF50;
                    color: white;
                }
                .add-to-cart:hover {
                    background-color: #45a049;
                }
                .buy-now {
                    background-color: #ff4444;
                    color: white;
                }
                .buy-now:hover {
                    background-color: #ff3333;
                }
                .description {
                    margin-top: 30px;
                    padding-top: 20px;
                    border-top: 1px solid #ddd;
                }
                .out-of-stock {
                    color: #e53935;
                    font-size: 18px;
                    font-weight: bold;
                    margin: 20px 0;
                }
            </style>
        </head>
        <body>
            <div class="product-container">
                <div class="product-images">
                    <div class="main-image">
                        <img src="anh/<?php echo htmlspecialchars($product['image_url']); ?>" 
                             alt="<?php echo htmlspecialchars($product['product_name']); ?>">
                    </div>
                </div>

                <div class="product-info">
                    <h1><?php echo htmlspecialchars($product['product_name']); ?></h1>
                    <div class="price"><?php echo number_format($product['unit_price'], 0, ',', '.'); ?>đ</div>
                    
                    <div class="options">
                        <div class="phone-model">
                            <label>Chọn model điện thoại:</label><br>
                            <select name="phone_model" id="phone_model" required>
                                <option value="">Chọn một tùy chọn</option>
                                <?php
                                $model_sql = "SELECT DISTINCT phone_model FROM categories WHERE product_id = '$product_id'";
                                $model_result = $conn->query($model_sql);
                                while ($model = $model_result->fetch_assoc()) {
                                    echo "<option value='".htmlspecialchars($model['phone_model'])."'>".
                                         htmlspecialchars($model['phone_model'])."</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <?php if ($product['stock_quantity'] > 0): ?>
                        <div class="quantity-selector">
                            <button onclick="updateQuantity(-1)">-</button>
                            <input type="number" id="quantity" value="1" min="1" 
                                   max="<?php echo $product['stock_quantity']; ?>">
                            <button onclick="updateQuantity(1)">+</button>
                        </div>
                        <div class="button-group">
                            <button class="add-to-cart" onclick="addToCart()">
                                THÊM VÀO GIỎ HÀNG
                            </button>
                            <button class="buy-now" onclick="buyNow()">
                                MUA NGAY
                            </button>
                        </div>
                    <?php else: ?>
                        <div class="out-of-stock">Hết hàng</div>
                    <?php endif; ?>

                    <div class="description">
                        <h3>Mô tả sản phẩm:</h3>
                        <p><?php echo nl2br(htmlspecialchars($product['description'])); ?></p>
                    </div>
                </div>
            </div>

            <script>
            function updateQuantity(change) {
                const input = document.getElementById('quantity');
                const newValue = parseInt(input.value) + change;
                const max = parseInt(input.max);
                
                if (newValue >= 1 && newValue <= max) {
                    input.value = newValue;
                }
            }

            function addToCart() {
                const quantity = document.getElementById('quantity').value;
                const model = document.getElementById('phone_model').value;
                
                if (!model) {
                    alert('Vui lòng chọn model điện thoại');
                    return;
                }

                const xhr = new XMLHttpRequest();
                xhr.open("POST", "add_to_cart.php", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            alert('Đã thêm sản phẩm vào giỏ hàng!');
                        } else {
                            alert('Có lỗi xảy ra khi thêm vào giỏ hàng');
                        }
                    }
                };
                xhr.send("product_id=<?php echo $product_id; ?>&quantity=" + quantity + 
                        "&phone_model=" + encodeURIComponent(model));
            }

            function buyNow() {
                const quantity = document.getElementById('quantity').value;
                const model = document.getElementById('phone_model').value;
                
                if (!model) {
                    alert('Vui lòng chọn model điện thoại');
                    return;
                }

                // Chuyển hướng đến trang thanh toán với thông tin sản phẩm
                window.location.href = 'checkout.php?' + 
                    'product_id=<?php echo $product_id; ?>' +
                    '&quantity=' + quantity +
                    '&phone_model=' + encodeURIComponent(model);
            }
            </script>
        </body>
        </html>
        <?php
    } else {
        echo "<div style='text-align: center; margin: 50px;'>
                <h2>Không tìm thấy sản phẩm</h2>
                <a href='visualmain.php'>Quay lại trang chủ</a>
              </div>";
    }
}
?>