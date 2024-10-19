package user.service;

import java.util.List;

import user.bean.MessageDTO;
import user.bean.UserDTO;

public interface MatchService {

	List<UserDTO> getMatchingUsers(String currentUser);

	UserDTO getCurrentUserById(Integer currentUserId);

	void sendMessage(int senderId, int receiverId, String messageText);

	List<MessageDTO> getMessagesForUser(Integer user_id);

}
