<?php

function myheader($additionalHeaderContent = NULL) {
    ob_start();
    session_start();
    print '<!doctype html>';
    print '<html lang="en">';
    print '<head>';
    print $additionalHeaderContent;
    print "<link href=\"css/bootstrap.css\" rel=\"stylesheet\">";
    print "<link href=\"css/justified-nav.css\" rel=\"stylesheet\">";
    print '</head>';
}

function mybody($bodyContents = '') {
    print '<body>';
    navbar();
    print '<div class="container">';
    print $bodyContents;
    showErrors();
    authorFooter();
    print '</div>';
    print '</body>';
}

function showErrors() {
    if (isset($_SESSION["errors"]) && !empty($_SESSION["errors"])) {
        print $_SESSION["errors"];
        $_SESSION["errors"] = '';
    }
}

function navbar() {
    print '<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php">MiddleClik Marketing</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.php">Home</a></li>
            <li><a href="mailto:ssanguin@hawk.iit.edu">Contact</a></li>';
    if (!empty($_SESSION['company']) && !($_SESSION['from'] == 'admin')) {
        printSections();
    }
    print '</ul>';
    if (empty($_SESSION['company'])) {
        loginForm();
    } else {
        logoutButton();
    }
    print '</div><!--/.navbar-collapse -->
      </div>
    </div>';
}

function printSections() {
    print '<li><a href="#csv">CSV</a></li>';
    print '<li><a href="#snippets">HTML Snippets</a></li>';
    print '<li><a href="#images">Images</a></li>';
}

function loginForm() {
    print '<form action="Include/login.php" method="POST" class="navbar-form navbar-right">
            <div class="form-group">
              <input id="user" name="user" type="text" placeholder="User" class="form-control" required="">
            </div>
            <div class="form-group">
              <input id="password" name="password" type="password" placeholder="Password" class="form-control" required="">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>';
}

function logoutButton() {
    print '<div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="Include/logout.php">Logout</a></li>
                </ul>
           </div>';
}

function authorFooter() {
    print '<br><br><br><footer class="footer" style="text-align:center">
        <p>&copy; Sergio Sanguino Serrano 2013</p>
      </footer>';
}

function myfooter() {
    print '</html>';
    ob_end_flush();
}
?>