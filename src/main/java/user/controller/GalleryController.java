package user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.dao.UserDAO;


@Controller
@RequestMapping(value="user")
public class GalleryController {
    
    @Autowired
    private UserDAO userDAO;  // GalleryDAO 대신 UserDAO 사용

    @GetMapping("gallery")
    @ResponseBody
    public List<UserDTO> gallery() {
        return userDAO.getAllUsers();  // 기존의 userDAO 메서드를 활용
    }
}
