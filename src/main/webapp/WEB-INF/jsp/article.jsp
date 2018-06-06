<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
            ${article.title}
        </div>
        <div class="articleData">
            <div class="inline">
                - <a class="articleAuthor" href="<spring:url value="/articlePage/journalist/${article.user.idUser}"/>">
                    ${article.user.username}
                </a>
            </div>
            <div class="articleDivider inline">|</div>
            <div class="inline">${article.publicationDate}</div>
        </div>
        <div class="articlePictureContainer emphasize-dark">
            <c:forEach items="${article.pictures}" var="picture">
                <img class="articlePicture emphasize-dark" src="<c:url value="${picture.path}"/>">
            </c:forEach>
        </div>
        <div class="optionsContainer">
            <div class="rateContainer">
                <spring:message code="Article.Rate"/> - ${article.mark}</br>
                <div class="stars">
                    <c:choose>
                        <c:when test="${article.mark == 0.0}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate0.png"/>
                        </c:when>
                        <c:when test="${article.mark > 0.0 && article.mark < 1.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate1.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 1.50 && article.mark < 2.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate2.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 2.50 && article.mark < 3.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate3.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 3.50 && article.mark < 4.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate4.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 4.50 && article.mark < 5.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate5.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 5.50 && article.mark < 6.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate6.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 6.50 && article.mark < 7.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate7.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 7.50 && article.mark < 8.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate8.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 8.50 && article.mark < 9.50}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate9.png"/>
                        </c:when>
                        <c:when test="${article.mark >= 9.25 && article.mark <=10.0}">
                            <img class="ratePicture" src="${pageContext.request.contextPath}/resources/images/rate10.png"/>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <c:if test="${pageContext.request.userPrincipal.name != null}">

                <c:if test="${userArticleMark == 0}">
                    <div class="noDisplay">
                        <form:form method="post" action="/articlePage/addArticleMark">
                    </div>
                        <spring:message code="Article.mark"/>
                        <input type="hidden" name="idArticle" value="${article.idArticle}">
                        <select name="mark" size="1">
                            <c:forEach var="i" begin="1" end="10">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select>
                        <input class="customButton" type="submit" value="<spring:message code="submit"/> ">
                    <div class="noDisplay">
                        </form:form>
                    </div>
                </c:if>
                <c:if test="${userArticleMark != 0}">
                    <spring:message code="Article.userMark"/> ${userArticleMark}
                </c:if>
                </br>
                <input type="button" class="customButton butmarg" id="commentButton" value="<spring:message code="Article.addComment"/>"/>
                </br>
                <input type="button" class="customButton" id="errorButton" onclick="showEditArea('errorButton','errorInfo','hideButton')"
                       value="<spring:message code="Article.error"/>">
                <input type="button" class="customButton" id="hideButton" onclick="hideEditArea('errorButton','errorInfo','hideButton')"
                       value="<spring:message code="Article.errorHide"/>" style="display:none">

                <form:form method="post" id="errorInfo" modelAttribute="articleErrorForm" action="/articlePage/addError"
                           style="display:none;">
                    <br/><spring:message code="Article.errorContent"/><br/>

                    <input type="hidden" name="idArticle" value="${article.idArticle}">
                    <form:textarea path="content" rows="7" cols="40"/>

                    <input type="submit" class="customButton butmarg" value="<spring:message code="submit"/>">
                </form:form>

                <br/>
            </c:if>
        </div>
        <p class="articleContent">${article.content}</p>
        <div class="commentsTitle">
            <spring:message code="Article.comments"/>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form:form method="post" action="/articlePage/addComment">
                <input type="hidden" name="idArticle" value="${article.idArticle}"/>
                <textarea name="commentContent" rows="4" cols="50"></textarea>
                <input type="submit" value="<spring:message code="submit"/>">
            </form:form>
        </c:if>
        <c:forEach items="${article.comments}" var="comment" varStatus="status">
        <div class="commentContainer">
            <div class="commentAuthor">
                    ${commentsAuthors[status.index]}
            </div>
            <div class="commentContext">
                    ${comment.content}
            </div>
            <div class="commentAdditional">
                <c:if test="${pageContext.request.userPrincipal.name != null and userCommentMarks[status.index] == 0}">
                    <form:form class="form-id inline" method="post" action="/articlePage/commentMark">
                        <input type="hidden" name="idArticle" value="${article.idArticle}">
                        <input type="hidden" name="idComment" value="${comment.idComment}">
                        <select class="noDisplay" name="mark" size="1">
                            <option value="1"></option>
                        </select>
                        <a href="#" onclick="$(this).closest('form').submit();" class="glyphicon glyphicon-plus commentRate"></a>
                    </form:form>
                </c:if>
                <div class="commentMark">
                    ${comment.mark}
                </div>
                <c:if test="${pageContext.request.userPrincipal.name != null and userCommentMarks[status.index] == 0}">
                    <form:form class="form-id inline" method="post" action="/articlePage/commentMark">
                        <input type="hidden" name="idArticle" value="${article.idArticle}">
                        <input type="hidden" name="idComment" value="${comment.idComment}">
                        <select class="noDisplay" name="mark" size="1">
                            <option value="-1"></option>
                        </select>
                        <a href="#" onclick="$(this).closest('form').submit();" class="glyphicon glyphicon-minus commentRate"></a>
                    </form:form>
                </c:if>
                <div class="commentDate inline">
                        ${comment.date}
                </div>
                <sec:authentication property="authorities" var="roles" scope="page"/>
                <c:if test="${commentsAuthors[status.index] == pageContext.request.userPrincipal.name or 'MODERATOR' == roles[0]}">
                <div class="inline">
                    <a href="#" class="commentDelete"id="${status.index}" onclick="showEditArea('${status.index}','${comment.idComment}')"><spring:message code="Article.comment.edit"/></a>
                </div>
                <div class="inline">
                    <form:form method="post" action="/articlePage/deleteComment">
                        <input type="hidden" name="idComment" value="${comment.idComment}"/>
                        <input type="hidden" name="idArticle" value="${article.idArticle}"/>
                        <a href="#" class="commentDelete" onclick="$(this).closest('form').submit();"><spring:message code="Article.comment.delete"/></a>
                    </form:form>
                </div>

                    <form:form class="noDisplay" method="post" id="${comment.idComment}" action="/articlePage/editComment">
                        <input type="hidden" name="idArticle" value="${article.idArticle}"/>
                        <input type="hidden" name="idComment" value="${comment.idComment}"/>
                        <textarea name="commentContent" class="noResize" rows="4" cols="50">${comment.content}</textarea>
                        </br><a href="#" style="margin-left:300px;margin-top:20px;" onclick="$(this).closest('form').submit();"><spring:message code="submit"/></a>
                    </form:form>
                </c:if>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/commentEdit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moveToComment.js"></script>
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

&lt;&lt;%&ndash;%&ndash;List of all article comments&ndash;%&gt;

<br/>
<c:forEach items="${article.comments}" var="comment" varStatus="status">
    ${comment.content}
    <br/><spring:message code="Article.comment.author"/> ${commentsAuthors[status.index]}
    <br/><spring:message code="Article.comment.date"/> ${comment.date}
    <br/><spring:message code="Article.comment.mark"/> ${comment.mark}

    &lt;&lt;%&ndash;%&ndash;If user is the author of the comment or moderator he can edit and remove the comment&ndash;%&gt;

    <sec:authentication property="authorities" var="roles" scope="page"/>
    <c:if test="${commentsAuthors[status.index] == pageContext.request.userPrincipal.name or 'MODERATOR' == roles[0]}">
        <form:form method="post" action="/articlePage/deleteComment">
            <input type="hidden" name="idComment" value="${comment.idComment}"/>
            <input type="hidden" name="idArticle" value="${article.idArticle}"/>
            <input type="submit" value="<spring:message code="Article.comment.delete"/>">
        </form:form>&ndash;%&gt;

        &lt;%&ndash;Function to show area to edit the article&ndash;%&gt;

        <input type="button" id="${status.index}" onclick="showEditArea('${status.index}','${comment.idComment}')"
               value="<spring:message code="Article.comment.edit"/>" style="display:block;">

        <form:form method="post" id="${comment.idComment}" style="display:none;" action="/articlePage/editComment">
            <input type="hidden" name="idArticle" value="${article.idArticle}"/>
            <input type="hidden" name="idComment" value="${comment.idComment}"/>
            <textarea name="commentContent" rows="4" cols="50">${comment.content}</textarea>
            <input type="submit" value="<spring:message code="submit"/>">
        </form:form>
    &lt;%&ndash;</c:if>&ndash;%&gt;
    <br/><br/>&ndash;%&gt;

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
