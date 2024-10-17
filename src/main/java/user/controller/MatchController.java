package user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@GetMapping("/BitcampTinder/user/autoMatch")
	@ResponseBody
	public List<UserDTO> autoMatch (HttpSession session) {
		String currentUser = (String) session.getAttribute("memId");
		List<UserDTO> matchingUsers = matchService.getMatchingUsers(currentUser);
		return matchingUsers;

	}
	
}
