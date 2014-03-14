<?php

include ('../Include/common.php');
include ('../Include/assignment2_common.php');
$title = '<base href="../"/><title>MiddleClik Marketing Administration</title>';
myheader($title);
if (empty($_SESSION['company'])) {
    $html = '<!-- Jumbotron -->
      <br><div class="jumbotron">
        <h1>MiddleClik Marketing Administration</h1>
        <p class="lead">If you are an employee of MiddleClik Marketing, please log in using the form on the upper right corner of the page to access the administration tools.</p>
        <p class="lead">If you are not, please click on the Home button on the upper left corner to go back to the users\' page.</p>
      </div>';
} else {
    if ($_SESSION['company'] == 'middleclik') {
        $html = '<!-- Jumbotron -->
                 <br><div class="jumbotron">
                <h1>MiddleClik Marketing Administration</h1>
                <p class="lead">Welcome ' . $_SESSION['user'] . '! You can now begin to upload marketing material for your clients.</p>
                </div>';
        $html .= uploadForm();
    } else {
        header('Location: ' . '../index.php');
    }
}
$_SESSION["from"] = 'admin';

mybody($html);

myfooter();
?>


