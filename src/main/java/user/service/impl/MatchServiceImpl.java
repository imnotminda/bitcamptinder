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
		
		String currentUserSport = currentUserDetails.getSport();
		String currentUserArt = currentUserDetails.getArt();
		String currentUserFood = currentUserDetails.getFood();
		String currentUserMusic = currentUserDetails.getMusic();
		String currentUserHobby = currentUserDetails.getHobby();
		String currentUserTravel = currentUserDetails.getTravel();
		String currentUserSmoke = currentUserDetails.getSmoke();
		String currentUserReligion = currentUserDetails.getReligion();
		String currentUserMbti = currentUserDetails.getMbti();
		String currentUserMovie = currentUserDetails.getMovie();
		
		List<UserDTO> otherUsers = matchDAO.getAllUsersExcept(currentUser);
	    List<UserDTO> matchedUsers = new ArrayList<>();
		
	    for (UserDTO otherUser : otherUsers) {
	    	int matchScore = 0;

	    	if (currentUserDetails.getSport().equals(otherUser.getSport())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getArt().equals(otherUser.getArt())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getFood().equals(otherUser.getFood())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getMusic().equals(otherUser.getMusic())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getHobby().equals(otherUser.getHobby())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getTravel().equals(otherUser.getTravel())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getSmoke().equals(otherUser.getSmoke())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getReligion().equals(otherUser.getReligion())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getMbti().equals(otherUser.getMbti())) {
	    		matchScore += 10;
	    	}
	    	if (currentUserDetails.getMovie().equals(otherUser.getMovie())) {
	    		matchScore += 10;
	    	}

	    	otherUser.setMatchScore(matchScore);
	    	matchedUsers.add(otherUser);
	    }
	    
        matchedUsers.sort((u1, u2) -> Integer.compare(u2.getMatchScore(), u1.getMatchScore()));
        
        return null;

	}
}
