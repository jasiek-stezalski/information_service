<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><spring:message code="title"/></title>

</head>
<body>

<sec:authentication property="authorities" var="roles" scope="page"/>

<%--Journalist, Moderator and Editor In Chief panel--%>

<c:if test="${roles[0] == 'JOURNALIST' or roles[0] == 'MODERATOR' or roles[0] == 'EDITOR_IN_CHIEF'}">


    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/>

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <c:forEach items="${articlesInProgress}" var="article">
        ${article.title}
        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="to check">
            <input type="submit" value="<spring:message code="userPanel.articleToCheck"/> ">
        </form:form>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="checked">
            <input type="submit" value="<spring:message code="userPanel.articleChecked"/> ">
        </form:form>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>
        <br/><br/>
    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${oldArticles}" var="article">
        <br/>${article.title}
    </c:forEach>

</c:if>

</body>
</html>
