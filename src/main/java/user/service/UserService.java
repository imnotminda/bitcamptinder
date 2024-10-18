package user.service;

import java.util.Map;

import user.bean.UserDTO;

public interface UserService {
//username수정
	
	public String checkId(String user_username);

	public void write(UserDTO userDTO);

	//public Map<String, Object> list(String pg);
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String user_username);

	public void delete(UserDTO userDTO);
	
	public UserDTO checkDeleteInfo(String user_username);
	
	//로그인 추가 
	
//public UserDTO login(String username, String pwd);
	
	public UserDTO login(Map<String, String> map);

}

