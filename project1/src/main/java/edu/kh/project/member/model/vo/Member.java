package edu.kh.project.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor  //**기본 생성자 , 자주 사용
@AllArgsConstructor //모든 매개변수 생성자 , 잘 사용하지 않음
@Getter             //**모든 필드 Getter , 자주 사용
@Setter             //**모든 필드 Setter , 자주 사용
@ToString           //toString 오버라이딩
public class Member {
	//DB MEMBER 테이블 컬럼만큼
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private String memberTel;
	private String memberAddress;
	private String profileImage;
	private String enrollDate;
	private String memberDeleteFlag;
	private int authority;
	
	
}
