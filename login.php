<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Kiểm tra thông tin (ở đây chỉ là ví dụ)
    if ($email == "user@example.com" && $password == "123456") {
        echo "Đăng nhập thành công! Chào mừng " . $email;
    } else {
        echo "Sai email hoặc mật khẩu!";
    }
}
?>
