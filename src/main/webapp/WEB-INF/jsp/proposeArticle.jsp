<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title><spring:message code="title"/></title>
</head>
<body>

<form:form method="post" action="/proposeArticle" modelAttribute="articleForm">
    <h1><spring:message code="userPanel.proposeArticle"/></h1>

    <br/><br/><spring:message code="ArticleEdition.title"/>
    <form:input path="title" size="50"/>
    <form:errors path="title"><spring:message code="ArticleEdition.TitleError"/> </form:errors>

    <br/><br/><spring:message code="ArticleEdition.content"/>
    <br/><br/><form:textarea path="content" id="text" rows="20" cols="100"/>
    <form:errors path="content"><spring:message code="ArticleEdition.ContentError"/></form:errors>

    <input type="submit" value="<spring:message code="save"/>"/>

</form:form>

</body>
</html>
