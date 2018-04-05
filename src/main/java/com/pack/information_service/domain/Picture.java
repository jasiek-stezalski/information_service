package com.pack.information_service.domain;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "picture")
public class Picture {

    @Id
    private long idPicture;
    private String path;
    private String description;

    public long getIdPicture() {
        return idPicture;
    }

    public void setIdPicture(long idPicture) {
        this.idPicture = idPicture;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
