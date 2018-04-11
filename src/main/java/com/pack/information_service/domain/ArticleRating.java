package com.pack.information_service.domain;


import javax.persistence.*;

@Entity
@Table(name="article_rating")
public class ArticleRating {

    @Id
    private long idRating;
    private int value;

    @ManyToOne
    @JoinColumn(name = "id_article")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public ArticleRating() {
    }

    public ArticleRating(int value, Article article, User user) {
        this.value = value;
        this.article = article;
        this.user = user;
    }

    public long getIdRating() {
        return idRating;
    }

    public void setIdRating(long idRating) {
        this.idRating = idRating;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
