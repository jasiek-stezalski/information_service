<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
            <spring:message code="userPanel.Title"/>
        </div>
        <div class="userPanelButtons">
            <sec:authentication property="authorities" var="roles" scope="page"/>

            <input type="button" class="customButton" onclick="window.location.href='/userPanel/updateUser'" value="<spring:message code="userPanel.updateUser"/>">
            <%--<br/><a href="/userPanel/deleteUser"><spring:message code="userPanel.deleteUser"/> </a>--%>
            <input type="button" class="customButton userPanelDelete" onclick="window.location.href='/userPanel/deleteUser'" value="<spring:message code="userPanel.deleteUser"/>">

            <c:if test="${roles[0] == 'USER'}">
                <%--<br/><br/><a href="/articlePanel/proposeArticle"><spring:message code="userPanel.proposeArticle"/> </a>--%>
                </br><input type="button" class="customButton userPanelTopic" onclick="window.location.href='/articlePanel/proposeArticle'" value="<spring:message code="userPanel.proposeArticle"/>">
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
