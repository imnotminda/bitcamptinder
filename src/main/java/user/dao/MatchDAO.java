package user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import user.bean.UserDTO;

@Mapper
public interface MatchDAO {

	UserDTO getUser(@Param("id") String id);

	List<UserDTO> getAllUsersExcept(@Param("id")String id);

}
