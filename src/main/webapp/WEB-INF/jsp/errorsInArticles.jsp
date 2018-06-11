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
            <spring:message code="userPanel.articleError"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <sec:authentication property="authorities" var="roles" scope="page"/>
            <c:forEach items="${articles}" var="article">
                <div class="userPanelArticles">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div>
            </c:forEach>
            <c:forEach items="${articles.withErrors}" var="article">
                <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

                <c:forEach items="${article.articleErrors}" var="error">
                    <br/><spring:message code="userPanel.errorContent"/>
                    ${error.content}

                    <c:if test="${error.status == 'to check'}">
                        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
                            code="userPanel.updateArticle"/> </a><br/>

                        <form:form method="get" action="/articlePanel/errorFixed/${error.idError}">
                            <input type="submit" value="<spring:message code="userPanel.errorConfirmed"/> ">
                        </form:form>
                    </c:if>

                    <c:if test="${error.status == 'checked'}">
                        <spring:message code="userPanel.errorFixed"/><br/>
                    </c:if>

                </c:forEach>

            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
