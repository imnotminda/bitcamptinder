package user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserUploadDTO;
import user.service.ObjectStorageService;
import user.service.UserService;
import user.service.UserUploadService;

@Controller
@RequestMapping(value="user")
public class UserUploadController {
	@Autowired
	private UserUploadService userUploadService;
	@Autowired
	private ObjectStorageService objectStorageService;
	
	private String bucketName= "bitcamp-9th-bucket-142";
	
	@RequestMapping(value="uploadForm")
	public String uploadForm() {
		return "/upload/uploadForm";
	}
	
	@RequestMapping(value="uploadAJaxForm")
	public String uploadAJaxForm() {
		return "/upload/uploadAJaxForm";
	}

	
	//1개
	/*
	@RequestMapping(value="upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam MultipartFile img,
						 HttpSession session) {
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
				
		String imageOriginalFileName = img.getOriginalFilename();
		
		File file = new File(filePath, imageOriginalFileName);
		
		try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String result = "<span>"
					  + "<img src='/spring/storage/" + imageOriginalFileName + "' width='200' height='200'>"
					  + "</span>";
		
		
		System.out.println(userUploadDTO.getImageName() + ", "
						 + userUploadDTO.getImageContent() + ", "
						 + userUploadDTO.getImageFileName() + ", "
						 + userUploadDTO.getImageOriginalFileName());
		
		userUploadDTO.setImageOriginalFileName(imageOriginalFileName);
		
		//DB
		
		
		return result;
	}
	*/
	
	//2개 이상
	/*
	@RequestMapping(value="upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam MultipartFile[] img,
						 HttpSession session) {
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
				
		String imageOriginalFileName;
		File file;
		String result;
		
		//-----------------------
		imageOriginalFileName = img[0].getOriginalFilename();
		file = new File(filePath, imageOriginalFileName);
		
		try {
			img[0].transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		result = "<span>"
			   + "<img src='/spring/storage/" + imageOriginalFileName + "' width='200' height='200'>"
			   + "</span>";
		//-----------------------
		imageOriginalFileName = img[1].getOriginalFilename();
		file = new File(filePath, imageOriginalFileName);
		
		try {
			img[1].transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result += "<span>"
			   + "<img src='/spring/storage/" + imageOriginalFileName + "' width='200' height='200'>"
			   + "</span>";

		return result;
	}
	*/
	
	//1개 또는 여러개(드래그)
	//파일명엔 한글 또는 공백이 있어도 업로드가 된다.
	@RequestMapping(value="upload", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam("img[]") List<MultipartFile> list,
						 HttpSession session) {
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("resources/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		String imageFileName;
		String imageOriginalFileName;
		File file;
		String result = "";
		
		//파일들을 모아서 DB로 보내기
		List<UserUploadDTO> imageUploadList = new ArrayList<>();
		
		for(MultipartFile img : list) {
		
			//imageFileName = UUID.randomUUID().toString();
			
			//NaverCloud Platform ObjectStorage
			imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
			
			
			
			imageOriginalFileName = img.getOriginalFilename();
			file = new File(filePath, imageOriginalFileName);
			
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
//			try {
				result += "<span>"
					   + "<img src='/spring/storage/"
						
//					   + URLEncoder.encode(imageOriginalFileName, "UTF-8") => 파일명에 공백이 있으면 업로드가 안된다.
					   
					   + imageOriginalFileName
					   + "' width='200' height='200'>"
					   + "</span>";
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			}
			
			//241015 오혜진 추가
			UserUploadDTO dto = new UserUploadDTO();
			dto.setProfile_pic(userUploadDTO.getProfile_pic());
//			dto.setImageName(userUploadDTO.getImageName());
//			dto.setImageContent(userUploadDTO.getImageContent());
//			dto.setImageFileName(imageFileName);
//			dto.setImageOriginalFileName(imageOriginalFileName);
			
			imageUploadList.add(dto);
			
		}//for
		
		//DB
		userUploadService.upload(imageUploadList);
		
		return result;
	}
	
	@RequestMapping(value="uploadList")
	public ModelAndView uploadList() {
		List<UserUploadDTO> list = userUploadService.uploadList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/upload/uploadList");
		return mav;
	
	}
	
	@RequestMapping(value="uploadView")
	public String uploadView(@RequestParam String seq, Model model) {
		UserUploadDTO userUploadDTO = userUploadService.uploadView(seq);
		model.addAttribute("userUploadDTO",userUploadDTO);
		
		return "/upload/uploadView";	
		
	}
	
	@RequestMapping(value="uploadUpdateForm", method=RequestMethod.GET)
	public String uploadUpdateForm(@RequestParam String seq, Model model) {
		UserUploadDTO userUploadDTO = userUploadService.getSeq(seq);
		model.addAttribute("userUploadDTO", userUploadDTO);
		return "/upload/uploadUpdateForm";
	}
	
}















