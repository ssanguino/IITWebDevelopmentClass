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
        function picAttribution($picture) {
            switch ($picture) {
                case "sue1.jpg":
                    return "Fritz Geller-Grimm";
                    break;
                case "sue2.jpg" || "sue3.jpg":
                    return "Scott Robert Anselmo";
                    break;
            }
        }
        //extra credit source
        $suePictures = array("sue1.jpg", "sue2.jpg", "sue3.jpg");
        shuffle($suePictures);

        //write your code in here
        print "<div class=\"container-narrow\">

        <div class=\"masthead\">
          <ul class=\"nav nav-pills pull-right\">
            <li class=\"active\"><a href=\"index.php\">Home</a></li>
          </ul>
          <h3 class = \"muted\">Field Museum of Chicago</h3>
        </div>

        <hr>
        <div class = \"jumbotron\">
        <p class = \"lead\">\"Welcome to the Field Museum of Chicago, we offer many tours but request that you arrive 30 minutes early for each tour\"</p>
        </div>";
        
        $attribution = array(picAttribution($suePictures[0]), picAttribution($suePictures[1]), picAttribution($suePictures[2]));
        print "<table>";
        print "<tr>";
            print "<td rowspan=\"2\"><div class=\"wp-caption\"><img src='img/$suePictures[0]' height=\"500\" width=\"666\"><p class=\"wp-caption-text\">$attribution[0]</ep</div></td>";
            print "<td><div class=\"wp-caption\"><img src='img/$suePictures[1]' height=\"250\" width=\"334\"><p class=\"wp-caption-text\">$attribution[1]</ep</div></td>";
        print "</tr>";
        print "<tr>";
            print "<td><div class=\"wp-caption\"><img src='img/$suePictures[2]' height=\"250\" width=\"334\"><p class=\"wp-caption-text\">$attribution[2]</ep</div></td>";
        print "</tr>";
        print "</table >";

        print "<div class=\"row-fluid\">";
        print "<h1>Competition</h1>";
        print "<form action=\"result.php\" method=\"POST\" >";
        print '<label for="code">Enter your competition code with the following format: [Zipcode] [CompetitionCode] [5 Letter Code]</label>';
        print '<input name="code" id="code" type="text" value="">';
        print '<label for="name">Enter your full name</label>';
        print '<input name="name" id="name" type="text" value="">';
        print "<br>";
        print '<input id="agree" name="agree" type="checkbox" value="Yes" />   Agree with the terms and conditions of the competition.';
        print "<br><br>";
        print '<input type="submit" class="btn btn-success" value="Try your luck!"/></input>';
        print "</form>";
        print "</div>";

        print "<div class=\"row-fluid\">";
        print "<h1 style=\"text-align:center;\">Show Times</h1>";
        for ($hour = 9.25; $hour <= 17.25; $hour+=0.5) {
            if ($hour != 16.25) {
                print '<div class="span4" style="border-width:1px;border-style:Dotted;">';
                $minutes = "-";
                if (fmod($hour, 1.0) == .25)
                    $minutes = "15";
                else
                    $minutes = "45";

                if ($hour < 13) {
                    $myNiceHour = floor($hour);
                    print "<h4>Show at $myNiceHour:$minutes am</h4>";
                    print "Room 500";
                } else {
                    $myNiceHour = floor($hour - 12);
                    print "<h4>Show at $myNiceHour:$minutes pm</h4>";
                    print "Room 301";
                }

                print "</div>";
            }
        }

        print "</div>";
        ?>
</body>
</html>
