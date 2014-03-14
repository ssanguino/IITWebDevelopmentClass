<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Reports</title>
  <g:javascript library="jquery" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'icon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'LCM-icon.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'LCM-retina.png')}">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">

  <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<img class="img-responsive" src="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}" style="display:block;margin:auto;" />
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="/LCM562">Home</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="/report/userReports">Reports</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">${name}<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">Account (not implemented)</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="/LCM562/logout">Logout</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="mailto:ssanguinhawk.iit.edu">Contact</a>
						</li>
					</ul>
				</div>
</nav>
<div class="page-header">
				<h1>
                                  Reports    <g:if test="${!reportInstanceList}"><small style="color:red">There are no reports to show</small></g:if>
                                  <g:else><small>Choose the location on the left</small></g:else>
				</h1>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
			<ul class="nav nav-stacked nav-pills">
                           <g:each in="${reportInstanceList}" var="item">
				<li>
					<a href="#${item.key}">${item.key}</a>
				</li>
                             </g:each>
			</ul>
		</div>
		<div class="col-md-10 column">
                        <g:each in="${reportInstanceList}" var="item">
                          <section id="${item.key}">
                          <h2><strong>${item.key}</strong></h2>          
                        <table class="table table-striped table-condensed">
				<thead>
					<tr>
					
                                                <g:sortableColumn property="name" title="${message(code: 'report.name.label', default: 'Name')}" />
                                          
						<g:sortableColumn property="filename" title="${message(code: 'report.filename.label', default: 'File')}" />
					
						<g:sortableColumn property="publicationDate" title="${message(code: 'report.publicationDate.label', default: 'Publication Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${item.value}" status="i" var="reportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                          
                                          <td><sec:ifAnyGranted roles="ROLE_ADMIN"><g:link action="show" id="${reportInstance.id}">${fieldValue(bean: reportInstance, field: "name")}</g:link></sec:ifAnyGranted> 
                                              <sec:ifAnyGranted roles="ROLE_USER">${fieldValue(bean: reportInstance, field: "name")}</sec:ifAnyGranted></td>
					
						<td><g:set var="file" value = "reports/${reportInstance.primaryLocation.name}/${reportInstance.filename}" />
                                                    <a href="${createLinkTo(file: file, absolute:true)}" target="_new">${reportInstance.filename}</a></td>
									
						<td><g:formatDate date="${reportInstance.publicationDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                                                    </br>
                        </g:each>
		</div>
	</div>
</div>
<br><br><br><footer class="footer" style="text-align:center">
<p>&copy; Sergio Sanguino Serrano 2013</p>
</footer>
<!-- Scripts -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/scripts.js"></script>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
</body>
</html>
