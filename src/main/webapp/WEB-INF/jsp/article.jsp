<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <%@include file="meta.jsp"%>
    <%--<script>
        function showEditArea(id1, id2) {
            document.getElementById(id1).style.display = 'none';
            document.getElementById(id2).style.display = 'block';
        }
    </script>--%>
</head>
<body>
<header>
    <%@include file="top.jsp"%>
</header>
<div id="container">
    <div class="articleContainer">
        <div class="articleTitle">
            ${article.title}
        </div>
        <div class="articlePicture">
            <c:forEach items="${article.pictures}" var="picture">
                <img src="<c:url value="${picture.path}"/>">
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
<%--
The article content with title and all pictures

<h1>${article.title}</h1>
<c:forEach items="${article.pictures}" var="picture">
    <img src="<c:url value="${picture.path}"/>">
</c:forEach>
<p>${article.content}</p>
<br/>

<c:if test="${pageContext.request.userPrincipal.name != null}">

    &lt;%&ndash;If user find error in article he can report this error here&ndash;%&gt;

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
    &lt;%&ndash;If logged in user didn't rate the article, he can do it&ndash;%&gt;

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


&lt;%&ndash;Information about the article&ndash;%&gt;

<br/>
<spring:message code="Article.Rate"/> ${article.mark}
<br/><spring:message code="Article.Date"/> ${article.publicationDate}

<br/><spring:message code="Article.articleAuthor"/>
<a href="<spring:url value="/articlePage/journalist/${article.user.idUser}"/>">
    ${article.user.username}
</a>

<br/><br/>

&lt;%&ndash;Comments&ndash;%&gt;

<spring:message code="Article.comments"/>

&lt;%&ndash;If user is logged in he can add the comment&ndash;%&gt;

<br/>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form:form method="post" action="/articlePage/addComment">
        <input type="hidden" name="idArticle" value="${article.idArticle}"/>
        <textarea name="commentContent" rows="4" cols="50"></textarea>
        <input type="submit" value="<spring:message code="submit"/>">
    </form:form>
</c:if>

&lt;%&ndash;List of all article comments&ndash;%&gt;

<br/>
<c:forEach items="${article.comments}" var="comment" varStatus="status">
    ${comment.content}
    <br/><spring:message code="Article.comment.author"/> ${commentsAuthors[status.index]}
    <br/><spring:message code="Article.comment.date"/> ${comment.date}
    <br/><spring:message code="Article.comment.mark"/> ${comment.mark}

    &lt;%&ndash;If user is the author of the comment or moderator he can edit and remove the comment&ndash;%&gt;

    <sec:authentication property="authorities" var="roles" scope="page"/>
    <c:if test="${commentsAuthors[status.index] == pageContext.request.userPrincipal.name or 'MODERATOR' == roles[0]}">
        <form:form method="post" action="/articlePage/deleteComment">
            <input type="hidden" name="idComment" value="${comment.idComment}"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}"/>
            <input type="submit" value="<spring:message code="Article.comment.delete"/>">
        </form:form>

        &lt;%&ndash;Function to show area to edit the article&ndash;%&gt;

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

    &lt;%&ndash;If user is logged in and he didn't rate this comment he can do it&ndash;%&gt;

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
--%>
