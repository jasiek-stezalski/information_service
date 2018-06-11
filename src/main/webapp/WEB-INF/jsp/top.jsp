<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
        <input id="search" name="search" type="search" placeholder=<spring:message code="MainPage.search"/>>
        <input class="noDisplay" type="submit" class="btn registerButton"
               value="<spring:message code="MainPage.buttonSearch"/>">
        <div class="noDisplay">
            </form:form>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <input class="registerButton customButton" type="button" onclick="window.location.href='/login'"
                   value="<spring:message code="MainPage.signIn"/>">
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <input class="registerButton customButton" type="button" onclick="window.location.href='/registration'"
                   value="<spring:message code="MainPage.register"/>">
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name != null}">

            <sec:authentication property="authorities" var="roles" scope="page"/>
            <c:choose>
                <c:when test="${roles[0] == 'USER'}">
                    <input class="registerButton customButton" type="button" onclick="window.location.href='/userPanel'"
                           value="<spring:message code="MainPage.userPanel"/>">
                </c:when>
                <c:otherwise>
                    <div class="divider" style="float:none; display:inline">|</div>
            <div class="dropdown menuItem" style="float:none;">
                <spring:message code="MainPage.userPanel"/>
                <div class="dropdownContent bottomCurve noSelect userPanelDropdown">

                    <a href="/userPanel"><spring:message code="Account"/></a>

                    <c:if test="${(roles[0] == 'JOURNALIST') || (roles[0] =='MODERATOR') || (roles[0] =='EDITOR_IN_CHIEF')}">
                        <a href="/articlePanel/yourArticles"><spring:message code="ActualArticles"/></a>
                        <a href="/articlePanel/proposedArticles"><spring:message code="ProposedArticles"/></a>
                        <c:if test="${roles[0] == 'JOURNALIST'}">
                            <a href="/articlePanel/yourArchive"><spring:message code="Archives"/></a>
                        </c:if>
                        <c:if test="${roles[0] == 'MODERATOR'}">
                            <a href="/articlePanel/articlesCategoryToCheck"><spring:message code="ArticlesToCheck"/></a>
                            <a href="/articlePanel/articlesCategoryToDisplay"><spring:message code="ArticlesToDisplay"/></a>
                            <a href="/articlePanel/displayedCategoryArticles"><spring:message code="DisplayedArticles"/></a>
                            <a href="/articlePanel/errorsInArticles"><spring:message code="ErrorsInArticles"/></a>
                            <a href="/articlePanel/moderatorArchive"><spring:message code="Archives"/></a>
                        </c:if>
                        <c:if test="${roles[0] == 'EDITOR_IN_CHIEF'}">
                            <a href="/articlePanel/allArticlesToCheck"><spring:message code="ArticlesToCheck"/></a>
                            <a href="/articlePanel/allArticlesToDisplay"><spring:message code="ArticlesToDisplay"/></a>
                            <a href="/articlePanel/displayedAllArticles"><spring:message code="DisplayedArticles"/></a>
                            <a href="/articlePanel/allArchive"><spring:message code="Archives"/></a>
                            <a href="/userPanel/stats"><spring:message code="Stats"/></a>
                        </c:if>
                    </c:if>
                    <c:if test="${roles[0] == 'ADMIN'}">
                        <a href="/userPanel/usersList"><spring:message code="UsersList"/></a>
                    </c:if>

                </div>
            </div>
                    <div class="divider" style="float:none; display:inline; margin-right:10px;">|</div>
                </c:otherwise>
            </c:choose>
            <input class="registerButton customButton" type="button" onclick="document.forms['logoutForm'].submit()"
                   value="<spring:message code="MainPage.signOut"/>">
            <div class="noDisplay">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </c:if>
    </div>
</div>
</html>
