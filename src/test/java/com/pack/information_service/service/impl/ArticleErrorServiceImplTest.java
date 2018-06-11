package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleError;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleErrorRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.CommentRepository;
import com.pack.information_service.repository.UserRepository;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.times;

public class ArticleErrorServiceImplTest {

    private static final Long ID_OF_EXISTING_ERROR = 1234L;
    private static final Long ID_OF_EXISTING_ARTICLE = 4321L;

    private String errorStatus = "";
    private User errorUser = null;
    private Article errorArticle = null;

    private UserRepository mockUserRepository;
    private ArticleRepository mockArticleRepository;
    private ArticleErrorRepository mockArticleErrorRepository;

    private Authentication mockAuthentication;
    private SecurityContext mockSecurityContext;
    private User mockUser;
    private Article mockArticle;
    private ArticleError mockArticleError;

    private ArticleErrorServiceImpl AESI;

    @Before
    public void setup(){

        mockUserRepository = Mockito.mock(UserRepository.class);
        mockArticleRepository = Mockito.mock(ArticleRepository.class);
        mockArticleErrorRepository = Mockito.mock(ArticleErrorRepository.class);
        mockAuthentication = Mockito.mock(Authentication.class);
        mockSecurityContext = Mockito.mock(SecurityContext.class);
        mockUser = Mockito.mock(User.class);
        mockArticle = Mockito.mock(Article.class);
        mockArticleError = Mockito.mock(ArticleError.class);

        AESI = new ArticleErrorServiceImpl(mockArticleRepository, mockArticleErrorRepository, mockUserRepository);

        when(mockSecurityContext.getAuthentication()).thenReturn(mockAuthentication);
        SecurityContextHolder.setContext(mockSecurityContext);
        when(SecurityContextHolder.getContext().getAuthentication().getName()).thenReturn("test");
        when(mockUserRepository.findByUsername(any(String.class))).thenReturn(mockUser);
        when(mockArticleErrorRepository.findByIdError(ID_OF_EXISTING_ERROR)).thenReturn(mockArticleError);
        when(mockArticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(mockArticle);

    }


    @Test
    public void saveLong_newError_errorSaved(){

        doAnswer(invocation -> {
            String arg0 = invocation.getArgument(0);
            errorStatus = arg0;
            return null;
        }).when(mockArticleError).setStatus(any(String.class));

        AESI.save(ID_OF_EXISTING_ERROR);

        assertEquals("checked", errorStatus);
        verify(mockArticleErrorRepository, times(1)).save(any(ArticleError.class));
    }


    @Test
    public void saveArticleErrorLong_newError_errorSaved(){

        doAnswer(invocation -> {
            String arg0 = invocation.getArgument(0);
            errorStatus = arg0;
            return null;
        }).when(mockArticleError).setStatus(any(String.class));

        doAnswer(invocation -> {
            Article arg0 = invocation.getArgument(0);
            errorArticle = arg0;
            return null;
        }).when(mockArticleError).setArticle(any(Article.class));

        doAnswer(invocation -> {
            User arg0 = invocation.getArgument(0);
            errorUser = arg0;
            return null;
        }).when(mockArticleError).setUser(any(User.class));

        AESI.save(mockArticleError, ID_OF_EXISTING_ARTICLE);

        assertEquals("to check", errorStatus);
        assertEquals(mockArticle, errorArticle);
        assertEquals(mockUser, errorUser);
        verify(mockArticleErrorRepository, times(1)).save(any(ArticleError.class));
    }



}