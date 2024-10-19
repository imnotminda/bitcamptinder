package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class MessageDTO {
	private int message_id;
	private int sender_id;
	private String sender_name;
    private int receiver_id;
    private String message_text;
    private Date timestamp;
    private String status;
}
