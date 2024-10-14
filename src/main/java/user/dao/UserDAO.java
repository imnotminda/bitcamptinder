package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public UserDTO checkId(String id);

	public void write(UserDTO userDTO);

	public List<UserDTO> list(Map<String, Integer> map);

	public int getTotalA();
	
	public void update(UserDTO userDTO);

	public UserDTO getUser(String id);

	public void delete(UserDTO userDTO);

	public UserDTO checkDeleteInfo(String id);
}
