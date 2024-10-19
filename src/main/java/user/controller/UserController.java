package user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserDTO;
import user.service.MailService;
import user.service.UserService;
import user.service.impl.NCPObjectStorageService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private MailService mailService;
	@Autowired
	private NCPObjectStorageService objectStorageService;

	// 회원가입
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "/user/writeForm";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	@ResponseBody
	public void write(@RequestParam("profile_pic_file") MultipartFile file, @ModelAttribute UserDTO userDTO) {
		// Upload the file to the storage and get the URL
	    if (file != null && !file.isEmpty()) {
	        String bucketName = "bitcamp-9th-bucket-142";
	        String directoryPath = "storage/"; // Specify the directory if needed

	        // Upload the file and get the file URL
	        String fileUrl = objectStorageService.uploadFile(bucketName, directoryPath, file);
	        System.out.println("File URL Length: " + fileUrl.length());

	        // Set the profile picture URL to the DTO
	        userDTO.setProfile_pic(fileUrl); // Store the URL or filename in the DTO
	    }

	    // Save user data, including the profile_pic URL
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
	public String login(@RequestParam("user_username") String username, 
						@RequestParam("user_pwd") String pwd,
						HttpSession session) {
		Map<String, String> map = new HashMap<>();
		map.put("user_username", username);
		map.put("user_pwd", pwd);
		UserDTO userDTO = userService.login(map); // Map 전달

		if (userDTO == null) {
		return "fail"; // 실패 시 "fail" 문자열 반환
		} else {
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("memId", (userDTO.getUser_id()));
			session.setAttribute("memName", userDTO.getUser_username());
			session.setAttribute("memDTO", userDTO);
			
		    System.out.println("memId: " + session.getAttribute("memId"));
		    System.out.println("memName: " + session.getAttribute("memName"));
			return "success"; // 성공 시 "success" 문자열 반환
		}

	}
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "/index";
    }

	// 회원아이디 유효성
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String user_username) {
		return userService.checkId(user_username);
	}

	// 241017 오혜진 회원 정보 수정
	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session) {
		String user_username = (String) session.getAttribute("memName");
		UserDTO userDTO = userService.getUser(user_username);
		model.addAttribute("userDTO", userDTO);
		return "/user/updateForm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public void update(@ModelAttribute UserDTO userDTO) {
	    System.out.println("수정사용자 정보: " + userDTO); //로그확인
		userService.update(userDTO);
	}
	
	//마이페이지 
	
//	 @RequestMapping(value = "myPage", method = RequestMethod.GET)
//	    public String mypage(@RequestParam("user_id") Integer userId, Model model) {
//	        UserDTO userDTO = userService.getUserById(userId);
//	        if (userDTO != null) {
//	        	System.out.println("UserDTO: " + userDTO); // Debug line
//	        	model.addAttribute("userDTO", userDTO);    
//	            return "user/myPage"; // Ensure this path is correct
//	        } else {
//	            return "redirect:/error"; // Handle user not found scenario
//	        }
//	    }
	 //오혜진 241020 세션 관련 로직 추가 - 사용자 비교
	 @RequestMapping(value = "myPage", method = RequestMethod.GET)
	 public String mypage(HttpSession session, @RequestParam("user_id") Integer userId, Model model) {
	     Integer memId = (Integer) session.getAttribute("memId"); // 세션 memId 

//	     if (memId == null) {
//	         return "redirect:/user/loginForm"; //
//	     }

	     // 주어진 userId로 사용자 정보 가져오기
	     UserDTO userDTO = userService.getUserById(userId);
	     if (userDTO != null) {
	         System.out.println("UserDTO: " + userDTO); // 
	         model.addAttribute("userDTO", userDTO);
	         model.addAttribute("isCurrentUser", memId.equals(userId)); //
	         return "user/myPage"; //
	     } else {
	         return "redirect:/error"; // 사용자x
	     }
	 }

	 
	 @RequestMapping(value = "deleteForm", method = RequestMethod.GET)
	    public String deleteForm(Model model, HttpSession session) {
	    	String user_username = (String) session.getAttribute("memName");
			UserDTO userDTO = userService.getUser(user_username);
			model.addAttribute("userDTO", userDTO);
			 System.out.println("memId: " + session.getAttribute("memId"));
			 System.out.println("memName: " + session.getAttribute("memName"));
			return "/user/deleteForm";
	    }
	 
	 @RequestMapping(value = "checkDeleteInfo", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	    @ResponseBody
	    public String checkDeleteInfo(@RequestParam String user_username, @RequestParam String user_pwd) {
	        UserDTO userDTO = userService.checkDeleteInfo(user_username);
	        
	        // 비밀번호 확인 로직
	        if (userDTO != null && userDTO.getUser_pwd().equals(user_pwd)) {
	            return "비밀번호가 일치합니다."; // 비밀번호가 일치하는 경우
	        } else {
	            return "비밀번호가 일치하지 않습니다."; // 비밀번호가 불일치하는 경우
	        }
	    }

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestParam String user_username) {
	    userService.delete(user_username);
	}
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam String email) {
	    System.out.println("이메일 인증 요청이 들어옴!");
	    System.out.println("이메일 인증 이메일 : " + email);
	    return mailService.joinEmail(email);
	}
	
}
