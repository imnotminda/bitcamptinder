package user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserCommentDTO;
import user.dao.CommentDAO;
import user.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	@Override
	public void commentInput(UserCommentDTO userCommentDTO) {
		commentDAO.commentInput(userCommentDTO);
	}

}
