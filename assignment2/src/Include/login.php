<?php
ob_start();
session_start();
include ('databasefunctions.php');
$dbc = connect();
if ($dbc) {
    if (isset($_POST["user"]) && (!empty($_POST["user"])) && isset($_POST["password"]) && (!empty($_POST["password"]))) {
        $user = getCompanyUser($_POST["user"],$_POST["password"], $dbc);
        if (!empty($user)){
            $_SESSION['user'] = $user['username'];
            $_SESSION['company'] = $user['company'];
            redirect();
        } else {
            $_SESSION["errors"] = '<h3 style="color:red; text-align:center">The username and password you introduced is not a valid user.</h3>';
            redirect();
        }
    } else {
        $_SESSION["errors"] = '<h3 style="color:red; text-align:center">Please introduce your username and password.</h3>';
        redirect();
    }
};
ob_end_flush();

function redirect() {
    if ($_SESSION["from"] == 'admin') {
        header('Location: ' . '../Administration/admin.php');
    } else {
        header('Location: ' . '../index.php');
    }
}

?>

