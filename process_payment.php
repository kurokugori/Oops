<?php
session_start();
require_once 'config.php';

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["status" => "error", "message" => "Bạn cần đăng nhập để thực hiện thanh toán."]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Kiểm tra đầu vào
    if (!isset($_POST['selected_items'], $_POST['full_name'], $_POST['phone_deli'], $_POST['address_delivery'])) {
        echo json_encode(["status" => "error", "message" => "Dữ liệu không đầy đủ."]);
        exit;
    }

    $selectedItems = json_decode($_POST['selected_items'], true);
    $user_id = $_SESSION['user_id'];
    $full_name = trim($_POST['full_name']);
    $phone_deli = trim($_POST['phone_deli']);
    $address_delivery = trim($_POST['address_delivery']);
    $note = isset($_POST['note']) ? trim($_POST['note']) : '';

    // Kiểm tra danh sách sản phẩm
    if (empty($selectedItems)) {
        echo json_encode(["status" => "error", "message" => "Không có sản phẩm nào được chọn."]);
        exit;
    }

    // Bắt đầu transaction
    $conn->begin_transaction();

    try {
        // Tạo mã đơn hàng duy nhất
        $order_id = 'ORD' . time();

        // Thêm vào bảng orders
        $order_sql = "INSERT INTO orders (order_id, user_id, order_status) VALUES (?, ?, 'Pending')";
        $order_stmt = $conn->prepare($order_sql);
        $order_stmt->bind_param('ss', $order_id, $user_id);
        $order_stmt->execute();

        // Thêm chi tiết đơn hàng
        $detail_id = 1;
        foreach ($selectedItems as $item) {
            // Validate dữ liệu sản phẩm
            if (!isset($item['id'], $item['quantity'], $item['price'])) {
                throw new Exception("Dữ liệu sản phẩm không hợp lệ.");
            }

            $product_id = (int)$item['id'];
            $quantity = (int)$item['quantity'];
            $unit_price = (float)$item['price'];

            // Kiểm tra số lượng và giá trị hợp lệ
            if ($quantity <= 0 || $unit_price <= 0) {
                throw new Exception("Số lượng hoặc giá không hợp lệ cho sản phẩm ID: $product_id");
            }

            // Thêm chi tiết vào bảng order_details
            $sql = "INSERT INTO order_details (
                order_id, 
                detail_id, 
                product_id, 
                quantity, 
                unit_price, 
                phone_deli, 
                address_delivery, 
                note
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            $stmt = $conn->prepare($sql);
            $stmt->bind_param(
                'siiiisss',
                $order_id,
                $detail_id,
                $product_id,
                $quantity,
                $unit_price,
                $phone_deli,
                $address_delivery,
                $note
            );
            $stmt->execute();
            $detail_id++;
        }

        // Commit transaction
        $conn->commit();

        // Xóa session sản phẩm đã chọn
        unset($_SESSION['selected_for_payment']);

        // Trả về thành công
        echo json_encode(["status" => "success", "message" => "Đặt hàng thành công! Mã đơn hàng của bạn là: $order_id"]);
    } catch (Exception $e) {
        // Rollback transaction nếu có lỗi
        $conn->rollback();
        echo json_encode(["status" => "error", "message" => "Có lỗi xảy ra: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Phương thức không hợp lệ."]);
}
?>
