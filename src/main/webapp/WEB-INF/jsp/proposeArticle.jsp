<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <%@include file="meta.jsp"%>
</head>
<body>
<header>
    <%@include file="top.jsp"%>
</header>
<div id="container">
    <div class="articleContainer">
        <div class="articleTitle">
            <spring:message code="userPanel.proposeArticle"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <form:form method="post" action="/articlePanel/proposeArticle" modelAttribute="articleForm">

                <spring:message code="ArticleEdition.title"/>
                <br><form:input class="spaceTop" path="title" size="50"/>
                <div class="error spaceTop">
                    <form:errors path="title"><spring:message code="ArticleEdition.TitleError"/></form:errors>
                </div>

                <br><spring:message code="ArticleEdition.content"/>
                <br><form:textarea class="noResize spaceTop" path="content" id="text" rows="10" cols="120"/>
                <div class="error spaceTop">
                    <form:errors class="error" path="content"><spring:message code="ArticleEdition.ContentError"/></form:errors>
                </div>
                <input type="button" class="customButton spaceTop" onclick="$(this).closest('form').submit();" value="<spring:message code="save"/>">

            </form:form>
        </div>
    </div>
</div>
</body>
<%--
<form:form method="post" action="/articlePanel/proposeArticle" modelAttribute="articleForm">
    <h1><spring:message code="userPanel.proposeArticle"/></h1>

    <br/><br/><spring:message code="ArticleEdition.title"/>
    <form:input path="title" size="50"/>
    <form:errors path="title"><spring:message code="ArticleEdition.TitleError"/> </form:errors>

    <br/><br/><spring:message code="ArticleEdition.content"/>
    <br/><br/><form:textarea class="noResize" path="content" id="text" rows="10" cols="200"/>
    <form:errors path="content"><spring:message code="ArticleEdition.ContentError"/></form:errors>

    <input type="submit" value="<spring:message code="save"/>"/>

</form:form>
--%>

</html>
