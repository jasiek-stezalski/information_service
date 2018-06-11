package com.pack.information_service.service.impl;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.ArticleError;
import com.pack.information_service.domain.Picture;
import com.pack.information_service.repository.PictureRepository;
import com.pack.information_service.repository.UserRepository;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.web.multipart.MultipartFile;

public class PictureServiceImplTest {


    private PictureRepository mockPictureRepository;
    private Article mockArticle;
    private Article mockArticleWithoutPicture;
    private Picture mockPicture;
    private MultipartFile mockMultipartFile;
    private String description = "";

    private PictureServiceImpl PSI;


    @Before
    public void setup() {

        mockPictureRepository = Mockito.mock(PictureRepository.class);
        mockArticle = Mockito.mock(Article.class);
        mockArticleWithoutPicture = Mockito.mock(Article.class);
        mockPicture = Mockito.mock(Picture.class);
        mockMultipartFile = Mockito.mock(MultipartFile.class);

        PSI = new PictureServiceImpl(mockPictureRepository);

        when(mockPictureRepository.findByArticle(mockArticle)).thenReturn(mockPicture);
    }

    @Test
    public void findByArticle_PictureExists_PictureFound() {

        when(mockPictureRepository.findByArticle(mockArticle)).thenReturn(mockPicture);
        assertSame(mockPicture, PSI.findByArticle(mockArticle));
    }

    @Test
    public void findByArticle_PictureNotExists_PictureNotFound() {

        when(mockPictureRepository.findByArticle(mockArticleWithoutPicture)).thenReturn(null);
        assertNull(PSI.findByArticle(mockArticle));
    }


    @Test
    public void save_newPicture_pictureSaved(){

        when(mockPicture.getIdPicture()).thenReturn(1L);

        PSI.save(mockMultipartFile, description, mockArticle);
        verify(mockPictureRepository, times(1)).save(any(Picture.class));
        //verify(PSI, times(1)).saveFileOnDisc(any(MultipartFile.class), any(String.class));
    }

}