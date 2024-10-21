package user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.CommentDTO;
import user.dao.CommentDAO;
import user.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDAO commentDAO;

    @Override
    public String commentInput(CommentDTO commentDTO) {
        int result = commentDAO.insertComment(commentDTO);
        if (result > 0) {
            return "댓글이 성공적으로 등록되었습니다.";
        } else {
            return "댓글 등록에 실패했습니다.";
        }
    }

	@Override
	public List<CommentDTO> getComment(int userId) {
		return commentDAO.getComment(userId);
	}
}