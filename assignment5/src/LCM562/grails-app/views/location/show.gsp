
<%@ page import="LCM562.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li style="float: right"><a href="/LCM562/logout">LOGOUT</a></li>
                                <li style="float: right"><a href="/LCM562/report">REPORTS</a></li>
                                <li style="float: right"><a href="/LCM562/company">COMPANIES</a></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="location.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${locationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="location.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${locationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.primaryCompany}">
				<li class="fieldcontain">
					<span id="primaryCompany-label" class="property-label"><g:message code="location.primaryCompany.label" default="Primary Company" /></span>
					
						<span class="property-value" aria-labelledby="primaryCompany-label"><g:link controller="company" action="show" id="${locationInstance?.primaryCompany?.id}">${locationInstance?.primaryCompany?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
