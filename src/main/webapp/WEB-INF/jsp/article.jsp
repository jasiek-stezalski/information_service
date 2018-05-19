<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><spring:message code="title"/></title>
    <script>
        function showEditArea(id1, id2) {
            document.getElementById(id1).style.display = 'none';
            document.getElementById(id2).style.display = 'block';
        }
    </script>
</head>
<body>

<%--The article content with title and all pictures--%>

<h1>${article.title}</h1>
<c:forEach items="${article.pictures}" var="picture">
    <img src="<c:url value="${picture.path}"/>" style="height: 130px; width: calc(130px * 1.78);">
</c:forEach>
<p>${article.content}</p>
<br/>

<c:if test="${pageContext.request.userPrincipal.name != null}">

    <%--If user find error in article he can report this error here--%>

    <input type="button" id="errorButton" onclick="showEditArea('errorButton','errorInfo')"
           value="<spring:message code="Article.error"/>" style="display:block;">

    <form:form method="post" id="errorInfo" modelAttribute="articleErrorForm" action="/articlePage/addError"
               style="display:none;">
        <br/><spring:message code="Article.errorContent"/><br/>

        <input type="hidden" name="idArticle" value="${article.idArticle}">
        <form:textarea path="content" rows="4" cols="50"/>

        <input type="submit" value="<spring:message code="submit"/>">
    </form:form>

    <br/>
    <%--If logged in user didn't rate the article, he can do it--%>

    <c:if test="${userArticleMark == 0}">
        <form:form method="post" action="/articlePage/addArticleMark">
            <spring:message code="Article.userMark"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <select name="mark" size="1">
                <c:forEach var="i" begin="1" end="10">
                    <option value="${i}">${i}</option>
                </c:forEach>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
            </br>
        </form:form>
    </c:if>
    <c:if test="${userArticleMark != 0}">
        <spring:message code="Article.userMark"/> ${userMark}
    </c:if>
</c:if>


<%--Information about the article--%>

<br/>
<spring:message code="Article.Rate"/> ${article.mark}
<br/><spring:message code="Article.Date"/> ${article.publicationDate}

<br/><spring:message code="Article.articleAuthor"/>
<a href="<spring:url value="/articlePage/journalist/${article.user.idUser}"/>">
    ${article.user.username}
</a>

<br/><br/>

<%--Comments--%>

<spring:message code="Article.comments"/>

<%--If user is logged in he can add the comment--%>

<br/>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form:form method="post" action="/articlePage/addComment">
        <input type="hidden" name="idArticle" value="${article.idArticle}"/>
        <textarea name="commentContent" rows="4" cols="50"></textarea>
        <input type="submit" value="<spring:message code="submit"/>">
    </form:form>
</c:if>

<%--List of all article comments--%>

<br/>
<c:forEach items="${article.comments}" var="comment" varStatus="status">
    ${comment.content}
    <br/><spring:message code="Article.comment.author"/> ${commentsAuthors[status.index]}
    <br/><spring:message code="Article.comment.date"/> ${comment.date}
    <br/><spring:message code="Article.comment.mark"/> ${comment.mark}

    <%--If user is the author of the comment or moderator he can edit and remove the comment--%>

    <sec:authentication property="authorities" var="roles" scope="page"/>
    <c:if test="${commentsAuthors[status.index] == pageContext.request.userPrincipal.name or 'MODERATOR' == roles[0]}">
        <form:form method="post" action="/articlePage/deleteComment">
            <input type="hidden" name="idComment" value="${comment.idComment}"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}"/>
            <input type="submit" value="<spring:message code="Article.comment.delete"/>">
        </form:form>

        <%--Function to show area to edit the article--%>

        <input type="button" id="${status.index}" onclick="showEditArea('${status.index}','${comment.idComment}')"
               value="<spring:message code="Article.comment.edit"/>" style="display:block;">

        <form:form method="post" id="${comment.idComment}" style="display:none;" action="/articlePage/editComment">
            <input type="hidden" name="idArticle" value="${article.idArticle}"/>
            <input type="hidden" name="idComment" value="${comment.idComment}"/>
            <textarea name="commentContent" rows="4" cols="50">${comment.content}</textarea>
            <input type="submit" value="<spring:message code="submit"/>">
        </form:form>
    </c:if>
    <br/><br/>

    <%--If user is logged in and he didn't rate this comment he can do it--%>

    <c:if test="${pageContext.request.userPrincipal.name != null and userCommentMarks[status.index] == 0}">
        <form:form method="post" action="/articlePage/commentMark">
            <spring:message code="Article.comment.mark"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}">
            <input type="hidden" name="idComment" value="${comment.idComment}">
            <select name="mark" size="1">
                <option value="-1">-</option>
                <option value="1">+</option>
            </select>
            <input type="submit" value="<spring:message code="submit"/> ">
            </br>
        </form:form>
    </c:if>

</c:forEach>


</body>
</html>
