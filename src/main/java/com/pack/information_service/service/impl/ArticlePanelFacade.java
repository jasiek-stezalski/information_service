package com.pack.information_service.service.impl;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.ArticleRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ArticlePanelFacade {

    private List<Article> inProgress;
    private List<Article> toCheck;
    private List<Article> checked;
    private List<Article> toDisplay;
    private List<Article> archive;

    private ArticleRepository articleRepository;
    private UserRepository userRepository;

    @Autowired
    public ArticlePanelFacade(ArticleRepository articleRepository, UserRepository userRepository) {
        this.articleRepository = articleRepository;
        this.userRepository = userRepository;
    }

    public void generateContent() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String role = String.valueOf(authentication.getAuthorities());
        String username = authentication.getName();
        User user = userRepository.findByUsername(username);
        inProgress = articleRepository.findByUserAndStatusLike(user, "in progress");
        if (role.equals("[JOURNALIST]")) {
            archive = articleRepository.findByUserAndStatusLikeOrderByPublicationDateDesc(user, "archive");
        }
        if (role.equals("[MODERATOR]")) {
            toCheck = articleRepository.findByStatusAndCategory("to check", user.getCategory());
            checked = articleRepository.findByStatusAndCategory("checked", user.getCategory());
            toDisplay = articleRepository.findByStatusAndCategoryOrderByPriorityAscPublicationDateDesc("to display", user.getCategory());
            archive = articleRepository.findByStatusAndCategoryOrUserOrderByPublicationDateDesc("archive", user.getCategory(), user.getIdUser());
        }
        if (role.equals("[EDITOR_IN_CHIEF]")) {
            toCheck = articleRepository.findByStatus("to check");
            checked = articleRepository.findByStatus("checked");
            toDisplay = articleRepository.findByStatusOrderByPriorityAscPublicationDateDesc("to display");
            archive = articleRepository.findByStatusOrderByPublicationDateDesc("archive");
        }
    }

    public List<Article> getInProgress() {
        return inProgress;
    }

    public void setInProgress(List<Article> inProgress) {
        this.inProgress = inProgress;
    }

    public List<Article> getToCheck() {
        return toCheck;
    }

    public void setToCheck(List<Article> toCheck) {
        this.toCheck = toCheck;
    }

    public List<Article> getChecked() {
        return checked;
    }

    public void setChecked(List<Article> checked) {
        this.checked = checked;
    }

    public List<Article> getToDisplay() {
        return toDisplay;
    }

    public void setToDisplay(List<Article> toDisplay) {
        this.toDisplay = toDisplay;
    }

    public List<Article> getArchive() {
        return archive;
    }

    public void setArchive(List<Article> archive) {
        this.archive = archive;
    }
}
