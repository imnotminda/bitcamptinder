package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	// username 변경
	@Autowired
	private UserService userService;

	// 회원가입
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "/user/writeForm";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute UserDTO userDTO) {
		userService.write(userDTO);
	}

	// 241016 로그인 - 오혜진
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/user/loginForm";
	}

	// 241016 로그인 로직 - 오혜진
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("username") String username, 
						@RequestParam("pwd") String pwd,
						HttpSession session) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("pwd", pwd);
		UserDTO userDTO = userService.login(map); // Map 전달

		if (userDTO == null) {
		return "fail"; // 실패 시 "fail" 문자열 반환
		} else {
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("memId", userDTO.getUser_username());
			session.setAttribute("memName", userDTO.getUser_name());
			//session.setAttribute("memEmail", userDTO.getEmail1() + "@" + userDTO.getEmail2());
			session.setAttribute("memDTO", userDTO);
			
		    System.out.println("memId: " + session.getAttribute("memId"));
		    System.out.println("memName: " + session.getAttribute("memName"));
			return "success"; // 성공 시 "success" 문자열 반환
		}

	}


	// 회원아이디 유효성
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(String username) {
		return userService.checkID(username);
	}

//    @RequestMapping(value="list", method=RequestMethod.GET)
//	public String list (@RequestParam(required = false, defaultValue = "1") String pg, Model model) { //페이징처리 무조건 필요하지 않고, 기본값은 1페이지
//    	Map<String, Object> pageMap = userService.list(pg);
//    	
//    	pageMap.put("pg", pg);
//    	model.addAttribute("pageMap",pageMap);
//		return "/user/list"; // =>/WEB-INF/user/list.jsp
//	}

	// 회원 정보 수정
	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public String updateForm(@RequestParam String username, @RequestParam String pg, Model model) {
		UserDTO userDTO = userService.getUser(username);
		model.addAttribute("userDTO", userDTO);
		model.addAttribute("pg", pg);
		return "/user/updateForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public void update(@ModelAttribute UserDTO userDTO) {
		userService.update(userDTO);
	}

	// 회원 삭제
	@RequestMapping(value = "checkDeleteInfo", method = RequestMethod.GET)
	public String checkDeleteInfo(@RequestParam String username, @RequestParam String name, @RequestParam String pwd,
			Model model) {
		UserDTO userDTO = userService.checkDeleteInfo(username);
		model.addAttribute("userDTO", userDTO);
		return "/user/delete";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@ModelAttribute UserDTO userDTO) {
		userService.delete(userDTO);
	}

}
