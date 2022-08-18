package com.rpa.pt.domain;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Pt_Goods_DTO {
	private String pt_name,PT_content,PT_id,PT_State,PT_title,PT_Price,Calendar_before,Calendar_after,PT_code,PT_photourl;
	private int PT_no;
	private Date PT_Registration;
}
