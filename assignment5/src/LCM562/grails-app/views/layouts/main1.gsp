<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="LCM"/></title>
  <g:javascript library="jquery" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'icon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'LCM-icon.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'LCM-retina.png')}">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-overrides.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'theme.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'animate.css')}" type="text/css" media="screen, projection">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}" type="text/css" media="screen">
  <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <g:layoutHead/>
  <r:layoutResources />
</head>
<body class="pull_top">
  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">

    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle pull-right" data-toggle="collapse" data-target=".navbar-ex1-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="/LCM562" class="navbar-brand"><img width="262px" height="55px" src="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}" style="margin: -20px; margin-top: -25px; margin-left: 0px"></a>
      </div>

      <div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">
        <ul class="nav navbar-nav navbar-right">
          <li id="active_home"><a href="/LCM562">HOME</a></li>
          <sec:ifLoggedIn>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
              <li id="active_user"><a href="/LCM562/user">USERS</a></li>
              <li id="active_company"><a href="/LCM562/company">COMPANIES</a></li>
              <li id="active_location"><a href="/LCM562/location">LOCATIONS</a></li>
              <li id="active_report"><a href="/LCM562/report">REPORTS</a></li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_USER">
              <li id="active_report"><a href="/LCM562/report/userReports">REPORTS</a></li>
            </sec:ifAnyGranted>
            <li id="active_logout"><a href="/LCM562/logout">LOGOUT</a></li>
          </sec:ifLoggedIn>
          <sec:ifNotLoggedIn>
            <li id="active_login"><a href="/LCM562/login">LOGIN</a></li>
          </sec:ifNotLoggedIn>
          <li id="active_contact"><a href="mailto:ssanguin@hawk.iit.edu">CONTACT</a></li>
        </ul>
      </div>
    </div>
  </div>
<g:layoutBody/>
<br><br><br><footer class="footer" style="text-align:center">
  <p>&copy; Sergio Sanguino Serrano 2013</p>
</footer>
<!-- Scripts -->
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>

<script type="text/javascript" src="js/index-slider.js"></script>	
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
