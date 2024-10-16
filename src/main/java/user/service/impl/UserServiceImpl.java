package user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

//id username으로바꾸기

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	

	@Override
	public String checkID(String username) {
		UserDTO userDTO = userDAO.checkId(username);
		System.out.println("UserDTO: " + userDTO);
		if(userDTO == null)
			return "non_exist";
		else
			return "exist";
	}

	@Override
	public void write(UserDTO userDTO) {
		userDAO.write(userDTO);
		
	}

//	@Override
//	public Map<String, Object> list(String pg) {
//		//1 페이지 당 5개씩
//		int endNum = 5; //페이지당 표시할 개수
//		int startNum = (endNum * Integer.parseInt(pg)) - 5; //시작위치 (0부터 시작)
//		
//		Map<String, Integer> map = new HashMap<>();
//		map.put("startNum", startNum);
//		map.put("endNum", endNum);
		
		//DB
		//List<UserDTO> list = userDAO.list(map);
		
		//페이징 처리
	

	@Override
	public void update(UserDTO userDTO) {
		userDAO.update(userDTO);
		
	}

	@Override
	public UserDTO getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	public void delete(UserDTO userDTO) {
		userDAO.delete(userDTO);
		
	}

	@Override
	public UserDTO checkDeleteInfo(String username) {
		return userDAO.checkDeleteInfo(username);
	}


}
