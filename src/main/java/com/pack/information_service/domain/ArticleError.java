package com.pack.information_service.domain;

import javax.persistence.*;

@Entity
@Table(name = "article_error")
public class ArticleError {

    @Id
    private long idError;

    @Lob
    private String content;
    private String status;

    @ManyToOne
    @JoinColumn(name = "id_article")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public long getIdError() {
        return idError;
    }

    public void setIdError(long idError) {
        this.idError = idError;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
