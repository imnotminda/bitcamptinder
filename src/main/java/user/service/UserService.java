package user.service;

import user.bean.UserDTO;

public interface UserService {

	public String checkID(String id);

	public void write(UserDTO userDTO);

	//public Map<String, Object> list(String pg);
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String id);

	public void delete(UserDTO userDTO);
	
	public UserDTO checkDeleteInfo(String id);
}
