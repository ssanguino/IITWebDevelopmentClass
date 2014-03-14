<?php

function connect() {
    return mysqli_connect('buffalogrove.sat.iit.edu:3306', 'iituser', '-8iituser!', 'middleclik');
}

function getCompanyUser ($user, $password, $dbc) {
    $result = mysqli_query($dbc, 'select * from users where username=\''. mysql_real_escape_string($user).'\' and password=\''. mysql_real_escape_string($password) . '\' limit 1');
    $row = mysqli_fetch_assoc($result);
    return $row;
}

        
?>
