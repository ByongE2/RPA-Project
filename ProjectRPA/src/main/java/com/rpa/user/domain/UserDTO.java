package com.rpa.user.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//CREATE table member(
//	    id VARCHAR2(20) not null PRIMARY KEY,
//	    pw VARCHAR2(20) not null,
//	    name VARCHAR2(45) not null,
//	    phone VARCHAR2(13) not null,
//	    address VARCHAR2(100) not null,
//	    email VARCHAR2(50) not null,
//	    grade NUMBER not null,
//	    regDate DATE default sysdate
//	);

@Data
@Setter
@Getter
@ToString
public class UserDTO {

	private String id, pw, name, phone, address, email;
	
	// 관리자 권한 구분(0:일반, 1:관리자)
	private int grade;
}
