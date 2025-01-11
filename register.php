<?php
    session_start();
    if(isset($_POST['register'])){
        require_once "config_btn.php";
        $full_name = $_POST['full_name'];
        $names = explode(" ", $full_name); 
        $first_name = $names[0]; 
        $last_name = implode(" ", array_slice($names, 1));
        $email = $_POST['email'];
        $password = md5($_POST['password']);

        if(!empty($full_name) && (!empty($email) && !empty($password))){
            $sql = "INSERT INTO users (first_name, last_name, email, password) 
                    VALUES (?,?,?,?)"; 
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('ssss', $first_name, $last_name, $email, $password);
            $stmt->execute();
            if ($stmt) {
                echo "Đăng ký thành công";
                $stmt->close();
            }
            $conn->close();
        }
        else{
            echo "Vui lòng nhập dữ liệu";
        }
    }

?>
