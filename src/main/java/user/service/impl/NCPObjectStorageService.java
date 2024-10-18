package user.service.impl;

import java.io.InputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import spring.conf.NaverSpringConfiguration;
import user.service.ObjectStorageService;

@Service
public class NCPObjectStorageService implements ObjectStorageService {
    final AmazonS3 s3;
    
    public NCPObjectStorageService(NaverSpringConfiguration naverSpringConfiguration) {
        s3 = AmazonS3ClientBuilder
                .standard()
                .withEndpointConfiguration(
                        new AwsClientBuilder.EndpointConfiguration(naverSpringConfiguration.getEndPoint(), naverSpringConfiguration.getRegionName()))
                .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(naverSpringConfiguration.getAccessKey(), naverSpringConfiguration.getSecretKey())))
                .build();
    }

    @Override
    public String uploadFile(String bucketName, String directoryPath, MultipartFile img) {
        try (InputStream inputStream = img.getInputStream()) {
            // 파일 이름을 UUID로 생성하여 충돌 방지
        	String imageFileName = img.getOriginalFilename();

            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentType(img.getContentType());

            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
                    directoryPath + imageFileName,
                    inputStream,
                    objectMetadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead); // PublicRead 설정

            s3.putObject(putObjectRequest); // 파일 업로드

            // 파일 URL 반환
            String fileUrl = s3.getUrl(bucketName, directoryPath + imageFileName).toString();
            return fileUrl;  // URL 반환
        } catch (Exception e) {
            throw new RuntimeException("파일 업로드 에러", e);
        }
    }
}


//package user.service.impl;
//
//import java.io.InputStream;
//import java.util.UUID;
//
//import javax.management.RuntimeErrorException;
//
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.amazonaws.auth.AWSStaticCredentialsProvider;
//import com.amazonaws.auth.BasicAWSCredentials;
//import com.amazonaws.client.builder.AwsClientBuilder;
//import com.amazonaws.services.s3.AmazonS3;
//import com.amazonaws.services.s3.AmazonS3ClientBuilder;
//import com.amazonaws.services.s3.model.CannedAccessControlList;
//import com.amazonaws.services.s3.model.ObjectMetadata;
//import com.amazonaws.services.s3.model.PutObjectRequest;
//
//import spring.conf.NaverSpringConfiguration;
//import user.service.ObjectStorageService;
//
//@Service
//public class NCPObjectStorageService implements ObjectStorageService {
//	final AmazonS3 s3;
//	
//	public NCPObjectStorageService(NaverSpringConfiguration naverSpringConfiguration) {
//		s3 = AmazonS3ClientBuilder
//				.standard()
//				.withEndpointConfiguration(
//						new AwsClientBuilder.EndpointConfiguration(naverSpringConfiguration.getEndPoint(), naverSpringConfiguration.getRegionName()))
//				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(naverSpringConfiguration.getAccessKey(),naverSpringConfiguration.getSecretKey())))
//				.build();
//	}
//
//	
//	@Override
//	public String uploadFile(String bucketName, String directoryPath, MultipartFile img) {
//		try(InputStream inputStream = img.getInputStream()) {
//			//String imageFileName = UUID.randomUUID().toString();
//			String imageFileName = img.getOriginalFilename();
//			
//			ObjectMetadata objectMetadata = new ObjectMetadata(); //파일 정보 읽기			
//			objectMetadata.setContentType(img.getContentType());
//			
//			PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
//																	directoryPath + imageFileName,
//																	inputStream,
//																	objectMetadata)
//												.withCannedAcl(CannedAccessControlList.PublicRead); //리소스에 대한 접근 권한
//												//PublicRead -> 모든 사용자가 객체를 읽을 수 있지만, 수정과 삭제는 할 수 없다
//			
//			
//			s3.putObject(putObjectRequest); //파일 업로드
//			
//			return imageFileName;
//		} catch(Exception e) {
//			throw new RuntimeException("파일 업로드 에러");
//		}
//	}
//
//}
