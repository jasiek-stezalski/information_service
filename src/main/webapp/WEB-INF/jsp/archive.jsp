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
    <%@include file="fastTravel.jsp"%>
    <div class="articleContainer">
        <div class="articleTitle">
            <spring:message code="userPanel.oldArticles"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <c:forEach items="${articles}" var="article">
                <div class="userPanelArticles">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
