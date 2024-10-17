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
	private String user_age;
	private String user_gender;
	private String user_email1;
	private String user_email2;
	private String user_tel1;
	private String user_tel2;
	private String user_tel3;
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
}
