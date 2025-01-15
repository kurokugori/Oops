<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Lưu thông tin người dùng (giả lập lưu vào cơ sở dữ liệu)
    echo "Đăng ký thành công! Chào mừng " . $name . " (Email: " . $email . ")";
}
?>
