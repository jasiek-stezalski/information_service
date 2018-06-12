package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRatingRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.RoleRepository;
import com.pack.information_service.repository.UserRepository;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.OptionalDouble;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

public class ArticleRatingServiceImplTest {

    private UserRepository mockuserRepository;
    private ArticleRepository mockarticleRepository;
    private ArticleRatingRepository mockArticleRatingRepository;
    private ArticleRating usiArticleRating;
    private Article article;
    private User realUser;
    private User mockUser;
    private ArticleRating articleRatings;
    private ArticleRatingServiceImpl usi;

    private static final String USERNAME_OF_EXISTING_USER = "Kasius Tosades";
    private static final Long ID_OF_EXISTING_ARTICLE = 1L;
    private static final Long ID_OF_EXISTING_USER = 1L;
    private static final Integer mark=5;
    private static final double articleMark=5.d;


    @Before
    public void setup(){
        article=new Article();
        realUser=new User();
        articleRatings=new ArticleRating();

        mockuserRepository= Mockito.mock(UserRepository.class);
        mockUser=Mockito.mock(User.class);
        mockArticleRatingRepository=Mockito.mock(ArticleRatingRepository.class);
        mockarticleRepository = Mockito.mock(ArticleRepository.class);

        usi = new ArticleRatingServiceImpl(mockArticleRatingRepository,mockuserRepository,mockarticleRepository);

        usiArticleRating=new ArticleRating(mark,article,realUser);

        when(mockuserRepository.findByIdUser(ID_OF_EXISTING_USER)).thenReturn(realUser);
        when(mockuserRepository.findByUsername(USERNAME_OF_EXISTING_USER)).thenReturn(mockUser);
        when(mockArticleRatingRepository.findByArticleAndUser(article,realUser)).thenReturn(articleRatings);


    }

    @Test
    public void userMarkArticleRatingTest(){

        int UserMark= Optional.ofNullable(articleRatings)
                .map(ArticleRating::getValue)
                .orElse(0);

        assertSame(UserMark,usi.userMark(article,realUser));

    }

    @Test
    public void save_Mark_of_ArticleRating(){
        when(mockuserRepository.findByUsername(USERNAME_OF_EXISTING_USER)).thenReturn(mockUser);
        when(mockarticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(article);

        ArticleRating articleRating = new ArticleRating(mark, article, mockUser);

        mockArticleRatingRepository.save(articleRating);


        article.setMark(Math.round(articleMark * 100) / 100.d);

        mockarticleRepository.save(article);

        assertNotNull(article.getMark());
        
    }
}
