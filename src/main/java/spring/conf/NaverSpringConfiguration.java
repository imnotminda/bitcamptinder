package spring.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import lombok.Getter;
import lombok.Setter;

@Configuration
@PropertySource("classpath:spring/naver.properties")
@Getter
@Setter
public class NaverSpringConfiguration {
	private @Value("${ncp.accessKey}")String accessKey;
	private @Value("${ncp.secretKey}")String secretKey;
	private @Value("${ncp.regionName}")String regionName;
	private @Value("${ncp.endPoint}")String endPoint;
}
