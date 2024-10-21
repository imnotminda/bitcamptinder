package user.dao;

import java.util.List;

import user.bean.CommentDTO;

public interface CommentDAO {
    int insertComment(CommentDTO commentDTO);
    List<CommentDTO> getCommentsByUserId(int userId);
    
	List<CommentDTO> getComment(int userId);
}
