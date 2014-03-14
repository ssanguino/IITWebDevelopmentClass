
<%@ page import="LCM562.Location" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body style="background: url('/LCM562/images/color-splash.jpg') repeat-x top center;">
  <div class="container">
    <a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li style="float: right"><a href="/LCM562/logout">LOGOUT</a></li>
        <li style="float: right"><a href="/LCM562/report">REPORTS</a></li>
        <li style="float: right"><a href="/LCM562/company">COMPANIES</a></li>
      </ul>
    </div>
    <div id="list-location" class="content scaffold-list" role="main">
      <h1><g:message code="default.list.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

        <g:sortableColumn property="address" title="${message(code: 'location.address.label', default: 'Address')}" />

        <g:sortableColumn property="name" title="${message(code: 'location.name.label', default: 'Name')}" />

        <th><g:message code="location.primaryCompany.label" default="Primary Company" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${locationInstanceList}" status="i" var="locationInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "address")}</g:link></td>

          <td>${fieldValue(bean: locationInstance, field: "name")}</td>

          <td>${fieldValue(bean: locationInstance, field: "primaryCompany")}</td>

          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${locationInstanceTotal}" />
      </div>
    </div>
  </div>
</body>
</html>
