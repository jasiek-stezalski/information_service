package com.pack.information_service.domain;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "article")
public class Article {

    @Id
    private long idArticle;
    private String title;
    @Lob
    private String content;
    private String category;
    private int priority;
    private Date publicationDate;
    private String status;
    private double mark;

    @OneToMany(mappedBy = "article")
    private List<ArticleRating> articleRatings;

    @OneToMany
    @JoinColumn(name = "id_article")
    private List<Picture> pictures;

    @OneToMany
    @JoinColumn(name = "id_article")
    private List<Comment> comments;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public long getIdArticle() {
        return idArticle;
    }

    public void setIdArticle(long idArticle) {
        this.idArticle = idArticle;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public List<ArticleRating> getArticleRatings() {
        return articleRatings;
    }

    public void setArticleRatings(List<ArticleRating> articleRatings) {
        this.articleRatings = articleRatings;
    }

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
