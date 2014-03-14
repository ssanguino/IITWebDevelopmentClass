<!DOCTYPE html>
<html lang="en">
    <head>
        <?php
        //write your code in here
        print "<meta charset=\"utf-8\">
    <title>Sue Exhibit</title>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta name=\"description\" content=\"Assignment1 - ITMD 562\">
    <meta name=\"author\" content=\"Sergio Sanguino Serrano\">

    <!-- Styles -->
    <link href=\"css/bootstrap.css\" rel=\"stylesheet\">
    <style type=\"text/css\">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 1040px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
	background: green;
	color: white;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
    </style>
    <link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src=\"js/html5shiv.js\"></script>
    <![endif]-->";
        ?>
    </head>
    <body>
        <?php
        print "<div class=\"container-narrow\">

        <div class=\"masthead\">
          <ul class=\"nav nav-pills pull-right\">
            <li class=\"active\"><a href=\"index.php\">Home</a></li>
          </ul>
          <h3 class = \"muted\">Field Museum of Chicago</h3>
        </div>

        <hr>

        <div class = \"jumbotron\">
        <p class = \"lead\">Competition results:</p>
        </div>";

        $hasAllInformation = true;
        if (isset($_POST["agree"]) && isset($_POST["code"])) {
            $numberParts = explode(" ", $_POST["code"]);

            if (count($numberParts) == 3) {
                if ((strlen($numberParts[0]) != 5) || (!ctype_digit($numberParts[0])) || 
                        (strlen($numberParts[1]) != 3) || (!ctype_digit($numberParts[1])) ||
                        (strlen($numberParts[2]) != 5) || (!ctype_alnum($numberParts[2]))) {
                    $hasAllInformation = false;
                }
            } else {
                $hasAllInformation = false;
            }
        } else {
            $hasAllInformation = false;
        }

        //lets now printout the results
        print "<div>";
        if ($hasAllInformation == true) {
            if ($numberParts[1] != '333') {
                print "<h3>We are sorry, but you have not won anything with the code: $numberParts[1]</h3>";
            } else {
                print '<h1>Congratulations! You have won a free framed picture with the Museum scientists!</h1>';
            }            
        } else {
            print '<h3 style="color:red">You must enter a valid competition code and agree to our "terms and conditions"</h3>';
            print "<em>Competition code example: 66666 000 NOKIA</em>";
        }
        print "</ br>";
        print "</ br>";
        print "<a href='index.php' class=\"btn btn-primary\"><i class=\"icon-white icon-chevron-left\"></i> Go Back</a>";
        print "</div>";
        ?>
    </body>
</html>
