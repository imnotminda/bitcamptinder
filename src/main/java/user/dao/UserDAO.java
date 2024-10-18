package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public UserDTO checkId(String username);

	public void write(UserDTO userDTO);

	public List<UserDTO> list(Map<String, Integer> map);

	public int getTotalA();
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String username);

	public void delete(UserDTO userDTO);

	public UserDTO checkDeleteInfo(String username);
	


	//유저 로그인 -241016
	public UserDTO login(Map<String, String> map);
	
	//겔러리
	public List<UserDTO> getAllUsers();
	
}
