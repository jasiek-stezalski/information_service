<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<br />
<c:forEach items="${articles}" var="article">
    <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
</c:forEach>
</body>
</html>
