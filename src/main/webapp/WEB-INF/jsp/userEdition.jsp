<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <%@include file="meta.jsp"%>
</head>
<body>
<header>
    <%@include file="top.jsp"%>
</header>
<div id="container">
    <div class="articleContainer">
        <div class="articleTitle">
            <spring:message code="userEdition.editUsername"/>
        </div>
        <div class="userPanelButtons moveLeft">
        <form:form method="post" action="/userPanel/updateUsername" modelAttribute="userForm">
            <spring:message code="Registration.username"/>
            <form:input class="space" path="username"/>
            <input type="button" class="customButton space" onclick="$(this).closest('form').submit();" value="<spring:message code="save"/>">
            </br></br><form:errors class="error moreToLeft" path="username"/>
        </form:form>

        </div>
            <div class="articleTitle">
                <spring:message code="userEdition.editPassword"/>
            </div>
        <div class="userPanelButtons moveLeft">
            <form:form method="post" action="/userPanel/updatePassword" modelAttribute="userForm">
                <spring:message code="userEdition.oldPassword"/>
                <form:password class="space" path="oldPassword"/>
                <form:errors class="error moveLeft" path="oldPassword"/>
                <br/>
                <spring:message code="userEdition.newPassword"/>
                <form:password class="space spaceTop" path="password"/>
                <form:errors class="error moveLeft" path="password"/>
                <br/>
                <spring:message code="userEdition.confirmNewPassword"/>
                <form:password class="space spaceTop" path="confirmPassword"/>
                <form:errors class="error moveLeft" path="confirmPassword"/>
                <br/><input type="button" class="customButton spaceTop" onclick="$(this).closest('form').submit();" value="<spring:message code="save"/>">

            </form:form>
        </div>
    </div>
</div>
<%--<form:form method="post" action="/userPanel/updateUsername" modelAttribute="userForm">
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

</form:form>--%>
</body>
</html>

