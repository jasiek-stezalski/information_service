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
            <spring:message code="userPanel.actualArticles"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <sec:authentication property="authorities" var="roles" scope="page"/>

            <input type="button" class="customButton" onclick="window.location.href='/articlePanel/addArticle'" value="<spring:message code="userPanel.addArticle"/>"><br><br>

            <c:forEach items="${articles}" var="article">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/updateArticle/${article.idArticle}'" value="<spring:message code="userPanel.updateArticle"/>">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/deleteArticle/${article.idArticle}'" value="<spring:message code="userPanel.deleteArticle"/>">

                <div class="inline space">
                    <form:form method="post" action="/articlePanel/changeStatus">
                        <input type="hidden" name="idArticle" value="${article.idArticle}">
                        <select name="status" size="1">
                            <option value="to check"><spring:message code="userPanel.articleToCheck"/></option>
                            <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
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
