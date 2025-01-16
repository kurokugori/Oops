<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "oopsdb");
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Xử lý form chọn tháng và năm
$selected_month = isset($_POST['month']) ? (int)$_POST['month'] : date('m');
$selected_year = isset($_POST['year']) ? (int)$_POST['year'] : date('Y');

// Lấy danh sách đơn hàng trong tháng và năm đã chọn, chỉ lấy đơn hàng đã hoàn thành (order_status = 3)
$sql = "SELECT * FROM orders 
        WHERE MONTH(created_at) = $selected_month 
        AND YEAR(created_at) = $selected_year 
        AND order_status = 3";  // Chỉ lấy đơn hàng đã hoàn thành
$result = $conn->query($sql);

// Tính tổng doanh thu
$total_revenue = 0;
$orders = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $total_revenue += $row['total_prices'];
        $orders[] = $row;
    }
}

// Lấy danh sách tất cả sản phẩm và số lượng đơn hàng trong tháng và năm đã chọn
$sql_products = "SELECT p.id as product_id, p.product_name, COUNT(od.product_id) as total_orders 
                 FROM products p
                 LEFT JOIN order_details od ON p.id = od.product_id
                 LEFT JOIN orders o ON od.order_id = o.order_id 
                    AND MONTH(o.created_at) = $selected_month 
                    AND YEAR(o.created_at) = $selected_year 
                    AND o.order_status = 3
                 GROUP BY p.id";
$result_products = $conn->query($sql_products);

$best_selling = []; // Sản phẩm bán chạy (>= 15 đơn)
$worst_selling = []; // Sản phẩm bán kém (< 5 đơn, bao gồm cả sản phẩm không bán được đơn nào)

if ($result_products->num_rows > 0) {
    while ($row = $result_products->fetch_assoc()) {
        if ($row['total_orders'] >= 15) {
            $best_selling[] = $row;
        } elseif ($row['total_orders'] < 5) {
            $worst_selling[] = $row;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý doanh thu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <!-- Nút trở về trang chủ -->
        <div class="mb-3">
            <a href="index.php" class="btn btn-secondary">Trở về trang chủ</a>
        </div>

        <h1 class="text-center mb-4">Quản lý doanh thu</h1>

        <!-- Form chọn tháng và năm -->
        <form method="POST" class="mb-4">
            <div class="row">
                <div class="col-md-3">
                    <select name="month" class="form-select">
                        <?php for ($i = 1; $i <= 12; $i++): ?>
                            <option value="<?= $i ?>" <?= $i == $selected_month ? 'selected' : '' ?>>
                                Tháng <?= $i ?>
                            </option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="year" class="form-select">
                        <?php for ($i = 2020; $i <= date('Y'); $i++): ?>
                            <option value="<?= $i ?>" <?= $i == $selected_year ? 'selected' : '' ?>>
                                Năm <?= $i ?>
                            </option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary">Xem doanh thu</button>
                </div>
            </div>
        </form>

        <!-- Hiển thị tổng doanh thu -->
        <div class="alert alert-success">
            <h4>Tổng doanh thu tháng <?= $selected_month ?> năm <?= $selected_year ?>: 
                <?= number_format($total_revenue, 0, ',', '.') ?> VNĐ
            </h4>
        </div>

        <!-- Hiển thị danh sách đơn hàng -->
        <?php if (!empty($orders)): ?>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID đơn hàng</th>
                    <th>Ngày đặt hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($orders as $order): ?>
                <tr>
                    <td><?= $order['order_id'] ?></td>
                    <td><?= $order['order_date'] ?></td>
                    <td><?= number_format($order['total_prices'], 0, ',', '.') ?> VNĐ</td>
                    <td>Đã hoàn thành</td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <?php else: ?>
        <div class="alert alert-warning">Không có đơn hàng nào đã hoàn thành trong tháng này.</div>
        <?php endif; ?>

        <!-- Hiển thị sản phẩm bán chạy và bán kém -->
        <h3 class="mt-5">Sản phẩm bán chạy (>= 15 đơn)</h3>
        <?php if (!empty($best_selling)): ?>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID Sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng đơn</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($best_selling as $product): ?>
                <tr>
                    <td><?= $product['product_id'] ?></td>
                    <td><?= $product['product_name'] ?></td>
                    <td><?= $product['total_orders'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <?php else: ?>
        <div class="alert alert-info">Không có sản phẩm nào bán chạy trong tháng này.</div>
        <?php endif; ?>

        <h3 class="mt-5">Sản phẩm bán kém (< 5 đơn, bao gồm cả sản phẩm không bán được đơn nào)</h3>
        <?php if (!empty($worst_selling)): ?>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID Sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng đơn</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($worst_selling as $product): ?>
                <tr>
                    <td><?= $product['product_id'] ?></td>
                    <td><?= $product['product_name'] ?></td>
                    <td><?= $product['total_orders'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <?php else: ?>
        <div class="alert alert-info">Không có sản phẩm nào bán kém trong tháng này.</div>
        <?php endif; ?>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<?php $conn->close(); ?>