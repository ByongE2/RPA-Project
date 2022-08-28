package com.rpa.notice.domain;

import java.util.Date;

import lombok.Data;

//create table notice(
//	    notice_no number(10,0),
//	    title VARCHAR2(200) not null,
//	    content varchar2(2000) not null,
//	    regdate date default sysdate,
//	    notice_image varchar2(4000) NULL
//	);

@Data
public class NoticeDTO {

	private Long notice_no;
	private String title, content, notice_image;
	private Date regDate;
}
