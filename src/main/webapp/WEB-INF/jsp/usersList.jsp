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
            <spring:message code="userPanel.users"/>
        </div>
        <div class="userPanelButtons moveLeft">
        <table>
            <thead>
            <tr>
                <th><div class="usersWidth statsBottom"><spring:message code="userPanel.username"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.role"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.changeRole"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.blocked"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.deleteUser"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.category"/></div></th>
                <th><div class="space usersWidth statsCenter statsBottom"><spring:message code="userPanel.changeCategory"/></div></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                        <td><div class="space">${user.username}</div></td>
                        <td><div class="space statsCenter"><spring:message code="${allRoles.get(user.role.iterator().next().name)}"/></div></td>
                        <td><div class="space">
                            <form:form method="post" action="/userPanel/changeRole">
                                <input type="hidden" name="idUser" value="${user.idUser}">
                                <select name="role" size="1" style="width:130px;">
                                    <c:forEach items="${allRoles}" var="role">
                                        <c:if test="${user.role.iterator().next().name != role.key}">
                                            <option value="${role.key}"><spring:message code="${role.value}"/></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <input type="button" class="customButton spaceTop" onclick="$(this).closest('form').submit();" value="<spring:message code="submit"/>">
                            </form:form>
                        </div>
                        </td>
                        <c:if test="${user.blocked == 'false'}">
                            <td><div class="statsCenter"><input class="customButton" type="button" onclick="window.location.href='/userPanel/blocked/${user.idUser}'"
                                                                value="<spring:message code="userPanel.lock"/>"></div></td>

                        </c:if>
                        <c:if test="${user.blocked == 'true'}">
                            <td><div class="statsCenter"><input class="customButton" type="button" onclick="window.location.href='/userPanel/blocked/${user.idUser}'"
                                                                value="<spring:message code="userPanel.unlock"/>"></div>
                            </td>
                        </c:if>
                        <td><div class="statsCenter"><input class="customButton" type="button" onclick="window.location.href='/userPanel/deleteUser/${user.idUser}'"
                                                            value="<spring:message code="delete"/>"></div>
                        </td>
                        <c:if test="${user.category != null}">
                            <td><div class="statsCenter usersWidth" ><spring:message code="${categories.get(user.category)}"/></div></td>
                        </c:if>
                        <c:if test="${user.category == null}">
                            <td><div class="statsCenter">${user.category}</div></td>
                        </c:if>

                        <td><div class="space">
                            <c:if test="${user.category != null}">
                                <form:form method="post" action="/userPanel/changeCategory">
                                    <input type="hidden" name="idUser" value="${user.idUser}">
                                    <select name="category" size="1" style="width:130px;">
                                        <c:forEach items="${categories}" var="category">
                                            <c:if test="${user.category != category.key}">
                                                <option value="${category.key}"><spring:message
                                                        code="${category.value}"/></option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <input type="button" class="customButton spaceTop" onclick="$(this).closest('form').submit();" value="<spring:message code="submit"/>">
                                </form:form>
                            </c:if>
                        </div>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </div>
</div>
</body>
</html>
