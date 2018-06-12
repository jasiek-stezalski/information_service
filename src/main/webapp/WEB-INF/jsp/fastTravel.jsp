<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<sec:authentication property="authorities" var="roles" scope="page"/>
<c:if test="${roles[0] != 'USER'}">
<div class="fastTravel">
    <div class="inline">
        <input type="button" class="customButton" onclick="window.location.href='/userPanel'" value="<spring:message code="Account"/>">
    </div>
    <c:if test="${(roles[0] == 'JOURNALIST') || (roles[0] =='MODERATOR') || (roles[0] =='EDITOR_IN_CHIEF')}">
        <div class="inline lessSpace">
            <input type="button" class="customButton" onclick="window.location.href='/articlePanel/yourArticles'" value="<spring:message code="ActualArticles"/>">
        </div>
        <div class="inline lessSpace">
            <input type="button" class="customButton" onclick="window.location.href='/articlePanel/proposedArticles'" value="<spring:message code="ProposedArticles"/>">
        </div>
        <c:if test="${roles[0] == 'JOURNALIST'}">
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/yourArchive'" value="<spring:message code="Archives"/>">
            </div>
        </c:if>
        <c:if test="${roles[0] == 'MODERATOR'}">
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/articlesCategoryToCheck'" value="<spring:message code="ArticlesToCheck"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/articlesCategoryToDisplay'" value="<spring:message code="ArticlesToDisplay"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/displayedCategoryArticles'" value="<spring:message code="DisplayedArticles"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/errorsInArticles'" value="<spring:message code="ErrorsInArticles"/>">
            </div>
            <div class="inline spaceTop">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/moderatorArchive'" value="<spring:message code="Archives"/>">
            </div>
        </c:if>
        <c:if test="${roles[0] == 'EDITOR_IN_CHIEF'}">
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/allArticlesToCheck'" value="<spring:message code="ArticlesToCheck"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/allArticlesToDisplay'" value="<spring:message code="ArticlesToDisplay"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/displayedAllArticles'" value="<spring:message code="DisplayedArticles"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/articlePanel/allArchive'" value="<spring:message code="Archives"/>">
            </div>
            <div class="inline lessSpace">
                <input type="button" class="customButton" onclick="window.location.href='/userPanel/stats'" value="<spring:message code="Stats"/>">
            </div>
        </c:if>
    </c:if>
    <c:if test="${roles[0] == 'ADMIN'}">
        <div class="inline lessSpace">
            <input type="button" class="customButton" onclick="window.location.href='/userPanel/usersList'" value="<spring:message code="UsersList"/>">
        </div>
    </c:if>
</div>
</c:if>
</html>
