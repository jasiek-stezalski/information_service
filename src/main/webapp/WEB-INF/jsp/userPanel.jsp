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
            <input type="button" class="customButton userPanelDelete" onclick="window.location.href='/userPanel/deleteUser'" value="<spring:message code="userPanel.deleteUser"/>">

            <c:if test="${roles[0] == 'USER'}">
                </br><input type="button" class="customButton userPanelTopic" onclick="window.location.href='/articlePanel/proposeArticle'" value="<spring:message code="userPanel.proposeArticle"/>">
            </c:if>
        </div>
    </div>
</div>

<sec:authentication property="authorities" var="roles" scope="page"/>

<%--Journalist panel--%>

<c:if test="${roles[0] == 'JOURNALIST'}">

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/articlePanel/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/articlePanel/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="to check"><spring:message code="userPanel.articleToCheck"/></option>
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articleProposed"/></h1>

    <c:forEach items="${articles.proposed}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="get" action="/articlePanel/takeArticle/${article.idArticle}">
            <input type="submit" value="<spring:message code="userPanel.articleWrite"/> ">
        </form:form>

    </c:forEach>


    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

</c:if>

<%--Moderator panel--%>

<c:if test="${roles[0] == 'MODERATOR'}">

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/articlePanel/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/articlePanel/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articleProposed"/></h1>

    <c:forEach items="${articles.proposed}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="get" action="/articlePanel/takeArticle/${article.idArticle}">
            <input type="submit" value="<spring:message code="userPanel.articleWrite"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articles.toCheck}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/articlePanel/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
                <option value="in progress"><spring:message code="userPanel.articleToImprove"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articles.checked}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="/articlePanel/setPriority">
            <spring:message code="userPanel.setPriority"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

        <c:if test="${article.priority != 0}">
            <form:form method="post" action="/articlePanel/changeStatus">
                <input type="hidden" name="idArticle" value="${article.idArticle}">
                <select name="status" size="1">
                    <option value="to display"><spring:message code="userPanel.articleToDisplay"/></option>
                </select>
                <input type="submit" value="<spring:message code="submit"/> ">
            </form:form>
        </c:if>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToDisplay"/></h1>

    <c:forEach items="${articles.toDisplay}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="archive"><spring:message code="userPanel.articleArchive"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

        <form:form method="post" action="/articlePanel/setPriority">
            <spring:message code="userPanel.setPriority"/> ${article.priority}
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articleError"/></h1>

    <c:forEach items="${articles.withErrors}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <c:forEach items="${article.articleErrors}" var="error">
            <br/><spring:message code="userPanel.errorContent"/>
            ${error.content}

            <c:if test="${error.status == 'to check'}">
                <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
                    code="userPanel.updateArticle"/> </a><br/>

                <form:form method="get" action="/articlePanel/errorFixed/${error.idError}">
                    <input type="submit" value="<spring:message code="userPanel.errorConfirmed"/> ">
                </form:form>
            </c:if>

            <c:if test="${error.status == 'checked'}">
                <spring:message code="userPanel.errorFixed"/><br/>
            </c:if>

        </c:forEach>

    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

</c:if>

<%--Editor in Chief panel--%>

<c:if test="${roles[0] == 'EDITOR_IN_CHIEF'}">

    <h1><spring:message code="userPanel.actualArticles"/></h1>

    <a href="/articlePanel/addArticle"><spring:message code="userPanel.addArticle"/> </a><br/><br/>

    <c:forEach items="${articles.inProgress}" var="article">
        <a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/articlePanel/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articleProposed"/></h1>

    <c:forEach items="${articles.proposed}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="get" action="/articlePanel/takeArticle/${article.idArticle}">
            <input type="submit" value="<spring:message code="userPanel.articleWrite"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToCheck"/></h1>

    <c:forEach items="${articles.toCheck}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <br/><a href="/articlePanel/updateArticle/${article.idArticle}"><spring:message
            code="userPanel.updateArticle"/> </a>
        <br/><a href="/articlePanel/deleteArticle/${article.idArticle}"><spring:message
            code="userPanel.deleteArticle"/> </a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="checked"><spring:message code="userPanel.articleChecked"/></option>
                <option value="in progress"><spring:message code="userPanel.articleToImprove"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesChecked"/></h1>

    <c:forEach items="${articles.checked}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="to check"><spring:message code="userPanel.articleToCorrect"/></option>
                <c:if test="${article.priority != 0}">
                    <option value="to display"><spring:message code="userPanel.articleToDisplay"/></option>
                </c:if>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

        <form:form method="post" action="/articlePanel/setPriority">
            <spring:message code="userPanel.setPriority"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.articlesToDisplay"/></h1>

    <c:forEach items="${articles.toDisplay}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>

        <form:form method="post" action="/articlePanel/changeStatus">
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="status" size="1">
                <option value="archive"><spring:message code="userPanel.articleArchive"/></option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
        </form:form>

        <form:form method="post" action="/articlePanel/setPriority">
            <spring:message code="userPanel.setPriority"/> ${article.priority}
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="priority" size="1">
                <c:forEach var="i" begin="1" end="3">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="save"/> ">
        </form:form>

    </c:forEach>

    <h1><spring:message code="userPanel.oldArticles"/></h1>

    <c:forEach items="${articles.archive}" var="article">
        <br/><a href="/articlePage/${article.idArticle}">${article.title}</a>
    </c:forEach>

    <h1><spring:message code="userPanel.Statistics"/></h1>

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


</c:if>

<%--Admin panel--%>

<c:if test="${roles[0] == 'ADMIN'}">

    <h1><spring:message code="userPanel.users"/></h1>

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

</c:if>

</body>
</html>
