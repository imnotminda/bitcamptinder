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
	    
	    String currentUserGender = currentUserDetails.getUser_gender() != null ? currentUserDetails.getUser_gender() : "";
	    String currentUserSport = currentUserDetails.getUser_sport() != null ? currentUserDetails.getUser_sport() : "";
	    String currentUserArt = currentUserDetails.getUser_art() != null ? currentUserDetails.getUser_art() : "";
	    String currentUserFood = currentUserDetails.getUser_food() != null ? currentUserDetails.getUser_food() : "";
	    String currentUserMusic = currentUserDetails.getUser_music() != null ? currentUserDetails.getUser_music() : "";
	    String currentUserHobby = currentUserDetails.getUser_hobby() != null ? currentUserDetails.getUser_hobby() : "";
	    String currentUserTravel = currentUserDetails.getUser_travel() != null ? currentUserDetails.getUser_travel() : "";
	    String currentUserSmoke = currentUserDetails.getUser_smoke() != null ? currentUserDetails.getUser_smoke() : "";
	    String currentUserReligion = currentUserDetails.getUser_religion() != null ? currentUserDetails.getUser_religion() : "";
	    String currentUserMbti = currentUserDetails.getUser_mbti() != null ? currentUserDetails.getUser_mbti() : "";
	    String currentUserMovie = currentUserDetails.getUser_movie() != null ? currentUserDetails.getUser_movie() : "";
		
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
	    	
    	  // Null-safe fetching for otherUser attributes with defensive coding
        String otherUserGender = otherUser.getUser_gender() != null ? otherUser.getUser_gender() : "";
        String otherUserSport = otherUser.getUser_sport() != null ? otherUser.getUser_sport() : "";
        String otherUserArt = otherUser.getUser_art() != null ? otherUser.getUser_art() : "";
        String otherUserFood = otherUser.getUser_food() != null ? otherUser.getUser_food() : "";
        String otherUserMusic = otherUser.getUser_music() != null ? otherUser.getUser_music() : "";
        String otherUserHobby = otherUser.getUser_hobby() != null ? otherUser.getUser_hobby() : "";
        String otherUserTravel = otherUser.getUser_travel() != null ? otherUser.getUser_travel() : "";
        String otherUserSmoke = otherUser.getUser_smoke() != null ? otherUser.getUser_smoke() : "";
        String otherUserReligion = otherUser.getUser_religion() != null ? otherUser.getUser_religion() : "";
        String otherUserMbti = otherUser.getUser_mbti() != null ? otherUser.getUser_mbti() : "";
        String otherUserMovie = otherUser.getUser_movie() != null ? otherUser.getUser_movie() : "";
    	
        if (currentUserGender.equalsIgnoreCase("male") && otherUserGender.equalsIgnoreCase("male")) {
            continue; // Skip if both are male
        }
        if (currentUserGender.equalsIgnoreCase("female") && otherUserGender.equalsIgnoreCase("female")) {
            continue; // Skip if both are female
        }
         
	    	int matchScore = 0;

	    	if (currentUserSport.equals(otherUserSport)) {
	            matchScore += 20;
	        }
	        if (currentUserArt.equals(otherUserArt)) {
	            matchScore += 20;
	        }
	        if (currentUserFood.equals(otherUserFood)) {
	            matchScore += 20;
	        }
	        if (currentUserMusic.equals(otherUserMusic)) {
	            matchScore += 20;
	        }
	        if (currentUserHobby.equals(otherUserHobby)) {
	            matchScore += 20;
	        }
	        if (currentUserTravel.equals(otherUserTravel)) {
	            matchScore += 20;
	        }
	        if (currentUserSmoke.equals(otherUserSmoke)) {
	            matchScore += 20;
	        }
	        if (currentUserReligion.equals(otherUserReligion)) {
	            matchScore += 20;
	        }
	        if (currentUserMbti.equals(otherUserMbti)) {
	            matchScore += 20;
	        }
	        if (currentUserMovie.equals(otherUserMovie)) {
	            matchScore += 20;
	        }
	         
	         if (matchScore > 70) {
	                otherUser.setMatchScore(matchScore);
	                matchedUsers.add(otherUser);
	            }
	    }
	    	
        matchedUsers.sort((u1, u2) -> Integer.compare(u2.getMatchScore(), u1.getMatchScore()));
        
        if (matchedUsers.size() > 3) {
            matchedUsers = matchedUsers.subList(0, 3);
        }
        
        return matchedUsers;

	}

	@Override
	public UserDTO getCurrentUserById(Integer currentUserId) {
		return matchDAO.getCurrentUserById(currentUserId);
	}


}
