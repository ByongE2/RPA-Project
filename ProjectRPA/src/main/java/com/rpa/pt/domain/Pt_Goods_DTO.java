package com.rpa.pt.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Pt_Goods_DTO {
	private String pt_name,PT_content,PT_id,PT_State,PT_title,PT_photourl,Calendar_before,Calendar_after,PT_code,PT_Price;
	private int PT_no;
	private Date PT_Registration;
}
