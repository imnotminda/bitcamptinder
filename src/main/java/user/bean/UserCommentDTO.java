package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Setter
@Getter
public class UserCommentDTO {
	private int user_id;
	private int comment_seq;
	private String comment_content;
	private Date logtime;
}
