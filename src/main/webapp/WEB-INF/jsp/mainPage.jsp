<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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

    <a style="float:left;" href="/mainPage">
        <span class="glyphicon glyphicon-home home"></span>
    </a>
    <div class="divider">|</div>
    <div class="dropdown menuItem">
        <spring:message code="MainPage.categories"/>
        <div class="dropdownContent bottomCurve noSelect bg-primary">
            <c:forEach items="${articles.categories}" var="category">
                <a href="/articlePage/category/${category.key}"><spring:message code="${category.value}"/></a>
            </c:forEach>
        </div>
    </div>
    <div style="float: right">
        <form:form method="post" action="articlePage/searchArticle">
            <input id="search" name="search" type="text" placeholder=<spring:message code="MainPage.search"/>>
            <input type="submit" class="btn registerButton" value="<spring:message code="MainPage.buttonSearch"/>">
        </form:form>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="/login" class="btn registerButton">
                <spring:message code="MainPage.signIn"/>
            </a>
            <a href="" id="panelButton" class="btn">
                <spring:message code="MainPage.userPanel"/>
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
            <c:if test="${article.priority==1}">
                <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
                    <img class="mySlides" src="<c:url value="${(article.pictures[0]).path}"/>">
                    <div class="slidesTitle noSelect">${article.title}</div>
                </a>
                <div class="slideShowLeft noSelect" onclick="plusDivs(-1)">&#10094;</div>
                <div class="slideShowRight noSelect" onclick="plusDivs(+1)">&#10095;</div>
                <a style="text-decoration: none;" class="slidesAuthor"
                   href="<spring:url value="/articlePage/journalist/${article.user.idUser}"/>">
                        ${article.user.username}
                </a>
            </c:if>
        </c:forEach>
    </div>
    <%--<div style="padding-top:20px;">
        <c:if test="${articles[0].priority==2}">
            <div class="secondPriorityContainer noSelect">
                <img  class="secondPriorityPicture noSelect" src="<c:url value="${(article.pictures[0]).path}"/>">
                <div  class="secondPriorityTitle noSelect">${article.title}</div>
            </div>
        </c:if>
    </div>--%>
    <div class="allLesserPictureContainer">
        <c:forEach items="${articles.topNews}" var="article">
            <c:if test="${article.priority==2}">
                <div class="lesserPictureContainer noSelect">
                    <a style="text-decoration: none;" href="<spring:url value="/articlePage/${article.idArticle}"/>">
                        <img class="lesserPicture" src="<c:url value="${(article.pictures[0]).path}"/>">
                        <div class="lesserPictureTitle">${article.title}</div>
                    </a>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <div class="allJustTitleContainer">
        <c:forEach items="${articles.topNews}" var="article">
            <c:if test="${article.priority==3}">
                <div class="bar noSelect"><spring:message code="MainPage.bar"/></div>
                <div class="justTitleContainer noSelect">
                    <a style="text-decoration: none;" class="justTitle"
                       href="<spring:url value="/articlePage/${article.idArticle}"/>">${article.title}</a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<%--<div class="container">
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
</div>--%>

</body>
<script src="resources/js/slideShow.js"></script>
<script src="resources/js/lesserPicture.js"></script>
</html>