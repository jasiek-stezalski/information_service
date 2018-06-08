<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <%@include file="meta.jsp" %>
</head>
<body>
<header>
    <%@include file="top.jsp" %>
</header>
<div id="container">
    <div class="articleContainer">
        <div class="articleTitle">
            <spring:message code="contact"/>
        </div>
    </div>
</div>
</body>
</html>
