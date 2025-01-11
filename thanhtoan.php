<?php 
    session_start();
    require_once 'config_btn.php';
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit();
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops Store</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            height: 100vh; /* Chiều cao 100% màn hình */
        }
        .left {
            width: 40%; 
            background-color:rgb(255, 255, 255);
            padding: 20px;
            box-sizing: border-box;
            float:left;
        }
        .right {
            width: 60%;
            background-color:rgb(255, 255, 255);
            padding: 20px;
            box-sizing: border-box;
            float:left;
            
        }
        .payment-container {
            display: flex; /* Sắp xếp flex để đặt left và right cạnh nhau */
            border: 2px solid #ccc; /* Viền cho khung */
            border-radius: 8px; /* Bo góc */
            overflow: hidden; /* Ẩn nội dung vượt khung */
            background-color: #fff; /* Nền trắng */
            margin: 15px;
        }
        .item {
            border: 1px solid #E2E0E0;
            text-align: center; /* không để width vì để hệ thống tự căn chỉnh cho phù hợp*/
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
            width: auto ;
            background-color: #28a745;
            color: white;
            padding: 8px;
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
<body>
    <?php 
        include 'header.php';
        include 'categories.php';
    ?>
    <!-- Product Grid -->
    <div class="payment-container">
    <div class='left'>
            <div class ="item">
                <h2>Thông tin giao hàng</h2>
                <div>
                    <h3>Bạn đã có tài khoản?<a href="login.php" target="_blank">Đăng nhập</a></h3>
                    <h3><a href="logout.php" target="_blank">Đăng xuất</a></h3>
                </div>
                <form action="#" method ="post" style="margin: 10px 35px;"> 
                    <div class="form-group">
                        <input type="text" name="full_name" placeholder="Họ và Tên" required></br>
                    </div>
                    <div class="form-group">
                        <input type="text" name="phone_deli"  pattern="[0-9]{10}" placeholder="Số điện thoại" required></br>
                    </div>        
                    <div class="form-group">
                    <input type="text" name="address_delivery" placeholder="Địa chỉ" required></br>
                    </div>
                    <div class="form-group">
                        <textarea name="ghi_chu" cols="15" rows="3">Ghi chú</textarea>
                    </div>
                    <div class="payment-method">
                        <label><input type="radio" name="payment_method" value="cod" checked> Cash on Delivery (COD)</label>
                    </div>
                    <div>
                        <input type ="submit" value ="Lưu thông tin" name ="ship_info" class="submit-btn">
                    </div>
                    
                </form>

                <?php
                    // Kiểm tra xem người dùng đã đăng nhập chưa
                    if (isset($_SESSION['user_id'])) {
                        $sql = "SELECT * FROM users WHERE id = ?"; 
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param("i", $_SESSION['user_id']);
                        $stmt->execute();
                        $info_user = $stmt->get_result()->fetch_assoc();
                        $_POST['full_name'] = $info_user['first_name'];
                        $phone_deli = $info_user['phone'];
                        $_POST['phone_deli'] = $phone_deli;
                        echo $_SESSION['user_id'];
                    }
                    

                    if(isset($_POST['ship_info'])) {
                        if(empty($_POST['address_delivery'])) {
                            echo "<p>Vui lòng nhập địa chỉ giao hàng</p>";
                            exit;
                        }
                        $address_delivery = $_POST['address_delivery'];
                        $sql = "INSERT INTO order_details (phone_deli, address_delivery) VALUES (?,?)";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param('ss', $phone_deli, $address_delivery);
                        if($stmt->execute()) {
                            echo "<p>Lưu thông tin thành công</p>";
                        } else {
                            echo "<p>Có lỗi xảy ra</p>";
                        }
                        $stmt->close();
                    }
                ?>
            </div>
        </div>



        <div class='right'>
            <h2 style="color: red;">Thông tin thanh toán</h2>
            <?php
                if (isset($_SESSION['user_id'])) {
                    $user_id = $_SESSION['user_id'];
                    $sql = "SELECT  od.product_id,
                                    p.product_name,
                                    od.quantity,
                                    od.unit_price,
                                    (od.quantity * od.unit_price) as total_item_price,
                                    o.order_id,
                                    o.order_date,
                                    o.total_prices
                            FROM orders o
                            INNER JOIN order_details od ON o.order_id = od.order_id
                            INNER JOIN products p ON od.product_id = p.id
                            WHERE o.user_id = ?
                            ORDER BY o.order_date DESC";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("s", $user_id);
                    $stmt->execute();
                    $result = $stmt->get_result();

                    if ($result->num_rows > 0) {
                        ?>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Số Lượng</th>
                                    <th>Giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $total_price = 0;
                                while ($row = $result->fetch_assoc()) {
                                    $total_price += $row['total_item_price'];
                                    ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($row['order_id']); ?></td>
                                        <td><?php echo htmlspecialchars($row['product_id']); ?></td>
                                        <td><?php echo htmlspecialchars($row['product_name']); ?></td>
                                        <td><?php echo htmlspecialchars($row['quantity']); ?></td>
                                        <td><?php echo number_format($row['unit_price'], 0); ?> vnđ</td>
                                        <td><?php echo number_format($row['total_item_price'], 0); ?> vnđ</td>
                                    </tr>
                                    <?php
                                }
                                ?>
                            </tbody>
                        </table>
                        <div><h4 style="float:left; font-size: 18px;">Tổng Thành Tiền: <?php echo number_format($total_price, 0); ?> VNĐ</h4></div>
                        <form action="process_payment.php" method="POST" style="float:right;">
                            <input type ="submit" value ="Thanh Toán " name ="payment" class="submit-btn">
                        </form>
                    <?php 
                    }
                    else {
                        echo "<p>Không có đơn hàng nào.</p>";
                    }
                    
                    $stmt->close();
                }
                else {
                    echo "<p>Vui lòng đăng nhập để xem đơn hàng.</p>";
                }

            ?>
        </div>
    </div>

    <?php 
        include 'footer.php';
    ?>
</body>
</html>
