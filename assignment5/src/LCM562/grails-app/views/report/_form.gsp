<%@ page import="LCM562.Report" %>





<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="report.name.label" default="Name:" />
		
	</label>
	<g:textField name="name" value="${reportInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'filename', 'error')} ">
	<label for="filename">
		<g:message code="report.filename.label" default="File:" />
	</label>
	<input type="file" name="report" value="" id="file" accept=".pdf" />
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'primaryLocation', 'error')} required">
	<label for="primaryLocation">
		<g:message code="report.primaryLocation.label" default="Location:" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="primaryLocation" name="primaryLocation.id" from="${LCM562.Location.list()}" optionKey="id" required="" value="${reportInstance?.primaryLocation?.id}" class="many-to-one"/>
</div>


