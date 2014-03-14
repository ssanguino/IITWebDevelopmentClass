<?php
ob_start();
session_start();
$everythingFine = true;
$badName = array_merge(array_map('chr', range(0, 31)), array("<", ">", ":", '"', "/", "\\", "|", "?", "*"));
if (isset($_POST["campaign"]) && !empty($_POST["campaign"]) && isset($_POST["company"]) && !empty($_POST["company"])) {
    $company = str_replace($badName, "", $_POST["company"]);
    $campaign = str_replace($badName, "", $_POST["campaign"]);
    $dir = '../Content/'.$company;
    if (!empty($_POST["htmlsnippet"]) || !empty($_FILES["image"]["name"]) || !empty($_FILES["csv"]["name"])) {
        if(!is_dir($dir)) {
            mkdir('../Content/'.$company);
        }
        if (isset($_POST["htmlsnippet"]) && !empty($_POST["htmlsnippet"])) {
            $snippet = fopen('../Content/' . $company . '/' . $campaign . '.html', 'w');
            fwrite($snippet, $_POST["htmlsnippet"]);
            fclose($snippet);
        }
        if (isset($_FILES["image"]) && !empty($_FILES["image"]["name"])) {
            if (getimagesize($_FILES["image"]["tmp_name"]) != 0) {
                $info = pathinfo($_FILES['image']['name']);
                $ext = $info['extension']; // get the extension of the file
                $newname = $campaign . '.' . $ext;
                $target = '../Content/' . $company . '/' . $newname;                
                move_uploaded_file($_FILES['image']['tmp_name'], $target);
            } else {
                //It was not an image
                $everythingFine = false;
                $_SESSION["errors"] = '<h3 style="color:red; text-align:center">You tried to upload something that was not an image!'.$ext.'</h3>';
            }
        }
        if (isset($_FILES["csv"]) && !empty($_FILES["csv"]["name"])) {
            $info = pathinfo($_FILES['csv']['name']);
            $ext = $info['extension'];
            if ($ext == 'csv') {
                $newname = 'marketing.csv';
                $target = '../Content/' . $company . '/' . $newname;
                move_uploaded_file($_FILES['csv']['tmp_name'], $target);
            } else {
                //It was not a csv file
                $everythingFine = false;
                $_SESSION["errors"] = '<h3 style="color:red; text-align:center">You tried to upload something that was not a csv file!</h3>';
            }
        }
    } else {
        $everythingFine = false;
        $_SESSION["errors"] = '<h3 style="color:red; text-align:center">You did not select anything to upload!</h3>';
    }
} else {
    $everythingFine = false;
    $_SESSION["errors"] = '<h3 style="color:red; text-align:center">The campaign name and the company name are mandatory.</h3>';
}

if ($everythingFine) {
    $_SESSION["errors"] = '<h3 style="color:green; text-align:center">Everything worked! Content Uploaded!</h3>';
}

header('Location: ' . '../Administration/admin.php');
ob_end_flush();

?>
