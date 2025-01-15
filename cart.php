<?php
session_start();
require_once "config_btn.php";
include "header.php";
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
            max-width: 100px;
            height: auto;
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

        /* Product Grid */
        .product-grid {
            padding: 20px;
            text-align: center;
        }

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
    </style>
</head>
<body onload="updateTotal()">
    <!-- DANH MỤC SẢN PHẨM -->
    <div class="categories">
        <a href="#"><b>Apple</b></a>
        <a href="#"><b>Samsung</b></a>
        <a href="#"><b>Oppo</b></a>
        <a href="#"><b>Xiaomi</b></a>
    </div>

    <!-- GIỎ HÀNG -->
    <div class="product-grid">
        <h2>Giỏ Hàng</h2>
        <table class="cart-table">
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
                    // Truy vấn để lấy tên và đơn giá từ cơ sở dữ liệu
                    $sql = "SELECT product_name, unit_price, image_url FROM products WHERE id = '$id'";
                    $result = $conn->query($sql);
                    $productData = $result->fetch_assoc();

                    $name = $productData['product_name'];
                    $price = $productData['unit_price'];
                    $image = $productData['image_url'];
                    $quantity = $product['quantity']; // Số lượng trong giỏ hàng
                    $subtotal = $price * $quantity;
                    ?>
                                     echo "<tr class='cart-item'>
                        <td><input type='checkbox' class='select-item' onclick='updateTotal()'></td>
                        <td><img src='anh/" . htmlspecialchars($image) . "' alt='' width='50'> " . htmlspecialchars($name) . "</td>
                        <td class='item-price'>{$price}đ</td>
                        <td>
                            <button onclick='changeQuantity(this, -1)'>-</button> 
                            <input type='text' class='quantity-input' value='{$quantity}' size='2' onchange='updateTotal()'> 
                            <button onclick='changeQuantity(this, 1)'>+</button>
                        </td>
                        <td class='item-total'>{$subtotal}đ</td>
                        <td>
                            <a href='remove_cart.php?id={$id}' onclick=\"return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');\">X</a>
                        </td>
                    </tr>";
                    <?php
                }
                ?>
                echo "<tr>
                        <td colspan='4'><b>Tổng tiền:</b></td>
                        <td id='total-price'><b>0đ</b></td>
                        <td></td>
                    </tr>";
                    <?php
            } else {
                echo "<tr><td colspan='6'>Giỏ hàng trống</td></tr>";
            }
            ?>
        </table>

        <!-- Form để gửi dữ liệu sang payment.php -->
        <form action="payment.php" method="post" id="checkoutForm">
            <input type="hidden" name="selected_items" id="selectedItems">
            <button type="submit" style="background: green; color: white; padding: 10px; margin-top: 10px; border: none; cursor: pointer;">
                Mua hàng
            </button>
        </form>
    </div>

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

        function changeQuantity(button, amount) {
            let input = button.parentElement.querySelector(".quantity-input");
            let newQuantity = parseInt(input.value) + amount;
            if (newQuantity > 0) {
                input.value = newQuantity;
                updateTotal();
            }
        }

<<<<<<< HEAD
        document.getElementById('checkoutForm').addEventListener('submit', function(event) {
=======
            function removecart(productId) {
            // Gửi yêu cầu xóa sản phẩm khỏi giỏ hàng
            window.location.href = 'remove_cart.php?id=' + productId;
        }

        function submitSelectedItems() {
>>>>>>> b9092a29dc7c32f38ab0b4cdadfac2ea5c291681
            let selectedItems = [];
            document.querySelectorAll(".cart-item").forEach(row => {
                let checkbox = row.querySelector(".select-item");
                if (checkbox.checked) {
<<<<<<< HEAD
                    let productId = row.querySelector("a[href*='remove_cart.php']").getAttribute('href').split('=')[1];
                    let quantity = parseInt(row.querySelector(".quantity-input").value);
                    let price = parseFloat(row.querySelector(".item-price").innerText.replace('đ', ''));
                    selectedItems.push({ id: productId, quantity: quantity, price: price });
                }
            });

            document.getElementById('selectedItems').value = JSON.stringify(selectedItems);
        });
=======
                let productId = row.querySelector("a").href.split('id=')[1];
                let quantity = row.querySelector(".quantity-input").value;
                let price = parseFloat(row.querySelector(".item-price").innerText.replace('đ', ''));
                // Lấy tên sản phẩm từ cell thứ 2, loại bỏ phần img
                let productCell = row.querySelector("td:nth-child(2)");
                let productName = productCell.innerText.trim();
                selectedItems.push({
                    id: productId,
                    quantity: quantity,
                    price: price,
                    name: productName
                });
                }
            });
            document.getElementById("selected-items").value = JSON.stringify(selectedItems);
        }
>>>>>>> b9092a29dc7c32f38ab0b4cdadfac2ea5c291681
    </script>

    <!-- FOOTER -->
    <?php include "footer.php"; ?>
</body>
</html>