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

<%--Journalist panel--%>

<c:if test="${roles[0] == 'JOURNALIST'}">


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

<%--Moderator panel--%>

<c:if test="${roles[0] == 'MODERATOR'}">

    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/>

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <c:forEach items="${articlesInProgress}" var="article">
        ${article.title}
        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="checked">
            <input type="submit" value="<spring:message code="userPanel.articleChecked"/> ">
        </form:form>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>
        <br/><br/>
    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articlesToCheck}" var="article">
        <br/>${article.title}
        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="checked">
            <input type="submit" value="<spring:message code="userPanel.articleChecked"/> ">
        </form:form>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="in progress">
            <input type="submit" value="<spring:message code="userPanel.articleToImprove"/> ">
        </form:form>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>
    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articlesChecked}" var="article">
        <br/>${article.title}
        <form:form method="post" action="article/setPriority">
            <spring:message code="userPanel.setPriority"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>
        <c:if test="${article.priority != 0}">
            <form:form method="post" action="article/display">
                <input type="hidden" name="idArticle" value="${article.idArticle}">
                <input type="hidden" name="status" value="to display">
                <input type="submit" value="<spring:message code="userPanel.articleToDisplay"/> ">
            </form:form>
        </c:if>
    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${oldArticles}" var="article">
        <br/>${article.title}
    </c:forEach>

</c:if>

<%--Editor in Chief panel--%>

<c:if test="${roles[0] == 'EDITOR_IN_CHIEF'}">

    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/>

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <c:forEach items="${articlesInProgress}" var="article">
        ${article.title}
        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="checked">
            <input type="submit" value="<spring:message code="userPanel.articleChecked"/> ">
        </form:form>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>
        <br/><br/>
    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articlesToCheck}" var="article">
        <br/>${article.title}
        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="checked">
            <input type="submit" value="<spring:message code="userPanel.articleChecked"/> ">
        </form:form>
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="in progress">
            <input type="submit" value="<spring:message code="userPanel.articleToImprove"/> ">
        </form:form>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>
    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articlesChecked}" var="article">
        <br/>${article.title}
        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="status" value="to check">
            <input type="submit" value="<spring:message code="userPanel.articleToCorrect"/> ">
        </form:form>
        <form:form method="post" action="article/setPriority">
            <spring:message code="userPanel.setPriority"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

        <c:if test="${article.priority != 0}">
            <form:form method="post" action="article/display">
                <input type="hidden" name="idArticle" value="${article.idArticle}">
                <input type="hidden" name="status" value="to display">
                <input type="submit" value="<spring:message code="userPanel.articleToDisplay"/> ">
            </form:form>
        </c:if>
    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${oldArticles}" var="article">
        <br/>${article.title}
    </c:forEach>

</c:if>

</body>
</html>
