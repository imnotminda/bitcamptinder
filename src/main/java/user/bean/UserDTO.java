package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Setter
@Getter
public class UserDTO {
	private int id; //seq
	private String username; //가입, 로그인하는 아이디 
	private String name;
	private String pwd;
	private String age;
	private String gender;
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
//	private String address1;
//	private String address2;
//	private String zipcode;
	private String sport;
	private String art;
	private String food;
	private String music;
	private String hobby;
	private String travel;
	private String smoke;
	private String religion;
	private String mbti;
	private String movie;
	private Date reg_date;
	private String profile_pic;
	private int matchScore;
	
	
	
}
