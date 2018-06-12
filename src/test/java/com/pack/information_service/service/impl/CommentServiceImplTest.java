package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.CommentRepository;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;



public class CommentServiceImplTest {

    private static final Long ID_OF_EXISTING_ARTICLE = 12345L;
    private static final Long ID_OF_EXISTING_COMMENT = 99999L;
    private static final String COMMENT_CONTENT = "lmao";

    private UserServiceImpl mockUserRepository;
    private ArticleRepository mockArticleRepository;
    private CommentRepository mockCommentRepository;
    private Authentication mockAuthentication;
    private SecurityContext mockSecurityContext;
    private User mockUser;
    private Article mockArticle;
    private Comment resultComment;

    private CommentServiceImpl CSI;

    @Before
    public void setup(){

        mockUserRepository = Mockito.mock(UserServiceImpl.class);
        mockArticleRepository = Mockito.mock(ArticleRepository.class);
        mockCommentRepository = Mockito.mock(CommentRepository.class);
        mockAuthentication = Mockito.mock(Authentication.class);
        mockSecurityContext = Mockito.mock(SecurityContext.class);
        mockUser = Mockito.mock(User.class);
        mockArticle = Mockito.mock(Article.class);
        resultComment = new Comment();
        resultComment.setContent(COMMENT_CONTENT);

        CSI = new CommentServiceImpl(mockCommentRepository, mockUserRepository, mockArticleRepository);

        when(mockSecurityContext.getAuthentication()).thenReturn(mockAuthentication);
        SecurityContextHolder.setContext(mockSecurityContext);
        when(SecurityContextHolder.getContext().getAuthentication().getName()).thenReturn("test");
        when(mockUserRepository.findByUsername(any(String.class))).thenReturn(mockUser);
        when(mockArticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(mockArticle);
        when(mockCommentRepository.save(any(Comment.class))).thenReturn(resultComment);
        when(mockCommentRepository.findByIdComment(ID_OF_EXISTING_COMMENT)).thenReturn(resultComment);
    }

    @Test
    public void save_NewComment_CommentSaved(){

        System.out.println("save_NewComment_CommentSaved test");

        CSI.save(COMMENT_CONTENT,ID_OF_EXISTING_ARTICLE);
        verify(mockCommentRepository, times(1)).save(any(Comment.class));
    }


    @Test
    public void delete_CommentExists_CommentDeleted(){

        System.out.println("delete_CommentExists_CommentDeleted test");

        CSI.delete(ID_OF_EXISTING_COMMENT);
        verify(mockCommentRepository, times(1)).delete(any(Comment.class));
    }


    @Test
    public void edit_CommentExists_CommentChanged(){

        System.out.println("edit_CommentExists_CommentChanged test");

        CSI.edit("NEW_CONTENT",ID_OF_EXISTING_COMMENT);
        assertEquals("NEW_CONTENT",resultComment.getContent());
    }

}