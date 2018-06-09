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
        <div class="dropdownContent bottomCurve noSelect">
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
        <a href="/contact"><spring:message code="contact"/></a>
    </div>
    <div style="float: right;">
        <div class="noDisplay">
            <form:form method="post" action="/articlePage/searchArticle">
        </div>
        <input id="search" name="search" type="text" placeholder=<spring:message code="MainPage.search"/>>
        <input class="noDisplay" type="submit" class="btn registerButton" value="<spring:message code="MainPage.buttonSearch"/>">
        <div class="noDisplay">
            </form:form>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <input class="registerButton customButton" type="button" onclick="window.location.href='/login'" value="<spring:message code="MainPage.signIn"/>">
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <input class="registerButton customButton" type="button" onclick="window.location.href='/registration'" value="<spring:message code="MainPage.register"/>">
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <input id="panelButton" type="button" class="customButton" onclick="window.location.href='/userPanel'" value="<spring:message code="MainPage.userPanel"/>">
            <input class="registerButton customButton" type="button" onclick="document.forms['logoutForm'].submit()" value="<spring:message code="MainPage.signOut"/>">
            <div class="noDisplay">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </c:if>
    </div>
</div>
</html>
