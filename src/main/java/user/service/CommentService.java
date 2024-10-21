package user.service;

import java.util.List;

import user.bean.CommentDTO;

public interface CommentService {
    String commentInput(CommentDTO userCommentDTO);

	List<CommentDTO> getComment(int userId);
}
