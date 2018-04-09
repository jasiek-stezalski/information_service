<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="MainPage.title"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2><spring:message code="MainPage.welcome"/> ${pageContext.request.userPrincipal.name} |
            <a onclick="document.forms['logoutForm'].submit()"><spring:message code="MainPage.signOut"/> </a>
        </h2>

    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">

        <h2><spring:message code="MainPage.welcome"/> <a href="/login"><spring:message code="MainPage.signIn"/></a>
            <a href="/registration"><spring:message code="MainPage.register"/> </a></h2>

    </c:if>
    <h2><spring:message code="MainPage.article.topNews"/></h2>
    <div class="row">
        <c:forEach items="${articles.topNews}" var="article">
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
                        <c:forEach items="${article.pictures}" var="picture">
                            <c:if test="${picture.priority == 1}">
                                <img src="<c:url value="${picture.path}"/>" style="width: 100px;height: 100px;">
                            </c:if>
                        </c:forEach>
                        <div class="caption">
                            <p>${article.title}</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>

    <h3><spring:message code="MainPage.article.news"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.news}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3><spring:message code="MainPage.article.sport"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.sport}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3><spring:message code="MainPage.article.business"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.business}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3><spring:message code="MainPage.article.entertainment"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.entertainment}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3><spring:message code="MainPage.article.technologies"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.technologies}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h3><spring:message code="MainPage.article.motorization"/></h3>
    <table class="table">
        <tbody>
        <c:forEach items="${articles.motorization}" var="article">
            <tr>
                <td>
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>