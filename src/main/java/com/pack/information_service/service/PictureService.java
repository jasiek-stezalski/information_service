package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Picture;
import org.springframework.web.multipart.MultipartFile;

public interface PictureService {

    Picture findByArticle(Article article);

    void save(MultipartFile file, String description, Article article);

    void saveFileOnDisc(MultipartFile file, String name);

}
