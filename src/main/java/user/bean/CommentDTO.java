package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Setter
@Getter
public class CommentDTO {
	private int comment_id;
	private int user_id;
	private int commenter_id;
	private String content;
	private Date created_AT;
	private String commenter_name;
}
