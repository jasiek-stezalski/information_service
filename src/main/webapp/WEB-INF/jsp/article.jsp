<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
Ocena artykułu: ${articleRate}
<br />Data publikacji: ${article.publicationDate}
<br />Autor: ${journalist.username}
<br /><br />
Komentarze:
<br /><br />
<c:forEach items="${article.comments}" var="comment" varStatus="status">
    ${comment.content}
    <br />Autor komentarza: ${commentsAuthors[status.index]}
    <br />Data dodania: ${comment.date}
    <br />Ocena komentarza: ${comment.mark}
    <br /> <br />
</c:forEach>
</body>
</html>
