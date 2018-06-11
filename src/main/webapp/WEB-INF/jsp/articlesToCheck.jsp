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
            <spring:message code="userPanel.articlesToCheck"/>
        </div>
        <div class="userPanelButtons moveLeft">

            <c:forEach items="${articles}" var="article">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/updateArticle/${article.idArticle}'" value="<spring:message code="userPanel.updateArticle"/>">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/deleteArticle/${article.idArticle}'" value="<spring:message code="userPanel.deleteArticle"/>">

                <div class="inline space">
                    <form:form method="post" action="/articlePanel/changeStatus">
                        <input type="hidden" name="idArticle" value="${article.idArticle}">
                        <select name="status" size="1">
                            <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
                            <option value="in progress"><spring:message code="userPanel.articleToImprove"/></option>
                        </select>
                        <input type="button" class="customButton space" onclick="$(this).closest('form').submit();" value="<spring:message code="submit"/>">
                    </form:form>
                </div>
                <div class="userPanelArticles inline moreToLeft">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div><br>

            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
