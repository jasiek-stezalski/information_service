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
            <spring:message code="userPanel.articleError"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <c:forEach items="${articles}" var="article">
                <div class="userPanelArticles inline crop">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div><br><br>

                <c:forEach items="${article.articleErrors}" var="error">

                    <c:if test="${error.status == 'to check'}">
                        <div class="inline spaceTop">
                        <form:form method="get" action="/articlePanel/errorFixed/${error.idError}">
                            <input type="button" class="customButton space" onclick="$(this).closest('form').submit();" value="<spring:message code="userPanel.errorConfirmed"/> ">
                        </form:form>
                        </div>
                        <div class="inline">
                            <input type="button" class="customButton space" onclick="window.location.href='/articlePanel/updateArticle/${article.idArticle}'" value="<spring:message code="userPanel.updateArticle"/>">
                        </div>
                    </c:if>
                    <div class="space inline">
                        <c:if test="${error.status == 'checked'}">
                            <spring:message code="userPanel.errorFixed"/>
                        </c:if>
                    </div>

                    <spring:message code="userPanel.errorContent"/>
                    ${error.content}<br>
                </c:forEach>

            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
