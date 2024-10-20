package user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import user.bean.MessageDTO;
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
	 
	 
	 // Method to handle profile click and redirect to matchCompare.jsp
	    @GetMapping("/matchCompare")
	    public String compareUsers(@RequestParam("user_id") int userId, HttpSession session, Model model) {
	        // Get the current user from the session
	        Integer currentUserId = (Integer) session.getAttribute("memId");
	        
	        // Check if the user is logged in
	        if (currentUserId == null) {
	            throw new RuntimeException("User is not logged in.");
	        }
	        
	        // Fetch the current user data
	        UserDTO currentUser = matchService.getCurrentUserById(currentUserId);
	        
	        // Fetch the clicked user's data
	        UserDTO clickedUser = matchService.getCurrentUserById(userId);
	        
	        if (clickedUser == null) {
	            throw new RuntimeException("Clicked user not found.");
	        }
	        
	        // Add both users' data to the model
	        model.addAttribute("currentUser", currentUser);
	        model.addAttribute("clickedUser", clickedUser);
	        
	        // Redirect to matchCompare.jsp
	        return "/user/matchCompare";
	    }
	    
    // Method to handle message form display
    @GetMapping("/messageForm")
    public String messageForm(@RequestParam("sender_id") int senderId,  @RequestParam("receiver_id") int receiverId, HttpSession session, Model model) {
        // Check if the user is logged in
        Integer currentUserId = (Integer) session.getAttribute("memId");
        
        if (currentUserId == null) {
            throw new RuntimeException("User is not logged in.");
        }

        // Fetch current user data (this should be the sender)
        UserDTO currentUser = matchService.getCurrentUserById(senderId);
        // Fetch clicked user's data (this should be the receiver)
        UserDTO clickedUser = matchService.getCurrentUserById(receiverId);

        // Add both users' data to the model
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("clickedUser", clickedUser);

        // Return to the message form JSP
        return "/user/messageForm";  // Adjust the path to your message form JSP
    }
    
    @PostMapping("/sendMessage")
    public String sendMessage(@RequestParam("sender_id") int senderId, @RequestParam("receiver_id") int receiverId, @RequestParam("message_text") String messageText, HttpSession session) {

        // Assuming you have a service to handle message sending logic
        matchService.sendMessage(senderId, receiverId, messageText);
        
        session.setAttribute("user_id", senderId);
        
        // Redirect to inbox or a success page
        return "redirect:/user/myPage?user_id=" + senderId;
    }
    
    @GetMapping("/userInbox")
    public String showInbox(HttpSession session, Model model) {
        Integer user_id = (Integer) session.getAttribute("memId");

        // Check if user is logged in
        if (user_id == null) {
            throw new RuntimeException("User is not logged in.");
        }

        List<MessageDTO> messages = matchService.getMessagesForUser(user_id); // Implement this service method
        model.addAttribute("messages", messages);

        return "/user/userInbox"; // Path to your inbox JSP
    }
}
