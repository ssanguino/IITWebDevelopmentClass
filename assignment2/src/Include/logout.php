<?php
session_start();
$from = $_SESSION["from"];
session_unset();
if ($from == 'admin') {
    header('Location: ' . '../Administration/admin.php');
} else {
    header('Location: ' . '../index.php');
}
?>
