<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><spring:message code="title"/></title>
</head>
<body>

<a href="/addArticle">Dodaj artykuł</a><br/>
<c:forEach items="${articlesInProgress}" var="article">
    ${article.title}
    <a href="/updateArticle/${article.idArticle}">Edytuj artykuł</a><br/><br/>
</c:forEach>
</body>
</html>
