<?php 
    session_start();
    unset($_SESSION['user_id']);
    setcookie("userid","", time() - 300, '/');
    header("Location: visualmain.php");
?>