package com.pack.information_service.domain;

import javax.persistence.*;

@Entity
@Table(name = "comment_rating")
public class CommentRating {

    @Id
    private long idRating;
    private int value;

    @ManyToOne
    @JoinColumn(name = "id_comment")
    private Comment comment;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public CommentRating() {
    }

    public CommentRating(int value, Comment comment, User user) {
        this.value = value;
        this.comment = comment;
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

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
