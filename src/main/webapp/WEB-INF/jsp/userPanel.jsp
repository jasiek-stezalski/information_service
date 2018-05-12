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

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="to check"><spring:message code="userPanel.articleToCheck"/></option>
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

</c:if>

<%--Moderator panel--%>

<c:if test="${roles[0] == 'MODERATOR'}">

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articles.toCheck}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
                <option value="in progress"><spring:message code="userPanel.articleToImprove"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articles.checked}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

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
                <select name="status" size="1">
                    <option value="to display"><spring:message code="userPanel.articleToDisplay"/></option>
                </select>
                <input type="submit" value="<spring:message code="submit"/> ">
            </form:form>
        </c:if>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToDisplay"/></h1>

    <c:forEach items="${articles.toDisplay}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="archive"><spring:message code="userPanel.articleArchive"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

        <form:form method="post" action="article/setPriority">
            <spring:message code="userPanel.setPriority"/> ${article.priority}
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

</c:if>

<%--Editor in Chief panel--%>

<c:if test="${roles[0] == 'EDITOR_IN_CHIEF'}">

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articles.toCheck}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
                <option value="in progress"><spring:message code="userPanel.articleToImprove"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articles.checked}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="to check"><spring:message code="userPanel.articleToCorrect"/></option>
                <c:if test="${article.priority != 0}">
                    <option value="to display"><spring:message code="userPanel.articleToDisplay"/></option>
                </c:if>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
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

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToDisplay"/></h1>

    <c:forEach items="${articles.toDisplay}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="article/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="archive"><spring:message code="userPanel.articleArchive"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

        <form:form method="post" action="article/setPriority">
            <spring:message code="userPanel.setPriority"/> ${article.priority}
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

</c:if>

</body>
</html>
