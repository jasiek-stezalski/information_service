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
    <%@include file="fastTravel.jsp"%>
    <div class="articleContainer">
        <div class="articleTitle">
            <spring:message code="userPanel.Statistics"/>
        </div>
        <div class="userPanelButtons moveLeft">
            <table>
                <thead>
                    <tr>
                        <th><div class="statsBottom"><spring:message code="userPanel.username"/></div></th>
                        <th><div class="moveLeft statsWidth statsCenter statsBottom"><spring:message code="userPanel.articlesInYear"/></div></th>
                        <th><div class="moveLeft statsWidth statsCenter statsBottom"><spring:message code="userPanel.averageMark"/></div></th>
                        <th><div class="moveLeft statsWidth statsCenter statsBottom"><spring:message code="userPanel.articlesInMonth"/></div></th>
                        <th><div class="moveLeft statsWidth statsCenter statsBottom"><spring:message code="userPanel.averageMark"/></div></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${statistics}" var="statistic">
                    <tr>
                        <td><div class="space">${statistic.user.username}</div></td>
                        <td><div class="statsCenter spaceTop">${statistic.yearCount}</div></td>
                        <td><div class="statsCenter">${statistic.yearMark}</div></td>
                        <td><div class="statsCenter">${statistic.monthCount}</div></td>
                        <td><div class="statsCenter">${statistic.monthMark}</div></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
