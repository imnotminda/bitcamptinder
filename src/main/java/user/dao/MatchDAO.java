package user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import user.bean.UserDTO;

@Mapper
public interface MatchDAO {

	UserDTO getUser(@Param("user_id") String user_id);

	List<UserDTO> getAllUsersExcept(@Param("user_id")String user_id);

}
