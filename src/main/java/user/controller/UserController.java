package user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserController {

	@Autowired
    private UserService userService;
	
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeForm() {
		return "/user/writeForm";
	}
	
    @RequestMapping(value="checkId", method=RequestMethod.POST)
    @ResponseBody
    public String checkId(String id) {
    	return userService.checkID(id);
    }
    
    @RequestMapping(value="write", method=RequestMethod.POST)
    @ResponseBody
    public void write(@ModelAttribute UserDTO userDTO) {
    	userService.write(userDTO);
    }
    
    @RequestMapping(value="list", method=RequestMethod.GET)
	public String list (@RequestParam(required = false, defaultValue = "1") String pg, Model model) { //페이징처리 무조건 필요하지 않고, 기본값은 1페이지
    	Map<String, Object> pageMap = userService.list(pg);
    	
    	pageMap.put("pg", pg);
    	model.addAttribute("pageMap",pageMap);
		return "/user/list"; // =>/WEB-INF/user/list.jsp
	}
    
    @RequestMapping(value="updateForm", method=RequestMethod.GET)
	public String updateForm(@RequestParam String id, @RequestParam String pg, Model model) {
    	UserDTO userDTO = userService.getUser(id);
    	model.addAttribute("userDTO", userDTO);
    	model.addAttribute("pg", pg);
		return "/user/updateForm";
	}
    
    @RequestMapping(value="update", method=RequestMethod.POST)
    @ResponseBody
	public void update(@ModelAttribute UserDTO userDTO) {
		userService.update(userDTO);
	}
    
    @RequestMapping(value="checkDeleteInfo", method=RequestMethod.GET)
	public String checkDeleteInfo(@RequestParam String id, @RequestParam String name, @RequestParam String pwd, Model model ) {
		UserDTO userDTO = userService.checkDeleteInfo(id);
		model.addAttribute("userDTO", userDTO);
		return "/user/delete";
	}
    
    @RequestMapping(value="delete", method=RequestMethod.POST)
    @ResponseBody
	public void delete(@ModelAttribute UserDTO userDTO) {
		userService.delete(userDTO);
	}
    
}
