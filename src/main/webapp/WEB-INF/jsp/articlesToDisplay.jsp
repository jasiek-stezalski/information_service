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
            <spring:message code="userPanel.articlesChecked"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <sec:authentication property="authorities" var="roles" scope="page"/>

            <c:forEach items="${articles.checked}" var="article">
                <div class="inline space">
                    <div class="inline">
                        <form:form method="post" action="/articlePanel/setPriority">
                            <spring:message code="userPanel.setPriority"/>
                            <input type="hidden" name="idArticle" value="${article.idArticle}">
                            <select name="priority" size="1">
                                <c:forEach var="i" begin="1" end="3">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                            <input type="button" class="customButton space" onclick="$(this).closest('form').submit();" value="<spring:message code="save"/>">
                        </form:form>
                    </div>
                    <div class="inline moveLeft">
                        <c:if test="${article.priority != 0}">
                            <form:form method="post" action="/articlePanel/changeStatus">
                                <input type="hidden" name="idArticle" value="${article.idArticle}">
                                <select name="status" size="1">
                                    <option value="to display"><spring:message code="userPanel.articleToDisplay"/></option>
                                </select>
                                <input type="button" class="customButton space" onclick="$(this).closest('form').submit();" value="<spring:message code="submit"/>">
                            </form:form>
                        </c:if>
                    </div>
                </div>
                <div class="userPanelArticles inline moreToLeft crop">
                    <a href="/articlePage/${article.idArticle}">${article.title}</a>
                </div><br>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
