<%@ page import="LCM562.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="location.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${locationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${locationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'primaryCompany', 'error')} required">
	<label for="primaryCompany">
		<g:message code="location.primaryCompany.label" default="Primary Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="primaryCompany" name="primaryCompany.id" from="${LCM562.Company.list()}" optionKey="id" required="" value="${locationInstance?.primaryCompany?.id}" class="many-to-one"/>
</div>

