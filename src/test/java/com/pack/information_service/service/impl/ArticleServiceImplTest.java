package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleRating;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRatingRepository;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;


public class ArticleServiceImplTest {

    private ArticleRatingRepository mockarticleRatingRepository;
    private UserRepository mockuserRepository;
    private ArticleRepository mockarticleRepository;
    private Article article;
    private User realUser;
    private User mockUser;
    private User olduser;
    private User checked_User;
    private ArticleRating articleRatings;
    private ArticleRepository mockArticleRepository;
    private Article mockArticle;
    private ArticleServiceImpl usi;
    private List<Article> list_of_article_id;
    private List<Article> list_of_article_category;
    private List<Article> list_of_article_title;
    private List<String> commentsAuthors;
    private List<Comment> comments_in_article;
    private Comment coment;

    private static final String USERNAME_OF_EXISTING_USER = "Kasius Tosades";
    private static final String CATEGORY_OF_ARTICLE = "Sport";
    private static final String TITLE_OF_ARTICLE = "Incredible News";
    private static final String status="to display";

    private static final Long ID_OF_EXISTING_ARTICLE = 1L;
    private static final Long ID_OF_EXISTING_USER = 1L;


    void add_comments(){
        coment=new Comment();
      comments_in_article.add(coment);
    }

    @Before
    public void setup(){

        article=new Article();
        realUser=new User();
        mockUser=new User();
        olduser=new User();
        checked_User=new User();
        list_of_article_id=new ArrayList<>();
        list_of_article_category=new ArrayList<>();
        list_of_article_title=new ArrayList<>();
        commentsAuthors=new ArrayList<>();
        comments_in_article=new ArrayList<>();
        coment=new Comment();


        mockuserRepository= Mockito.mock(UserRepository.class);
        mockarticleRepository = Mockito.mock(ArticleRepository.class);
        mockArticleRepository=Mockito.mock(ArticleRepository.class);
        mockArticle=Mockito.mock(Article.class);

        usi=new ArticleServiceImpl(mockArticleRepository,mockuserRepository);


        when(mockuserRepository.findByIdUser(ID_OF_EXISTING_USER)).thenReturn(realUser);
        when(mockArticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(article);
        when(mockArticleRepository.findByUserAndPublicationDateIsNotNull(realUser)).thenReturn(list_of_article_id);
        when(mockArticleRepository.findByCategoryAndPublicationDateIsNotNull(CATEGORY_OF_ARTICLE)).thenReturn(list_of_article_category);

        coment.setUser(realUser);
        comments_in_article.add(coment);
    article.setComments(comments_in_article);
    checked_User=realUser;


        usi=new ArticleServiceImpl(mockArticleRepository,mockuserRepository);

    }

    @Test
    public void findByID_ArticleService(){
       // article.getComments().sort((comment1, comment2) -> -comment1.getDate().compareTo(comment2.getDate()));

//
//  assertSame(article,usi.findById(ID_OF_EXISTING_ARTICLE));


    }

    @Test
    public void getList_of_Article(){
        for(int i=0;i<list_of_article_id.size();i++){
            assertSame(list_of_article_id.get(i),usi.findByIdUserAndPublicationDate(ID_OF_EXISTING_USER));
        }
    }

    @Test
    public void getArticleFindByCategoryAndPublicationDate(){
        for(int i=0;i<list_of_article_category.size();i++) {
            assertSame(list_of_article_category.get(0),usi.findByCategoryAndPublicationDate(CATEGORY_OF_ARTICLE));
        }
    }

    @Test
    public void getArticlefindByTitleAndPublicationDate(){
    String pattern=null;
        if(TITLE_OF_ARTICLE.length()>3)
        {
            pattern=TITLE_OF_ARTICLE.toLowerCase()+".*";
        }
        when(mockArticleRepository.findByTitleAndPublicationDateIsNotNull(pattern)).thenReturn(list_of_article_title);

        for(int i=0;i<list_of_article_title.size();i++) {
            assertSame(list_of_article_category.get(0),usi.findByCategoryAndPublicationDate(TITLE_OF_ARTICLE));
        }

        assertSame(0,list_of_article_category.size());
    }

    @Test
    public void checkCommentsAuthors(){
        List<String> commentsAuthors = new ArrayList<>();

        for (Comment comment : article.getComments()) {
            when(mockuserRepository.findByIdUser(comment.getUser().getIdUser())).thenReturn(mockUser);
            commentsAuthors.add(realUser.getUsername());
        }

        //assertSame(commentsAuthors,usi.findCommentsAuthors(ID_OF_EXISTING_USER));

    }

    @Test
    public void savecheckArticleStatus(){
        if (status.equals("to display")) article.setPublicationDate(new Date());
        article.setStatus(status);
        usi.save(article);
        usi.findById(ID_OF_EXISTING_ARTICLE);
        // else
    }

    @Test
    public void proposeArticleStatus(){
        Article added_article=new Article();
        article.setStatus("proposed");
        when(mockuserRepository.findByUsername(USERNAME_OF_EXISTING_USER)).thenReturn(olduser);
        article.setUser(olduser);

        mockarticleRepository.save(article);

        when(mockarticleRepository.findByIdArticle(ID_OF_EXISTING_ARTICLE)).thenReturn(added_article);

        assertSame(checked_User,realUser);

    }

    @Test
    public void takeArticleStatus(){
        User load_user_from_repository=new User();
        when(mockuserRepository.findByUsername(USERNAME_OF_EXISTING_USER )).thenReturn(load_user_from_repository);
        article.setUser(load_user_from_repository);
        article.setIdArticle(3L);
        article.setStatus("in progress");
        mockarticleRepository.save(article);
    }

    @Test
    public void deleteArticel(){

    }

    @Test
    public void checkArticeCategory(){

    }

    @Test
    public void getStatisticsFromArticlesTest(){

    }

}
