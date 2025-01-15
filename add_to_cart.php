<?php
session_start();

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $product_id = $_POST['product_id'];
        $product_name = $_POST['product_name'];
        $product_price = $_POST['product_price'];
        $product_image = $_POST['product_image'];

        // Kiểm tra giỏ hàng đã tồn tại chưa
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
        if (isset($_SESSION['cart'][$product_id])) {
            $_SESSION['cart'][$product_id]['quantity'] += 1; // Nếu có thì tăng số lượng
        } else {
            $_SESSION['cart'][$product_id] = [
                'name' => $product_name,
                'price' => $product_price,
                'image' => $product_image,
                'quantity' => 1
            ];
        }
        

        // Quay về trang giỏ hàng
        header("Location: cart.php");
        exit();
    }
?>
