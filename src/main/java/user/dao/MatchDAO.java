package user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import user.bean.MessageDTO;
import user.bean.UserDTO;

@Mapper
public interface MatchDAO {

	 UserDTO getUserById(@Param("user_id") int user_id); // Method to get user by user_id
	    
	 UserDTO getUserByUsername(@Param("user_username") String user_username); // Method to get user by username
	    
	 List<UserDTO> getAllUsersExcept(@Param("user_id") int user_id); // Method to get all users except the current user by ID

	UserDTO getCurrentUserById(@Param("user_id") Integer currentUserId);

	void sendMessage(@Param("sender_id") int senderId, @Param("receiver_id") int receiverId, @Param("message_text") String messageText); // Method to send a message

	List<MessageDTO> getMessagesForUser(@Param("user_id") int user_id);
	

}
