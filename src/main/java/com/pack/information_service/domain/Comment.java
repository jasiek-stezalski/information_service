package com.pack.information_service.domain;


import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "comment")
public class Comment {

    @Id
    private long idComment;
    @Lob
    private String content;
    private Date date;
    private int mark;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public long getIdComment() {
        return idComment;
    }

    public void setIdComment(long idComment) {
        this.idComment = idComment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
