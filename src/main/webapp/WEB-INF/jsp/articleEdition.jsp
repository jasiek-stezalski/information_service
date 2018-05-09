<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title><spring:message code="title"/></title>

    <script>
        function loadfile(input) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('text').value = e.target.result;
            }
            reader.readAsText(input.files[0]);
        }
    </script>

</head>
<body>

<form:form method="post" action="/addArticle" modelAttribute="articleForm" enctype="multipart/form-data">
    <h1><spring:message code="ArticleEdition.mainTitle"/></h1>
    <form:hidden path="idArticle"/>
    <form:hidden path="status"/>
    <form:hidden path="user"/>

    <br/><spring:message code="ArticleEdition.category"/>
    <form:select path="category" size="1">
        <c:forEach items="${categories}" var="category">
            <form:option value="${category.key}"><spring:message code="${category.value}"/></form:option>
        </c:forEach>
    </form:select>
    <br/><spring:message code="ArticleEdition.content"/>
    <input type="file" onchange="loadfile(this)">
    <form:textarea path="content" id="text" rows="4" cols="50"/>
    <br/><spring:message code="ArticleEdition.title"/>
    <form:input path="title"/>

    <spring:message code="ArticleEdition.description"/>
    <input type="text" name="description" value="${description}"/>
    <input type="file" name="file"/>

    <input type="submit" value="<spring:message code="save"/>"/>

</form:form>

</body>
</html>
