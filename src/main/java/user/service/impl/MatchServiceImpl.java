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
		 // Convert currentUser string back to int (because we are using user_id)
	    int currentUserId = Integer.parseInt(currentUser);

	    // Use the correct method to fetch by user_id
	    UserDTO currentUserDetails = matchDAO.getUserById(currentUserId); // Query by user_id

	    if (currentUserDetails == null) {
	        System.err.println("User not found: " + currentUserId);
	        throw new RuntimeException("User not found: " + currentUserId);
	    }
		
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
		
		List<UserDTO> otherUsers = matchDAO.getAllUsersExcept(currentUserId);
		
		// Check if there are other users
	    if (otherUsers == null || otherUsers.isEmpty()) {
	        return new ArrayList<>(); // Return an empty list if no other users are found
	    }
		
	    List<UserDTO> matchedUsers = new ArrayList<>();
		
	    for (UserDTO otherUser : otherUsers) {
	    	if (otherUser == null) {
	            continue; // Skip null users if any
	        }
	    	int matchScore = 0;

	    	 if (currentUserSport.equals(otherUser.getUser_sport())) {
	             matchScore += 10;
	         }
	         if (currentUserArt.equals(otherUser.getUser_art())) {
	             matchScore += 10;
	         }
	         if (currentUserFood.equals(otherUser.getUser_food())) {
	             matchScore += 10;
	         }
	         if (currentUserMusic.equals(otherUser.getUser_music())) {
	             matchScore += 10;
	         }
	         if (currentUserHobby.equals(otherUser.getUser_hobby())) {
	             matchScore += 10;
	         }
	         if (currentUserTravel.equals(otherUser.getUser_travel())) {
	             matchScore += 10;
	         }
	         if (currentUserSmoke.equals(otherUser.getUser_smoke())) {
	             matchScore += 10;
	         }
	         if (currentUserReligion.equals(otherUser.getUser_religion())) {
	             matchScore += 10;
	         }
	         if (currentUserMbti.equals(otherUser.getUser_mbti())) {
	             matchScore += 10;
	         }
	         if (currentUserMovie.equals(otherUser.getUser_movie())) {
	             matchScore += 10;
	         }

	         System.out.println("Current User: " + currentUser);
	         System.out.println("Current User Details: " + currentUserDetails);
	    	otherUser.setMatchScore(matchScore);
	    	matchedUsers.add(otherUser);
	    }
	    
        matchedUsers.sort((u1, u2) -> Integer.compare(u2.getMatchScore(), u1.getMatchScore()));
        
        return matchedUsers;

	}
}
