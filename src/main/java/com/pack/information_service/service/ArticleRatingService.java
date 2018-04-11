package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;

public interface ArticleRatingService {

    int userMark(Article article, User user);

}
