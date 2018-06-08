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
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

public class ArticleRatingServiceImplTest {

    private ArticleRatingRepository mockarticleRatingRepository;
    private UserRepository mockuserRepository;
    private ArticleRepository mockarticleRepository;
    private Article article;
    private User realUser;
    private ArticleRating articleRatings;
    private UserServiceImpl usi;

    private static final String USERNAME_OF_EXISTING_USER = "Kasius Tosades";
    private static final String ARTICLE_FIELD="MODERATOR";
    private static final String USERNAME_OF_NOT_EXISTING_USER = "Maphat Antabolis";
    private static final Long ID_OF_EXISTING_ARTICLE = 1L;
    private static final Long ID_OF_EXISTING_USER = 1L;
    private static final Long ID_OF_NOT_EXISTING_USER = 0L;


    @Before
    public void setup(){
        article=new Article();
        realUser=new User();


        mockuserRepository= Mockito.mock(UserRepository.class);
        //mockarticleRepository = Mockito.mock(ArticleRatingRepository.class);
        mockarticleRepository = Mockito.mock(ArticleRepository.class);

        when(mockuserRepository.findByIdUser(ID_OF_EXISTING_USER)).thenReturn(realUser);

       when(mockarticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(article);
        //when(mockarticleRatingRepository.findByArticleAndUser(article,realUser)).thenReturn(articleRatings);
        //when(mockUserRepository.findByIdUser(ID_OF_EXISTING_USER)).thenReturn(realUser);

    }

    @Test
    public void userMarkArticleRatingTest(){

        System.out.println(article.getContent());

    }

    @Test
    public void save_Mark_of_ArticleRating(){

    }



}