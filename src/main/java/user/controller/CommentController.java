package user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.CommentDTO;
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
	
	//comment
	@RequestMapping(value = "commentContent", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commentInput(@RequestParam("pageuser_id") int userId, 
	                                         @RequestParam("content") String commentContent,
	                                         @RequestParam("commenter_id") int commenterId,
	                                         @RequestParam("commenter_name") String commenterName) {
	    System.out.println("userId: " + userId);
	    System.out.println("commentContent: " + commentContent);
	    System.out.println("commenterId: " + commenterId); // commenterId 출력
	    System.out.println("commenterName" + commenterName);

	    CommentDTO userCommentDTO = new CommentDTO();
	    userCommentDTO.setUser_id(userId);
	    userCommentDTO.setCommenter_id(commenterId); // commenter_id 설정
	    userCommentDTO.setContent(commentContent);
	    userCommentDTO.setCreated_AT(new Date());
	    userCommentDTO.setCommenter_name(commenterName);

	    String result = commentService.commentInput(userCommentDTO);

	    // 댓글 ID를 반환하도록 수정
	    Map<String, Object> response = new HashMap<>();
	    response.put("message", result);
	    response.put("commentId", userCommentDTO.getComment_id()); // 댓글 ID 포함

	    return response;
	}
	
    @RequestMapping(value = "getComment", method = RequestMethod.GET)
    @ResponseBody
    public List<CommentDTO> getComment(@RequestParam("pageuser_id") int userId) {
        return commentService.getComment(userId);
    }
}
