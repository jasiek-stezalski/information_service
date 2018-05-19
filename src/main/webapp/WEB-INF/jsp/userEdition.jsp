<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title><spring:message code="title"/></title>

</head>
<body>

<form:form method="post" action="/userPanel/updateUsername" modelAttribute="userForm">
    <h1><spring:message code="userEdition.editUsername"/></h1>

    <spring:message code="Registration.username"/>
    <form:input path="username"/>
    <form:errors path="username"/>
    <br/><br/>
    <input type="submit" value="<spring:message code="save"/>">
</form:form>

<form:form method="post" action="/userPanel/updatePassword" modelAttribute="userForm">
    <h1><spring:message code="userEdition.editPassword"/></h1>

    <spring:message code="userEdition.oldPassword"/>
    <form:password path="oldPassword"/>
    <form:errors path="oldPassword"/>
    <br/>
    <spring:message code="userEdition.newPassword"/>
    <form:password path="password"/>
    <form:errors path="password"/>
    <br/>
    <spring:message code="userEdition.confirmNewPassword"/>
    <form:password path="confirmPassword"/>
    <form:errors path="confirmPassword"/>
    <br/><input type="submit" value="<spring:message code="save"/>">

</form:form>

</body>
</html>
