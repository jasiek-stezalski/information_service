<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="Login.title"/></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>

<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading"><spring:message code="Login.title"/></h2>

        <div class="form-group">
            <input name="username" type="text" class="form-control"
                   placeholder="<spring:message code="Login.username"/>"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control"
                   placeholder="<spring:message code="Login.password"/>"/>

            <c:if test="${param.error != null}">
                <div style="color: red"><spring:message code="Login.error"/></div>
            </c:if>
            <c:if test="${blocked == true}">
                <div style="color: red"><spring:message code="Login.blocked"/></div>
            </c:if>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message
                    code="Login.signIn"/></button>
            <h4 class="text-center"><a href="${contextPath}/registration"><spring:message
                    code="Login.createAccount"/> </a></h4>
        </div>

    </form>

</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>