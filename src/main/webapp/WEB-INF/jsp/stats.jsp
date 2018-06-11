<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
            <spring:message code="userPanel.Statistics"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <sec:authentication property="authorities" var="roles" scope="page"/>
        </div>
        <table>
            <thead>
            <tr>
                <th><spring:message code="userPanel.username"/></th>
                <th><spring:message code="userPanel.articlesInYear"/></th>
                <th><spring:message code="userPanel.averageMark"/></th>
                <th><spring:message code="userPanel.articlesInMonth"/></th>
                <th><spring:message code="userPanel.averageMark"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${statistics}" var="statistic">
                <tr>
                    <td>${statistic.user.username}</td>
                    <td>${statistic.yearCount}</td>
                    <td>${statistic.yearMark}</td>
                    <td>${statistic.monthCount}</td>
                    <td>${statistic.monthMark}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
