
/* 작성자: 김병혁
 * 작성일: 2022/08/02
 * 내용 : Goods_SportsWear Dto
 * 
 * 테이블:
 * create table goods_sportsWear(
    goods_swId NUMBER not null,
    goods_swName VARCHAR2(200) not null,
    goods_swPrice NUMBER not null,
    goods_swStock NUMBER not null,
    goods_swDetail VARCHAR2(2000),
    goods_swRegDate DATE default sysdate,
    goods_swUpdateDate DATE default sysdate,
    CONSTRAINT PK_goods_sportsWear PRIMARY KEY(goods_swId)
   );
	create SEQUENCE seq_Goods_sportsWear;
 */

package com.rpa.goods.sportswear.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SportswearDto {

	private Long goods_swID;
	private int goods_swPrice, goods_swStock;
	private String goods_swName, goods_swDetail;
	private Date goods_swRegDate, goods_swUpdateDate;
	
}
