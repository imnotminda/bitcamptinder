package user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.MatchService;

@Controller
@RequestMapping(value="user")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	//자동매칭
	@GetMapping("/autoMatch")
	@ResponseBody
	public List<UserDTO> autoMatch(HttpSession session) {
		Integer currentUserId = (Integer) session.getAttribute("memId");
	    
		// Check if user is logged in
        if (currentUserId == null) {
            System.out.println("User not found: " + currentUserId);
            throw new RuntimeException("User is not logged in."); // Handle this more gracefully in a real application
        }
        
        // Convert the Integer to String
        String currentUser = String.valueOf(currentUserId);
	    
	    List<UserDTO> matchingUsers = matchService.getMatchingUsers(currentUser);
	    
	    if (matchingUsers == null) {
	        throw new RuntimeException("No matching users found.");
	    }
	    
	    return matchingUsers;
	}
	
	 @GetMapping("autoMatchResult")
	    public String showMatchResults(HttpSession session, Model model) {
		 	Integer currentUserId = (Integer) session.getAttribute("memId");

		 	// Check if user is logged in
		    if (currentUserId == null) {
		        throw new RuntimeException("User is not logged in.");
		    }
		    
		    UserDTO currentUser = matchService.getCurrentUserById(currentUserId);

		    // Convert Integer to String if needed in your service, or directly pass as Integer
		    List<UserDTO> matchingUsers = matchService.getMatchingUsers(String.valueOf(currentUserId));

		    model.addAttribute("matchingUsers", matchingUsers);
		    model.addAttribute("currentUser", currentUser);

		    return "/user/autoMatchResult";
	    }
	
}
