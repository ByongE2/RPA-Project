package com.rpa.pt.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Pt_Goods_DTO {
	private String pt_name,PT_content,PT_id,PT_State,PT_title,PT_photourl,Calendar_before,Calendar_after;
	private int PT_no,PT_Price,PT_code;
	private Date PT_Registration;
}
