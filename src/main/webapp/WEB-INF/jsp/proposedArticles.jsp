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
            <spring:message code="userPanel.articleProposed"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <c:forEach items="${articles}" var="article">
                <div class="inline">
                    <form:form method="get" action="/articlePanel/takeArticle/${article.idArticle}">
                        <input type="button" class="customButton" onclick="$(this).closest('form').submit();" value="<spring:message code="userPanel.articleWrite"/>">
                    </form:form>
                </div>
                <div class="userPanelArticles space inline">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div><br>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>

