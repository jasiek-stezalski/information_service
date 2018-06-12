<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="meta.jsp"%>
</head>
<body>
    <%@include file="top.jsp"%>

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
    <div style="padding-top:20px;">
        <div class="secondPriorityContainer noSelect">
            <img class="commercial" src="${pageContext.request.contextPath}/resources/images/r.png"/>
        </div>
    </div>
    <div class="allLesserPictureContainer">
        <c:forEach items="${articles.topNews}" var="article">
            <c:if test="${article.priority==2}">
                <div class="lesserPictureContainer noSelect">
                    <a href="<spring:url value="/articlePage/${article.idArticle}"/>">
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
</body>
    <script src="${pageContext.request.contextPath}/resources/js/slideShow.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/lesserPicture.js"></script>
</html>