<?php
    session_start();?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập và Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            width: 800px;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form {
            width: 45%;
            padding: 20px;
        }
        .form h2 {
            margin-bottom: 20px;
        }
        .form input[type="text"],
        .form input[type="email"],
        .form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .form input[type="submit"]:hover {
            background-color: #444;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Form Đăng Nhập -->
        <div class="form">
            <h2>ĐĂNG NHẬP</h2>
            <form action="login.php" method="post">
                <label for="login-email">Địa chỉ email *</label>
                <input type="email" id="login-email" name="email" required>
                <label for="login-password">Mật khẩu *</label>
                <input type="password" id="login-password" name="password" required>
                <input type="submit" value="ĐĂNG NHẬP">
            </form>
        </div>

        <!-- Form Đăng Ký -->
        <div class="form" style ="width: 40%;">
            <h2>ĐĂNG KÝ</h2>
            <form action="register.php" method="post">
                <label for="register-name">Họ tên *</label>
                <input type="text" id="register-name" name="full_name" required>

                <label for="register-email">Địa chỉ email *</label>
                <input type="email" id="register-email" name="email" required>

                <label for="register-password">Mật khẩu *</label>
                <input type="password" id="register-password" name="password" required>
                
                <input type="submit" value="ĐĂNG KÝ" name ="register">
            </form>
        </div>
    </div>

    <?php
    require_once 'config_btn.php';

    // Xử lý đăng nhập
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $email = $_POST['email'];
        $password = $_POST['password'];

        // Kiểm tra thông tin đăng nhập
        $sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $email, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['role'] = $user['role'];

            //Chuyển hướng dựa trên role
            if ($user['role'] == 'admin') {
                header("Location: quanly/index.php");
            } else {
                header("Location: thanhtoan.php");
            }
            exit;
        } else {
            $error = "Số điện thoại hoặc mật khẩu không đúng!";
        }
    }
    ?>

    
</body>
</html>
