package user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserUploadDTO;
import user.dao.UserUploadDAO;
import user.service.UserUploadService;

@Service
public class UserUploadServiceImpl implements UserUploadService {

	@Autowired
	private UserUploadDAO userUploadDAO;
	
	@Override
	public void upload(List<UserUploadDTO> imageUploadList) {
		userUploadDAO.upload(imageUploadList);
	}

	@Override
	public List<UserUploadDTO> uploadList() {
		return userUploadDAO.uploadList();
	}

	@Override
	public UserUploadDTO uploadView(String seq) {
		return userUploadDAO.uploadView(seq);
	}

	@Override
	public UserUploadDTO getSeq(String seq) {
		return userUploadDAO.getSeq(seq);
	}


}
