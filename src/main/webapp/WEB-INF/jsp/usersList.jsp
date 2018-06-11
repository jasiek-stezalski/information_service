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
            <spring:message code="userPanel.users"/>
        </div>
        <table>
            <thead>
            <tr>
                <th><spring:message code="userPanel.username"/></th>
                <th><spring:message code="userPanel.blocked"/></th>
                <th><spring:message code="userPanel.role"/></th>
                <th><spring:message code="userPanel.category"/></th>
                <th><spring:message code="userPanel.deleteUser"/></th>
                <th><spring:message code="userPanel.changeRole"/></th>
                <th><spring:message code="userPanel.changeCategory"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                        <td>${user.username}</td>

                        <c:if test="${user.blocked == 'false'}">
                            <td><a href="/userPanel/blocked/${user.idUser}"><spring:message code="userPanel.lock"/></a></td>
                        </c:if>
                        <c:if test="${user.blocked == 'true'}">
                            <td><a href="/userPanel/blocked/${user.idUser}"><spring:message code="userPanel.unlock"/></a>
                            </td>
                        </c:if>

                        <td><spring:message code="${allRoles.get(user.role.iterator().next().name)}"/></td>

                        <c:if test="${user.category != null}">
                            <td><spring:message code="${categories.get(user.category)}"/></td>
                        </c:if>
                        <c:if test="${user.category == null}">
                            <td>${user.category}</td>
                        </c:if>

                        <td><a href="/userPanel/deleteUser/${user.idUser}"><spring:message code="delete"/></a></td>
                        <td>
                            <form:form method="post" action="/userPanel/changeRole">
                                <input type="hidden" name="idUser" value="${user.idUser}">
                                <select name="role" size="1">
                                    <c:forEach items="${allRoles}" var="role">
                                        <c:if test="${user.role.iterator().next().name != role.key}">
                                            <option value="${role.key}"><spring:message code="${role.value}"/></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <input type="submit" value="<spring:message code="submit"/> ">
                            </form:form>
                        </td>

                        <td>
                            <c:if test="${user.category != null}">
                                <form:form method="post" action="/userPanel/changeCategory">
                                    <input type="hidden" name="idUser" value="${user.idUser}">
                                    <select name="category" size="1">
                                        <c:forEach items="${categories}" var="category">
                                            <c:if test="${user.category != category.key}">
                                                <option value="${category.key}"><spring:message
                                                        code="${category.value}"/></option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <input type="submit" value="<spring:message code="submit"/> ">
                                </form:form>
                            </c:if>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
