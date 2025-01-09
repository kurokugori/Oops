<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <style>
        /* Global Styles */
        body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;

        }

        /* Header */
        header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                background-color: #f4f4f4;
                border-bottom: 1px solid #ddd;
        }
        .logo {
                text-align: left;
                flex: 1;
        }
        .logo img {
                max-width: 100px; /* Giảm kích thước từ 150px xuống 100px */
                height: auto; /* Đảm bảo hình ảnh không bị méo */
        }

        .search-bar {
                flex: 2;
                display: flex;
                justify-content: center;
        }

        .search-bar input {
                width: 40%;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
        }

        .user-actions {
                flex: 1;
                text-align: right;
        }
        /* Categories */
        .categories {
                display: flex;
                justify-content: space-around;
                background-color: #f4f4f4;
                padding: 10px;
                border-bottom: 1px solid #ddd;
        }
        .categories a {
                text-decoration: none;
                color: #333;
        }

        /* Banner */
        .banner {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0px 0; /* Optional for spacing */
        }

        /* Product Grid */
        .product-grid {
                padding: 20px;
                text-align: center;
        }

        .product-grid .products {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
        }

        .product-item {
                width: 200px;
                margin: 10px;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 10px;
                background-color: #fff;
                text-align: center;
        }

        .product-item img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                margin-bottom: 10px;
        }

        .product-item h3 {
                font-size: 16px;
                margin: 5px 0;
        }

        .product-item p {
                color: #555;
        }

        .product-item button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 5px;
        }

        .product-item button:hover {
                background-color: #0056b3;
        }

        /* Footer */
        footer {
                background-color: #f4f4f4;
                text-align: center;
                padding: 20px;
                border-top: 1px solid #ddd;
                display: flex;
                justify-content: space-around;
        }

        footer div {
                flex: 1;
        }
        /*CSS table giỏ hàng*/
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        .cart-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .cart-table img {
            width: 50px;
            height: 50px;
            object-fit: contain;
        }
        .quantity-box {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quantity-box button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .quantity-box input {
            width: 40px;
            text-align: center;
            margin: 0 5px;
        }
        .buy-button {
            background-color: #00ff00;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        .buy-button:hover {
            background-color: #009900;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        input[type="text"] {
            width: 40px;
            text-align: center;
        }
    </style>

    <script>
        function updateTotal() {
            let total = 0;
            document.querySelectorAll(".cart-item").forEach(row => {
                let checkbox = row.querySelector(".select-item");
                let price = parseFloat(row.querySelector(".item-price").innerText.replace('đ', ''));
                let quantity = parseInt(row.querySelector(".quantity-input").value);
                let subtotal = price * quantity;
                row.querySelector(".item-total").innerText = subtotal.toLocaleString() + "đ";

                if (checkbox.checked) {
                    total += subtotal;
                }
            });

            document.getElementById("total-price").innerText = total.toLocaleString() + "đ";
        }
    </script>

    <body onload="updateTotal()">

        <!-- HEADER -->
        <header>
            <div class="logo">
                <img src="D:/BTN_ltweb_oops/logo.jpg" alt="Oops Logo">
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
            </div>
            <div class="user-actions">
                <span>🔔</span>
                <span>👤</span>
                <span>🛒</span>
            </div>
        </header>

        <!-- DANH MỤC SẢN PHẨM -->
        <div class="categories">
            <a href="#">Apple</a>
            <a href="#">Samsung</a>
            <a href="#">Oppo</a>
            <a href="#">Xiaomi</a>
        </div>

        <!-- GIỎ HÀNG -->
        <div class="product-grid">
            <h2>Giỏ Hàng</h2>
            <table>
                <tr>
                    <th>Chọn</th>
                    <th>Sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Xóa</th>
                </tr>

                <?php
                if (!empty($_SESSION['cart'])) {
                    foreach ($_SESSION['cart'] as $id => $product) {
                        echo "<tr class='cart-item'>
                            <td><input type='checkbox' class='select-item' onclick='updateTotal()'></td>
                            <td><img src='D:/BTN_ltweb_oops/{$product['image']}' width='50'> {$product['name']}</td>
                            <td class='item-price'>{$product['price']}đ</td>
                            <td>
                                <button onclick='changeQuantity(this, -1)'>-</button> 
                                <input type='text' class='quantity-input' value='{$product['quantity']}' size='2' onchange='updateTotal()'> 
                                <button onclick='changeQuantity(this, 1)'>+</button>
                            </td>
                            <td class='item-total'>0đ</td>
                            <td><button>X</button></td>
                        </tr>";
                    }
                    echo "<tr>
                            <td colspan='4'><b>Tổng tiền:</b></td>
                            <td id='total-price'><b>0đ</b></td>
                            <td></td>
                        </tr>";
                } else {
                    echo "<tr><td colspan='6'>Giỏ hàng trống</td></tr>";
                }
                ?>
            </table>

            <a href="checkout.php">
                <button style="background: green; color: white; padding: 10px; margin-top: 10px; border: none; cursor: pointer;">
                Mua hàng
                </button>
            </a>
        </div>

        <script>
            function changeQuantity(button, amount) {
                let input = button.parentElement.querySelector(".quantity-input");
                let newQuantity = parseInt(input.value) + amount;
                if (newQuantity > 0) {
                    input.value = newQuantity;
                    updateTotal();
                }
            }
        </script>

        <!-- FOOTER -->
        <footer>
            <div>
                <h3>Thông tin liên hệ</h3>
                <p>Địa chỉ: Hoàng Diệu 2, Thủ Đức, Hồ Chí Minh</p>
                <p>SDT: 03587xxxxx</p>
            </div>
            <div>
                <h3>Chính sách</h3>
                <p>Giao hàng</p>
                <p>Bảo hành</p>
                <p>Tích điểm</p>
            </div>
            <div>
                <h3>Hỗ trợ</h3>
                <p>Tra cứu đơn hàng</p>
                <p>Thanh toán</p>
                <p>Liên hệ</p>
            </div>
            <div>
                <h3>Mạng xã hội</h3>
                <p>Facebook</p>
                <p>Tiktok</p>
                <p>Shopee</p>
            </div>
        </footer>
    </body>
</html>