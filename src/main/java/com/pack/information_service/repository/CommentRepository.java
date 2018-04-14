package com.pack.information_service.repository;

import com.pack.information_service.domain.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    Comment findByIdComment(Long idComment);

}
