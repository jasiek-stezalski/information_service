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
            <spring:message code="userPanel.oldArticles"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <sec:authentication property="authorities" var="roles" scope="page"/>
        </div>
    </div>
</div>
</body>
</html>
