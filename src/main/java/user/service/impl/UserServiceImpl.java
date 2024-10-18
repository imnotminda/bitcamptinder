package user.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.ObjectStorageService;
import user.service.UserService;

//id username으로바꾸기

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public String checkId(String user_username) {
		UserDTO userDTO = userDAO.checkId(user_username);
		System.out.println("UserDTO: " + userDTO);
		if (userDTO == null)
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

	// DB
	// List<UserDTO> list = userDAO.list(map);

	// 페이징 처리

	
	
	@Override
	public void update(UserDTO userDTO) {
		userDAO.update(userDTO);

	}

	@Override
	public UserDTO getUser(String user_username) {
		return userDAO.getUser(user_username);
	}

	@Override
	public void delete(UserDTO userDTO) {
		userDAO.delete(userDTO);

	}

	@Override
	public UserDTO checkDeleteInfo(String user_username) {
		return userDAO.checkDeleteInfo(user_username);
	}

	// 로그인 추가 -241016
	@Override
	public UserDTO login(Map<String, String> map) {
		return userDAO.login(map);

	}
	
	
	@Autowired
	private ObjectStorageService objectStorageService; // NCPObjectStorageService가 주입됨

	@Override
	public void updateProfilePic(UserDTO userDTO, MultipartFile img) {
	    String bucketName = "bitcamp-9th-bucket-142";
	    String directoryPath = "WEB-INF/storage";

	    // 파일 업로드 후 URL을 가져옴
	    String profilePicUrl = objectStorageService.uploadFile(bucketName, directoryPath, img);

	    // UserDTO의 profile_pic 필드에 업로드된 파일 URL 저장
	    userDTO.setProfile_pic(profilePicUrl);

	    // 이후 DAO 호출로 DB에 저장하는 로직 추가 (예: userDAO.updateProfilePic(userDTO))
	}

	@Override
	public UserDTO getUserById(Integer userId) {
		return userDAO.getUserById(userId);
	}

	
	
	
	
	
	
}