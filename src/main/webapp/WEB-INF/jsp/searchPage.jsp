<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="meta.jsp"%>
</head>
<body>
<div>
    <%@include file="top.jsp"%>
</div>
<div id="container">
    <div class="searchContainer">
        <div class="searchFor">
            <spring:message code="SearchPage.searchFor"/> ${phrase}
            <c:if test="${phrase.length() < 3}">
                <br/><spring:message code="SearchPage.toShortPhrase"/>
            </c:if>
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
