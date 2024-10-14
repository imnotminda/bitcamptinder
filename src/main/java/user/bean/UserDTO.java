package user.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Setter
@Getter
public class UserDTO {
	private String name;
	private String id;
	private String pwd;
	
	@Override
	public String toString() {
		return name + "\t" + id + "\t" + pwd;
	}
}
