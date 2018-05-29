<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="meta.jsp"%>
</head>
<body>
<header>
    <%@include file="top.jsp"%>
</header>
<div id="container">
    <div class="searchContainer">
        <div class="searchFor">
            <c:choose>
                <c:when test="${phrase.length() < 3}">
                    <spring:message code="SearchPage.toShortPhrase"/>
                </c:when>
                <c:otherwise>
                    <spring:message code="SearchPage.searchFor"/> "${phrase}"
                </c:otherwise>
            </c:choose>
        </div>
            <c:forEach items="${articles}" var="article">
                <div class="lesserPictureContainer noSelect">
                    <a href="/articlePage/${article.idArticle}">
                        <img class="lesserPicture" src="<c:url value="${(article.pictures[0]).path}"/>">
                        <div class="lesserPictureTitle">${article.title}</div>
                    </a>
                </div>
            </c:forEach>
    </div>
</div>
</body>
    <script src="${pageContext.request.contextPath}/resources/js/lesserPicture.js"></script>
</html>
