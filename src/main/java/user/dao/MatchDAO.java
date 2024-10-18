package user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import user.bean.UserDTO;

@Mapper
public interface MatchDAO {

	 UserDTO getUserById(@Param("user_id") int user_id); // Method to get user by user_id
	    
	 UserDTO getUserByUsername(@Param("user_username") String user_username); // Method to get user by username
	    
	 List<UserDTO> getAllUsersExcept(@Param("user_id") int user_id); // Method to get all users except the current user by ID

	UserDTO getCurrentUserById(@Param("user_id") Integer currentUserId);


}
