CREATE TABLE date_board (
    USER_ID int,                    -- 이 열이 게시판 ID로 사용됨 (프로필 소유자를 나타냄)
    COMMENT_SEQ int,                -- date_comment 테이블의 댓글 ID
    PRIMARY KEY (USER_ID, COMMENT_SEQ),
    FOREIGN KEY (USER_ID) REFERENCES date_user(USER_ID),      -- 프로필 소유자와 연결
    FOREIGN KEY (COMMENT_SEQ) REFERENCES date_comment(COMMENT_SEQ)  -- 댓글과 연결
);