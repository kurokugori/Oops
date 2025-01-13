<?php
session_start();
require_once 'config_btn.php'; // Kết nối cơ sở dữ liệu

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['register'])) {
        // Xử lý đăng ký
        $full_name = trim($_POST['full_name']);
        $email = trim($_POST['email']);
        $password = password_hash(trim($_POST['password']), PASSWORD_DEFAULT); // Mã hóa mật khẩu

        // Tách họ và tên
        $name_parts = explode(' ', $full_name);
        $last_name = array_pop($name_parts); // Lấy tên cuối cùng (giờ là last_name)
        $first_name = implode(' ', $name_parts); // Phần còn lại là first_name

        // Kiểm tra email đã tồn tại
        $sql_check = "SELECT * FROM users WHERE email = ?";
        $stmt_check = $conn->prepare($sql_check);
        $stmt_check->bind_param("s", $email);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        if ($result_check->num_rows > 0) {
            $error = "Email đã tồn tại. Vui lòng sử dụng email khác.";
        } else {
            // Thêm thông tin vào cơ sở dữ liệu
            $sql_register = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
            $stmt_register = $conn->prepare($sql_register);
            $stmt_register->bind_param("ssss", $first_name, $last_name, $email, $password);
            
            if ($stmt_register->execute()) {
                $success = "Đăng ký thành công. Bạn có thể đăng nhập.";
            } else {
                $error = "Đã xảy ra lỗi. Vui lòng thử lại.";
            }
        }
    }

    if (isset($_POST['login'])) {
        // Xử lý đăng nhập
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);

        // Kiểm tra thông tin đăng nhập
        $sql_login = "SELECT * FROM users WHERE email = ?";
        $stmt_login = $conn->prepare($sql_login);
        $stmt_login->bind_param("s", $email);
        $stmt_login->execute();
        $result_login = $stmt_login->get_result();

        if ($result_login->num_rows > 0) {
            $user = $result_login->fetch_assoc();
            if (password_verify($password, $user['password'])) {
                // Đăng nhập thành công
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['role'] = $user['role'];

                // Chuyển hướng dựa trên role
                if ($user['role'] == 'admin') {
                    header("Location: quanly/index.php");
                } else {
                    header("Location: thanhtoan.php");
                }
                exit;
            } else {
                $error = "Mật khẩu không chính xác.";
            }
        } else {
            $error = "Email không tồn tại. Vui lòng đăng ký trước.";
        }
    }
}
?>
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
            <form action="" method="post">
                <label for="login-email">Địa chỉ email *</label>
                <input type="email" id="login-email" name="email" required>
                <label for="login-password">Mật khẩu *</label>
                <input type="password" id="login-password" name="password" required>
                <input type="submit" value="ĐĂNG NHẬP" name="login">
            </form>
        </div>

        <!-- Form Đăng Ký -->
        <div class="form" style="width: 40%;">
            <h2>ĐĂNG KÝ</h2>
            <form action="" method="post">
                <label for="register-name">Họ tên *</label>
                <input type="text" id="register-name" name="full_name" required>

                <label for="register-email">Địa chỉ email *</label>
                <input type="email" id="register-email" name="email" required>

                <label for="register-password">Mật khẩu *</label>
                <input type="password" id="register-password" name="password" required>
                
                <input type="submit" value="ĐĂNG KÝ" name="register">
            </form>
            <?php if (isset($success)) echo "<p style='color: green;'>$success</p>"; ?>
            <?php if (isset($error)) echo "<p style='color: red;'>$error</p>"; ?>
        </div>
    </div>
</body>
</html>
