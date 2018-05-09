package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.repository.PictureRepository;
import com.pack.information_service.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class PictureServiceImpl implements PictureService {

    private PictureRepository pictureRepository;

    @Autowired
    public PictureServiceImpl(PictureRepository pictureRepository) {
        this.pictureRepository = pictureRepository;
    }

    @Transactional
    @Override
    public void save(MultipartFile file, String description, Article article) {
        Picture picture = findByArticle(article);
        if (picture == null) {
            picture = new Picture(description, article);
            picture = pictureRepository.saveAndFlush(picture);
            picture.setPath("/resources/images/image" + picture.getIdPicture() + ".jpg");
        } else {
            picture.setDescription(description);
        }
        pictureRepository.save(picture);
        saveFileOnDisc(file, "image" + picture.getIdPicture() + ".jpg");


    }

    @Override
    public void saveFileOnDisc(MultipartFile file, String name) {
        try {
            String path = ResourceUtils.getFile("classpath:application.properties").getPath();
            File newFile = new File(path.substring(0, path.indexOf("target")) + "src\\main\\webapp\\resources\\images\\" + name);
            file.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Picture findByArticle(Article article) {
        return pictureRepository.findByArticle(article);
    }

}
