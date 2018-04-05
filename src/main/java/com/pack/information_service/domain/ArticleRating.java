package com.pack.information_service.domain;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="article_rating")
public class ArticleRating {

    @Id
    private long idRating;
    private int value;

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
}
