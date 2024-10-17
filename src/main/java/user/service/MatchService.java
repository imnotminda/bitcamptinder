package user.service;

import java.util.List;

import user.bean.UserDTO;

public interface MatchService {

	List<UserDTO> getMatchingUsers(String currentUser);

}
