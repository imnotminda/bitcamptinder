package user.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserCommentDTO;
import user.service.CommentService;

@Controller
@RequestMapping(value="user")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	//feedForm
	@RequestMapping(value = "feedForm", method = RequestMethod.GET)
	public String userfeedForm() {
		return "/user/feedForm";
	}
	@RequestMapping(value ="commentInput", method = RequestMethod.POST)
	@ResponseBody
	public String commentInput(@RequestParam("userId") int userId, 
	                           @RequestParam("commentContent") String commentContent) {
		System.out.println(userId);
		System.out.println(commentContent);
	    UserCommentDTO userCommentDTO = new UserCommentDTO();
	    userCommentDTO.setUser_id(userId);
	    userCommentDTO.setComment_content(commentContent);
	    userCommentDTO.setLogtime(new Date());

	    commentService.commentInput(userCommentDTO);

	    return "success";
	}
}
