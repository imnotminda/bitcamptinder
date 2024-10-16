package user.service;

import user.bean.UserDTO;

public interface UserService {
//username수정
	
	public String checkID(String username);

	public void write(UserDTO userDTO);

	//public Map<String, Object> list(String pg);
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String username);

	public void delete(UserDTO userDTO);
	
	public UserDTO checkDeleteInfo(String username);
}
