package com.pack.information_service.service;

import com.pack.information_service.domain.Article;
import com.pack.information_service.domain.Comment;
import com.pack.information_service.domain.CommentRating;
import com.pack.information_service.domain.User;
import com.pack.information_service.repository.CommentRatingRepository;
import com.pack.information_service.repository.CommentRepository;
import com.pack.information_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentRatingServiceImpl implements CommentRatingService {

    private UserRepository userRepository;
    private CommentRatingRepository commentRatingRepository;
    private CommentRepository commentRepository;

    @Autowired
    public CommentRatingServiceImpl(UserRepository userRepository, CommentRatingRepository commentRatingRepository, CommentRepository commentRepository) {
        this.userRepository = userRepository;
        this.commentRatingRepository = commentRatingRepository;
        this.commentRepository = commentRepository;
    }

    @Override
    public void addCommentRate(String username, int mark, Long idComment, Long idArticle) {
        User user = userRepository.findByUsername(username);
        Comment comment = commentRepository.findByIdComment(idComment);
        CommentRating commentRating = new CommentRating(mark, comment, user);
        commentRatingRepository.save(commentRating);

        int commentMark = 0;
        for (CommentRating rate : comment.getCommentRatings()) {
            commentMark += rate.getValue();
        }
        comment.setMark(commentMark);
        commentRepository.save(comment);
    }

    @Override
    public List<Integer> userMark(Article article, Long idUser) {
        List<CommentRating> commentRatingList = commentRatingRepository.findAllByIdArticleAndIdUser(article.getIdArticle(), idUser);
        List<Comment> commentList = article.getComments();
        List<Integer> markList = new ArrayList<>();
        if (commentRatingList.isEmpty()) {
            for (Comment comment : commentList) {
                markList.add(0);
            }
        } else {
            for (int i = 0; i < commentList.size(); i++) {
                markList.add(0);
                for (int j = 0; j < commentRatingList.size(); j++) {
                    if (commentList.get(i).equals(commentRatingList.get(j).getComment())) {
                        markList.set(i, commentRatingList.get(j).getValue());
                        break;
                    }
                }
            }
        }
        return markList;
    }

    @Override
    public void deleteAllCommentRating(Comment comment) {
        commentRatingRepository.deleteByComment(comment);
    }

}
