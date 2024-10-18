package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Setter
@Getter
public class UserDTO {
	private int user_id; //seq
	private String user_username; //가입, 로그인하는 아이디 
	private String user_name; 
	private String user_pwd; 
	private Integer user_age;
	private String user_gender;
	private String user_email1;
	private String user_email2;
	private Integer user_tel1;
	private Integer user_tel2;
	private Integer user_tel3;
	private String user_sport;
	private String user_art;
	private String user_food;
	private String user_music;
	private String user_hobby;
	private String user_travel;
	private String user_smoke;
	private String user_religion;
	private String user_mbti;
	private Date reg_date;
	private String profile_pic;
	private String user_movie;
	private int matchScore;
	
	public String toString() {
	    return "UserDTO{" +
	            "user_id=" + user_id +
	            ", user_name='" + user_name + '\'' +
	            ", user_age=" + user_age +
	            ", user_email='" + user_email1 + user_email2 + '\'' +
	            ", user_mbti='" + user_mbti + '\'' +
	            ", user_movie='" + user_movie + '\'' +
	            ", user_religion='" + user_religion + '\'' +
	            ", user_travel='" + user_travel + '\'' +
	            ", user_music='" + user_music + '\'' +
	            ", user_hobby='" + user_hobby + '\'' +
	            ", user_art='" + user_art + '\'' +
	            ", user_food='" + user_food + '\'' +
	            ", user_smoke='" + user_smoke + '\'' +
	            ", user_gender='" + user_gender + '\'' +
	            '}';
	}
}
