<?php

include ('Include/common.php');
include ('Include/assignment2_common.php');
$title = '<title>Welcome to MiddleClik Marketing!</title>';
myheader($title);
if (empty($_SESSION['company'])) {
    $html = '<!-- Jumbotron -->
      <br><div class="jumbotron">
        <h1>MiddleClik Marketing</h1>
        <p class="lead">Welcome! Please sign in using the form in the upper right corner of the page to access to your account.</p>
      </div>';
} else {
    $html = '<!-- Jumbotron -->
      <br><div class="jumbotron">
        <h1>MiddleClik Marketing</h1>
        <p class="lead">Welcome ' . $_SESSION['user'] . '! Here you can see the marketing material of your company: ' . $_SESSION['company'] . '.</p>
      </div>';
    $html .= printCSV();    
    $html .= printSnippets();
    $html .= printImages();
}
$_SESSION['from'] = 'user';
mybody($html);
myfooter();

?>
