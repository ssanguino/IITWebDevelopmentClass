
<%@ page import="LCM562.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li style="float: right"><a href="/LCM562/logout">LOGOUT</a></li>
                                <li style="float: right"><a href="/LCM562/location">LOCATIONS</a></li>
                                <li style="float: right"><a href="/LCM562/company">COMPANIES</a></li>
			</ul>
		</div>
		<div id="show-report" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list report">
			
				<g:if test="${reportInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="report.filename.label" default="Filename" /></span>
                                        <span class="property-value" aria-labelledby="filename-label">
                                          <g:set var="file" value = "reports/${reportInstance.primaryLocation.name}/${reportInstance.filename}" />
                                          <a href="${createLinkTo(file: file, absolute:true)}" target="_new">view</a>
                                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="report.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${reportInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.primaryLocation}">
				<li class="fieldcontain">
					<span id="primaryLocation-label" class="property-label"><g:message code="report.primaryLocation.label" default="Primary Location" /></span>
					
						<span class="property-value" aria-labelledby="primaryLocation-label"><g:link controller="location" action="show" id="${reportInstance?.primaryLocation?.id}">${reportInstance?.primaryLocation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportInstance?.publicationDate}">
				<li class="fieldcontain">
					<span id="publicationDate-label" class="property-label"><g:message code="report.publicationDate.label" default="Publication Date" /></span>
					
						<span class="property-value" aria-labelledby="publicationDate-label"><g:formatDate date="${reportInstance?.publicationDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reportInstance?.id}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
