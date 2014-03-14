
<%@ page import="LCM562.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li style="float: right"><a href="/LCM562/logout">LOGOUT</a></li>
                                <sec:ifAnyGranted roles="ROLE_ADMIN">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li style="float: right"><a href="/LCM562/location">LOCATIONS</a></li>
                                <li style="float: right"><a href="/LCM562/company">COMPANIES</a></li>                            
                                </sec:ifAnyGranted>
                                
			</ul>
		</div>
                
		<div id="list-report" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <g:if test="${!reportInstanceList}"><small style="color:red">There are no reports to show</small></g:if>
                        </br>
                        <g:each in="${reportInstanceList}" var="item">
                          <h2><strong>${item.key}</strong></h2>
                        <table>
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
	</body>
</html>
