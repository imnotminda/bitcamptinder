package user.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import user.bean.UserDTO;

public interface UserService {
//username수정
	
	public String checkID(String user_username);

	public void write(UserDTO userDTO);

	//public Map<String, Object> list(String pg);
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String user_username);

	public void delete(UserDTO userDTO);
	
	public UserDTO checkDeleteInfo(String user_username);
	
	//로그인 추가 
	
//public UserDTO login(String username, String pwd);
	
	public UserDTO login(Map<String, String> map);

	//프로필 업로드 서비스 추가 
	public void updateProfilePic(UserDTO userDTO, MultipartFile img);

}

