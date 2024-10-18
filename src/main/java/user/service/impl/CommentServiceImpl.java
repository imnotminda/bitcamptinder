package user.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserCommentDTO;
import user.dao.CommentDAO;
import user.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public String commentInput(UserCommentDTO userCommentDTO) {
        // 댓글 추가
        boolean commentAdded = insertComment(userCommentDTO.getUser_id(), userCommentDTO.getComment_content());
        if (commentAdded) {
            // 가장 최근에 추가된 댓글의 ID를 가져옴
            int commentSeq = getLastInsertId();
            // date_profile_board에 추가
            insertIntoProfileBoard(userCommentDTO.getUser_id(), commentSeq);
            return "댓글이 성공적으로 작성되었습니다.";
        }
        return "댓글 작성 중 오류가 발생했습니다.";
    }

    private boolean insertComment(int userId, String commentContent) {
        return sqlSession.insert("CommentMapper.insertComment", 
                                 Map.of("userId", userId, "commentContent", commentContent)) > 0;
    }

    private boolean insertIntoProfileBoard(int userId, int commentSeq) {
        return sqlSession.insert("CommentMapper.insertIntoProfileBoard", 
                                 Map.of("userId", userId, "commentSeq", commentSeq)) > 0;
    }

    private int getLastInsertId() {
        return sqlSession.selectOne("CommentMapper.getLastInsertId");
    }
}