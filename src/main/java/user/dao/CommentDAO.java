package user.dao;

import user.bean.UserCommentDTO;

public interface CommentDAO {
    boolean insertComment(int userId, String commentContent);
    boolean insertIntoProfileBoard(int userId, int commentSeq);
    int getLastInsertId(); // 마지막으로 추가된 댓글 ID 가져오는 메서드
}
