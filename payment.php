<?php
session_start();
require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['selected_items'])) {
    $_SESSION['selected_for_payment'] = $_POST['selected_items'];
}
include 'header.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .left {
            width: 40%; 
            background-color: rgb(255, 255, 255);
            padding: 20px;
            box-sizing: border-box;
            float: left;
        }
        .right {
            width: 60%;
            background-color: rgb(255, 255, 255);
            padding: 20px;
            box-sizing: border-box;
            float: left;
        }
        .payment-container {
            display: flex;
            border: 2px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
            margin: 15px;
        }
        .item {
            border: 1px solid #E2E0E0;
            text-align: center;
            border-radius: 15px;
            overflow: hidden;
            margin: 15px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-group textarea {
            resize: none;
        }
        .payment-method {
            margin-top: 10px;
        }
        .payment-method input {
            margin-right: 10px;
        }
        .submit-btn {
            width: auto;
            background-color: #28a745;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .submit-btn:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
            color: black;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <div class='left'>
            <div class="item">
                <h2>Thông tin giao hàng</h2>
                <div>
                    <?php
                    if(isset($_SESSION['user_id'])) {
                        $user_id = $_SESSION['user_id'];
                        ?>
                        <span style="color: black;">
                            <p style="color:rgb(83, 13, 46);">Mã khách hàng của bạn là: <?php echo $user_id; ?></p>
                        </span>
                        <a href="logout.php" target="_blank">Đăng xuất</a>
                        <?php
                    } else {
                        ?>
                        <h3>Bạn đã có tài khoản? <a href="login.php" target="_blank">Đăng nhập</a></h3>
                        <?php
                    }
                    ?>
                </div>
                <!-- Delivery Information Form -->
                <form id="deliveryForm" method="post" style="margin: 10px 35px;">
                    <div class="form-group">
                        <input type="text" name="full_name" id="full_name" placeholder="Họ và Tên" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="phone_deli" id="phone_deli" pattern="[0-9]{10}" placeholder="Số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="address_delivery" id="address_delivery" placeholder="Địa chỉ" required>
                    </div>
                    <div class="form-group">
                        <textarea name="note" id="note" cols="15" rows="3" placeholder="Ghi chú"></textarea>
                    </div>
                    <div class="payment-method">
                        <label><input type="radio" name="payment_method" value="cod" checked> Cash on Delivery (COD)</label>
                    </div>
                </form>
            </div>
        </div>

        <div class='right'>
            <h2 style="color: red;">Thông tin thanh toán</h2>
            <?php
            if (isset($_SESSION['selected_for_payment'])) {
                $selectedItems = json_decode($_SESSION['selected_for_payment'], true);
                if (!empty($selectedItems)) {
                    ?>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng</th>
                                <th>Giá</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $total_price = 0;
                            foreach ($selectedItems as $item) {
                                // Sử dụng ID để lấy thông tin sản phẩm
                                $sql = "SELECT product_name FROM products WHERE id = ?";
                                $stmt = $conn->prepare($sql);
                                $stmt->bind_param("i", $item['id']);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                $product = $result->fetch_assoc();

                                $product_name = $product['product_name'] ?? 'Không tìm thấy sản phẩm';
                                $quantity = $item['quantity'] ?? 1;
                                $price = $item['price'] ?? 0;

                                $item_total = $quantity * $price;
                                $total_price += $item_total;
                                ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($product_name); ?></td>
                                    <td><?php echo htmlspecialchars($quantity); ?></td>
                                    <td><?php echo number_format($price, 0); ?> vnđ</td>
                                    <td><?php echo number_format($item_total, 0); ?> vnđ</td>
                                </tr>
                                <?php
                            }
                            ?>
                        </tbody>
                    </table>
                    <div>
                        <h4 style="float:left; font-size: 18px;">Tổng Thành Tiền: <?php echo number_format($total_price, 0); ?> VNĐ</h4>
                        <button onclick="processPayment()" class="submit-btn" style="float:right;">
                            <?php echo isset($_SESSION['user_id']) ? 'Thanh Toán' : 'Đăng nhập để thanh toán'; ?>
                        </button>
                    </div>
                    <?php
                } else {
                    echo "<p>Không có sản phẩm nào được chọn.</p>";
                }
            } else {
                echo "<p>Không có sản phẩm nào được chọn.</p>";
            }
            ?>
        </div>
    </div>

    <script>
        function processPayment() {
            <?php if (!isset($_SESSION['user_id'])) { ?>
                window.location.href = 'login.php';
                return;
            <?php } ?>

            const form = document.getElementById('deliveryForm');
            if (!form.checkValidity()) {
                alert('Vui lòng điền đầy đủ thông tin giao hàng!');
                return;
            }

            const formData = new FormData(form);
            formData.append('selected_items', '<?php echo isset($_SESSION['selected_for_payment']) ? addslashes($_SESSION['selected_for_payment']) : ""; ?>');

            fetch('process_payment.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(result => {
                if (result.includes('success')) {
                    alert('Đặt hàng thành công!');
                    window.location.href = 'index.php';
                } else {
                    alert('Có lỗi xảy ra!');
                }
            })
            .catch(error => {
                alert('Có lỗi xảy ra!');
                console.error('Error:', error);
            });
        }
    </script>

    <?php include 'footer.php'; ?>
</body>
</html>
