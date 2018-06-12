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
            <spring:message code="ArticleEdition.mainTitle"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <form:form method="post" action="/articlePanel/addArticle" modelAttribute="articleForm" enctype="multipart/form-data">
                <form:hidden path="idArticle"/>
                <form:hidden path="status"/>
                <form:hidden path="user"/>

                <spring:message code="ArticleEdition.category"/>
                <form:select class="space" path="category" size="1">
                    <c:forEach items="${categories}" var="category">
                        <form:option value="${category.key}"><spring:message code="${category.value}"/></form:option>
                    </c:forEach>
                </form:select>

                <br/><spring:message code="ArticleEdition.title"/>
                <form:input class="space spaceTop" path="title" size="50"/>
                <div class="error space inline  " >
                    <form:errors path="title"><spring:message code="ArticleEdition.TitleError"/> </form:errors>
                </div>

                <br/><br><spring:message code="ArticleEdition.content"/>
                <div class="inline space">
                    <input  type="file" onchange="loadfile(this)" accept=".txt">
                </div>
                <div class="inline error space" id="fileError">
                </div>
                <div id="temp" style="display: none;">
                    <spring:message code="ArticleEdition.fileError"/>
                </div>
                <form:textarea class="noResize spaceTop" path="content" id="text" rows="10" cols="120"/>
                <div class="error spaceTop">
                    <form:errors path="content"><spring:message code="ArticleEdition.ContentError"/></form:errors>
                </div>

                <div class="inline">
                    <input id="cos" type="file" name="file" onchange="checkfile(this)"/>
                </div>
                <div class="inline error space" id="fileError2">
                </div>
                    <div id="temp2" style="display: none;">
                        <spring:message code="ArticleEdition.tooBig"/>
                    </div>

                <div class="inline moveLeft">
                    <spring:message code="ArticleEdition.description"/>
                    <input type="text" class="space" name="description" value="${description}"/>
                </div>

                <%--<img src="<c:url value=" ${path}"/>" style="height: 130px; width: calc(130px * 1.78);">--%>
                <br><input type="button" class="customButton spaceTop" onclick="$(this).closest('form').submit();" value="<spring:message code="save"/>">

            </form:form>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/loadFile.js"></script>
</html>
