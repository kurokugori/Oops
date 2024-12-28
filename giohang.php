<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao Diện Hoàn Chỉnh</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
        }
        .logo {
            text-align: center;
            flex: 1;
        }
        .logo img {
            max-width: 150px;
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
        .cart-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .cart-table img {
            width: 50px;
        }
        .cart-table .actions {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 5px;
        }
        .cart-table .quantity {
            width: 40px;
            height: 30px;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }
        .total-and-button {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 20px auto;
        }
        .actions button {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .actions button:hover {
            background-color: #0056b3;
        }
        .highlight-button {
            background-color: #00FF00;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .highlight-button:hover {
            background-color: #e64a19;
        }
        .footer {
            background-color: #f4f4f4;
            padding: 20px;
            border-top: 1px solid #ddd;
            text-align: center;
            display: flex;
            justify-content: space-around;
        }
        .footer div {
            flex: 1;
        }
    </style>
    <script>
        function updateTotal() {
            const rows = document.querySelectorAll('.cart-row');
            let total = 0;

            rows.forEach(row => {
                const checkbox = row.querySelector('.select-item');
                const price = parseFloat(row.querySelector('.price').innerText.replace('đ', '').replace(',', ''));
                const quantity = parseInt(row.querySelector('.quantity').value);

                // Tính lại thành tiền cho từng sản phẩm
                const totalItem = price * quantity;
                row.querySelector('.total-item').innerText = totalItem.toFixed(3) + 'đ';

                // Cập nhật tổng tiền nếu sản phẩm được chọn
                if (checkbox.checked) {
                    total += totalItem;
                }
            });

            document.getElementById('total-amount').innerText = `${total.toFixed(3)}đ`;
        }

        function deleteRow(button) {
            const row = button.parentElement.parentElement;
            row.remove();
            updateTotal();
        }

        function increaseQuantity(input) {
            input.value = parseInt(input.value) + 1;
            updateTotal();
        }

        function decreaseQuantity(input) {
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
                updateTotal();
            }
        }
    </script>
</head>
<body>
<header>
    <div class="address">Hoàng Diệu 2, Thủ Đức, Hồ Chí Minh</div>
    <div class="logo">
        <img src="logo-placeholder.png" alt="Oops Logo">
    </div>
    <div class="user-actions">
        <span>🔔</span>
        <span>👤</span>
        <span>🛒</span>
    </div>
</header>
<div class="search-bar">
    <input type="text" placeholder="Tìm kiếm sản phẩm...">
</div>
<nav class="categories">
    <a href="#">Iphone</a>
    <a href="#">Samsung</a>
    <a href="#">Oppo</a>
    <a href="#">Xiaomi</a>
    <a href="#">Khác</a>
</nav>

<main>
    <h2 style="text-align: center;">Giỏ Hàng</h2>
    <table class="cart-table">
        <thead>
            <tr>
                <th>Chọn</th>
                <th>Sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Xóa</th>
            </tr>
        </thead>
        <tbody>
            <tr class="cart-row">
                <td><input type="checkbox" class="select-item" onchange="updateTotal()"></td>
                <td><img src="product-placeholder.png" alt="Sản phẩm"><br>Ốp lưng iPhone 11</td>
                <td class="price">18.999đ</td>
                <td class="actions">
                    <button onclick="decreaseQuantity(this.nextElementSibling)">-</button>
                    <input type="number" class="quantity" value="1" min="1" onchange="updateTotal()">
                    <button onclick="increaseQuantity(this.previousElementSibling)">+</button>
                </td>
                <td class="total-item">18.999đ</td>
                <td><button onclick="deleteRow(this)">❌</button></td>
            </tr>
            <tr class="cart-row">
                <td><input type="checkbox" class="select-item" onchange="updateTotal()"></td>
                <td><img src="product-placeholder.png" alt="Sản phẩm"><br>Ốp lưng Samsung</td>
                <td class="price">15.969đ</td>
                <td class="actions">
                    <button onclick="decreaseQuantity(this.nextElementSibling)">-</button>
                    <input type="number" class="quantity" value="2" min="1" onchange="updateTotal()">
                    <button onclick="increaseQuantity(this.previousElementSibling)">+</button>
                </td>
                <td class="total-item">31.938đ</td>
                <td><button onclick="deleteRow(this)">❌</button></td>
            </tr>
            <tr class="cart-row">
                <td><input type="checkbox" class="select-item" onchange="updateTotal()"></td>
                <td><img src="product-placeholder.png" alt="Sản phẩm"><br>Ốp lưng Xiaomi</td>
                <td class="price">20.684đ</td>
                <td class="actions">
                    <button onclick="decreaseQuantity(this.nextElementSibling)">-</button>
                    <input type="number" class="quantity" value="1" min="1" onchange="updateTotal()">
                    <button onclick="increaseQuantity(this.previousElementSibling)">+</button>
                </td>
                <td class="total-item">20.684đ</td>
                <td><button onclick="deleteRow(this)">❌</button></td>
            </tr>
        </tbody>
    </table>
    <div class="total-and-button">
        <div class="total">
            Tổng tiền: <span id="total-amount">0đ</span>
        </div>
        <button class="highlight-button">Mua hàng</button>
    </div>
</main>

<footer class="footer">
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
