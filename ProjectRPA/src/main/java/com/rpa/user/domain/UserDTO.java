package com.rpa.user.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*CREATE table member(
	    id VARCHAR2(20) not null PRIMARY KEY,
	    pw VARCHAR2(20) not null,
	    name VARCHAR2(45) not null,
	    address VARCHAR2(100) not null,
	    address2 VARCHAR2(100) not null,
	    address3 VARCHAR2(100) not null,
	    email VARCHAR2(50) not null,
	    grade NUMBER not null,
	    money number NOT NULL,
	    point number NOT NULL,
	    regDate DATE default sysdate
	);*/

@Data
public class UserDTO {

	private String id, pw, name, email, address, address2, address3; // 아이디, 비밀번호, 이메일, 주소1~3
	private int grade; // 관리자 권한 구분(0:일반사용자, 1:관리자)
	private int money; // 회원 돈
	private int point; // 회원 포인트
	private int regDate; //등록일
	
	
}
