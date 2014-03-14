<?php

define('DATA_DIRECTORY',"Content");

//assignment specific functions
function printCSV(){
    $result = '';
    $firstFile = true;
    foreach (glob("Content/" . $_SESSION['company'] . "/*.csv") as $filename) {
        $f = fopen($filename, "r");
        $firstline = true;
        if ($firstFile) {
            $result .= '<section id="csv"><div class="container" style="width:80%;text-align:center"><h2 style="color:green">CSV Files</h2></div>';
        }
        $result .= '<div class="container" style="width:80%"><legend>'.basename($filename, '.csv').'</legend><table class="table table-striped table-bordered">';
        while (($line = fgetcsv($f)) != false) {
            if ($firstline) {
                $result .= "<thead><tr>";
            } else {
                $result .= "<tr>";
            }
            foreach ($line as $cell) {
                if ($firstline) {
                    $result .= "<th style=\"text-align:center\">" . htmlspecialchars($cell) . "</th>";
                } else {
                    $result .= "<td style=\"text-align:center\">" . htmlspecialchars($cell) . "</td>";
                }
            }
            if ($firstline) {
                $result .= "</thead></tr><tbody><tr>";
                $firstline = false;
            } else {
                $result .= "</tr>\n";
            }     
        }
        $result .= '</tbody></table></div>';
        fclose($f);
        $firstFile = false;
    }
    if (!$firstFile) {
        $result .= '</section>';
    }
    return $result;
}

function printSnippets () {
    $snippets = glob("Content/" . $_SESSION['company'] . "/*.html");
    $result = '';
    $firstFile = true;
    foreach ($snippets as $filename) {
        if ($firstFile) {
            $result .= '<section id="snippets"><div class="container" style="width:80%;text-align:center"><h2 style="color:green">HTML Snippets</h2></div>';
        }
        $result .= '<div class="container" style="width:80%"><legend>'.basename($filename, '.html').'</legend>';
        $result .= '<iframe class="container well well-small" style="width:100%" src="'.$filename.'"></iframe></div>';
        $firstFile = false;
    }
    if (!$firstFile) {
        $result .= '</section>';
    }
    return $result;
}

function printImages () {
    $snippets = glob("Content/" . $_SESSION['company'] .'/*');
    $result = '';
    $firstFile = true;
    foreach ($snippets as $filename) {
        if (getimagesize($filename) != 0) {
            if ($firstFile) {
                $result .= '<section id="images"><div class="container" style="width:80%;text-align:center"><h2 style="color:green">Images</h2></div>';
            }
            $info = pathinfo($filename);
            $result .= '<div class="container" style="width:80%"><legend>'.basename($filename, '.'.$info['extension']).'</legend>';
            $result .= '<img style="width:100%" src="'.$filename.'"></img></div><br>';
            $firstFile = false;
        }
    }
    if (!$firstFile) {
        $result .= '</section>';
    }
    return $result;
}


function uploadForm () {
    return '<div class="container-fluid"><form class="form-horizontal" action="Include/upload.php" method="POST" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend style="width:45%;color:green">Upload Form</legend>

<!-- Textarea -->
<div class="form-group">
  <label class="control-label" for="htmlsnippet">Html Snippet:</label>
  <div class="controls">                     
    <textarea rows="5" style="width:40%" id="htmlsnippet" name="htmlsnippet"></textarea>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="control-label" for="image">Image:</label>
  <div class="controls">
    <input id="image" name="image" style="width:40%" class="input-file form-control" type="file">
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="control-label" for="csv">CSV file:</label>
  <div class="controls">
    <input id="csv" name="csv" style="width:40%" class="input-file form-control" type="file">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="control-label" for="company">Company:</label>
  <div class="controls">
    <input id="company" name="company" style="width:40%" type="text" placeholder="For what company?" class="input-xlarge form-control" required="">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="control-label" for="campaign">Campaign Name:</label>
  <div class="controls">
    <input id="campaign" name="campaign" style="width:40%" type="text" placeholder="For what campaign?" class="input-xlarge form-control" required="">    
  </div>
</div>
<div style="padding-left:5cm">
<input type="submit" class="btn btn-primary" value="Upload!"/></input>
</div>
</fieldset>
</form></div>';
}

?>