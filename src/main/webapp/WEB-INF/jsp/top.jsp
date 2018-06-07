<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<div id="top">
    <div class="logo">
        <img class="logo" src="${pageContext.request.contextPath}/resources/images/logo.jpg">
    </div>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div id="singedIn">
                <spring:message code="MainPage.loggedAs"/></br>
                ${pageContext.request.userPrincipal.name}
        </div>
    </c:if>
</div>

<div id="menu">

    <a style="float:left;" href="/mainPage">
        <span class="glyphicon glyphicon-home home"></span>
    </a>
    <div class="divider">|</div>
    <div class="dropdown menuItem">
        <spring:message code="MainPage.categories"/>
        <div class="dropdownContent bottomCurve noSelect bg-primary">
            <a href="/articlePage/category/News"><spring:message code="News"/></a>
            <a href="/articlePage/category/Sport"><spring:message code="Sport"/></a>
            <a href="/articlePage/category/Business"><spring:message code="Business"/></a>
            <a href="/articlePage/category/Entertainment"><spring:message code="Entertainment"/></a>
            <a href="/articlePage/category/Technologies"><spring:message code="Technologies"/></a>
            <a href="/articlePage/category/Motorization"><spring:message code="Motorization"/></a>
        </div>
    </div>
    <div class="divider">|</div>
    <div class="dropdown menuItem">
        Kontakt
    </div>
    <div style="float: right;">
        <div class="noDisplay">
            <form:form method="post" action="/articlePage/searchArticle">
        </div>
        <input id="search" name="search" type="text" placeholder=<spring:message code="MainPage.search"/>>
        <input class="noDisplay" type="submit" class="btn registerButton"
               value="<spring:message code="MainPage.buttonSearch"/>">
        <div class="noDisplay">
            </form:form>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="/login" class="btn registerButton">
                <spring:message code="MainPage.signIn"/>
            </a>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="/registration" class="btn registerButton">
                <spring:message code="MainPage.register"/>
            </a>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <a href="/userPanel" id="panelButton" class="btn">
                <spring:message code="MainPage.userPanel"/>
            </a>
            <a onclick="document.forms['logoutForm'].submit()" class="btn registerButton">
                <spring:message code="MainPage.signOut"/>
            </a>
            <div class="noDisplay">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </c:if>
    </div>
</div>
</html>
