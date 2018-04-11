<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${article.title}</h1>
<c:forEach items="${article.pictures}" var="picture">
    <img src="<c:url value="${picture.path}"/>" style="width: 100px;height: 100px;">
</c:forEach>
<p>${article.content}</p>
<br/>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:if test="${userMark == 0}">
        <form:form method="post" action="/articlePage/mark">
            <spring:message code="Article.userMark"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="mark" size="1">
                <c:forEach var="i" begin="1" end="10">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
            </br>
        </form:form>
    </c:if>
    <c:if test="${userMark != 0}">
        <spring:message code="Article.userMark"/> ${userMark}
    </c:if>
</c:if>

<br/>
<spring:message code="Article.Rate"/> ${articleRate}
<br/><spring:message code="Article.Date"/> ${article.publicationDate}
<br/><spring:message code="Article.articleAuthor"/> ${journalist.username}
<br/><br/>
<spring:message code="Article.comments"/>
<br/><br/>
<c:forEach items="${article.comments}" var="comment" varStatus="status">
    ${comment.content}
    <br/><spring:message code="Article.comment.author"/> ${commentsAuthors[status.index]}
    <br/><spring:message code="Article.comment.date"/> ${comment.date}
    <br/><spring:message code="Article.comment.mark"/> ${comment.mark}
    <br/> <br/>
</c:forEach>
</body>
</html>
