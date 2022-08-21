package com.rpa.board.domain;

import java.sql.Date;

import lombok.Data;

/*
  -- user 테이블
CREATE TABLE users (
   usernum number NOT NULL primary key,
   userid varchar2(50) NOT NULL UNIQUE,
   username varchar2(20) NOT NULL,
   nickname varchar2(20) NOT NULL,
   userpass varchar2(16) NOT NULL,
   phone char(13),  
   birth char(8),
   gender varchar2(8) NOT NULL, 
   joindate date default sysdate,
   email varchar2(50) NOT NULL,
   admin number(1) NOT NULL, 
   question varchar2(50),
   answer varchar2(30)
);
 */
@Data
public class UserVO {
	private int userNum, admin;
	private String userId, userName, nickName, userPass, gender,
		phone, birth, email, question, answer;
	private Date joinDate;
}