package user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.MatchDAO;
import user.dao.UserDAO;
import user.service.MatchService;

@Service
public class MatchServiceImpl implements MatchService {

	@Autowired
	MatchDAO matchDAO;

	@Override
	public List<UserDTO> getMatchingUsers(String currentUser) {
		UserDTO currentUserDetails = matchDAO.getUser(currentUser);
		
		String currentUserSport = currentUserDetails.getUser_sport();
		String currentUserArt = currentUserDetails.getUser_art();
		String currentUserFood = currentUserDetails.getUser_food();
		String currentUserMusic = currentUserDetails.getUser_music();
		String currentUserHobby = currentUserDetails.getUser_hobby();
		String currentUserTravel = currentUserDetails.getUser_travel();
		String currentUserSmoke = currentUserDetails.getUser_smoke();
		String currentUserReligion = currentUserDetails.getUser_religion();
		String currentUserMbti = currentUserDetails.getUser_mbti();
		String currentUserMovie = currentUserDetails.getUser_movie();
		
		List<UserDTO> otherUsers = matchDAO.getAllUsersExcept(currentUser);
	    List<UserDTO> matchedUsers = new ArrayList<>();
		
	    for (UserDTO otherUser : otherUsers) {
	    	int matchScore = 0;

	    	if (currentUserDetails.getUser_sport().equals(otherUser.getUser_sport())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_art().equals(otherUser.getUser_art())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_food().equals(otherUser.getUser_food())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_music().equals(otherUser.getUser_music())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_hobby().equals(otherUser.getUser_hobby())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_travel().equals(otherUser.getUser_travel())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_smoke().equals(otherUser.getUser_smoke())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_religion().equals(otherUser.getUser_religion())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_mbti().equals(otherUser.getUser_mbti())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getUser_movie().equals(otherUser.getUser_movie())) {
	    		matchScore += 10;
	    	}

	    	otherUser.setMatchScore(matchScore);
	    	matchedUsers.add(otherUser);
	    }
	    
        matchedUsers.sort((u1, u2) -> Integer.compare(u2.getMatchScore(), u1.getMatchScore()));
        
        return null;

	}
}
