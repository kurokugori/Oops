<?php
session_start();

// Kiểm tra nếu có ID sản phẩm được gửi từ URL
if (isset($_GET['id'])) {
    $productId = $_GET['id'];

    // Kiểm tra nếu sản phẩm tồn tại trong giỏ hàng (session)
    if (isset($_SESSION['cart'][$productId])) {
        unset($_SESSION['cart'][$productId]); // Xóa sản phẩm khỏi giỏ hàng
    }

    // Sau khi xóa, chuyển hướng lại trang giỏ hàng (cart.php)
    header('Location: cart.php');
    exit;
}
?>
