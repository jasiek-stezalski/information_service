<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="MainPage.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="resources/images/newspaper.jpg">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/css/main.css">
    <script src="resources/js/menu.js"></script>

</head>
<body id="body">
<div id="top">
    <div class="logo">
        <img class="logo" src="resources/images/logo.jpg">
    </div>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div id="singedIn">
                <spring:message code="MainPage.loggedAs"/></br>
                ${pageContext.request.userPrincipal.name}
        </div>
    </c:if>
</div>
<div id="menu" class="bg-primary">

    <a href="/mainPage">
        <span id="home" class="glyphicon glyphicon-home"></span>
    </a>
    <div style="float: right">
        <input id="search" type="text" placeholder=<spring:message code="MainPage.search"/>>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="/login" class="btn registerButton">
                <spring:message code="MainPage.signIn"/>
            </a>
            <a href="/registration" class="btn registerButton">
                <spring:message code="MainPage.register"/>
            </a>
        </c:if>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <a href="" id="panelButton" class="btn">
                <spring:message code="MainPage.userPanel"/>
            </a>
            <a onclick="document.forms['logoutForm'].submit()" class="btn registerButton">
                <spring:message code="MainPage.signOut"/>
            </a>
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </c:if>
    </div>
</div>
<div id="container" class="">
    <div class="slideShowContainer">
        <c:forEach items="${articles.topNews}" var="article">
            <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
                <img class="mySlides" src="<c:url value="${(article.pictures[0]).path}"/>">
                <div class="slidesTitle noSelect">${article.title}</div>
            </a>
            <div class="slideShowLeft noSelect" onclick="plusDivs(-1)">&#10094;</div>
            <div class="slideShowRight noSelect" onclick="plusDivs(+1)">&#10095;</div>
            <a href="/login" class="slidesAuthor">${article.user.username}</a>
        </c:forEach>
    </div>
    <c:forEach items="${articles.topNews}" var="article">
        <div class="lesserPictureContainer">
            <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
                <img class="lesserPicture" src="<c:url value="${(article.pictures[0]).path}"/>">
                <div class="lesserPictureTitle">${article.title}</div>
            </a>
        </div>
    </c:forEach>
</div>

<div class="container">
    <h2><spring:message code="MainPage.article.topNews"/></h2>
    <div class="row">
        <c:forEach items="${articles.topNews}" var="article">
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
                        <img src="<c:url value="${(article.pictures[0]).path}"/>" style="width: 100px;height: 100px;">
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
<script src="resources/js/slideShow.js"></script>
</html>