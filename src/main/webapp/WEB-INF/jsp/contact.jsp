<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
            <spring:message code="contact"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <spring:message code="contactName"/><br>
            <spring:message code="contactAdress"/><br>
            <spring:message code="contactAdress1"/><br>
            <spring:message code="contactTel"/><br>
            <spring:message code="contactFax"/>
        </div>
    </div>
</div>
</body>
</html>
