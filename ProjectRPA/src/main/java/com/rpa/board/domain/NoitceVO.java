package com.rpa.board.domain;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.rap.board.mapper.NoticeMapper;
import com.rpa.board.service.UserService;

import lombok.Data;

/*
   CREATE TABLE board (
   board_num number NOT NULL primary key,
   board_title varchar2(50) NOT NULL,
   board_content varchar2(4000) not null,
   board_date date default sysdate,
   hits number NOT NULL,
   board_image varchar2(4000) NULL,
   board_like number not null,
   --fk 
   usernum number not null,
   CONSTRAINT fk_user_to_board foreign key(usernum) references users(usernum)
);
 */

@Data
public class NoitceVO {
	private int board_num;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String hits;
	private String board_image;
	private String board_like;
	private int usernum;
	
	private UserVO user;
}
