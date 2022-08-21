/**
 * 이미지 정보 중 3가지 (경로, uuid, 파일이름) 데이터를 DB에 보관하기위해서
 * 3가지 데이터를 view로 전송하려고 만든 VO
 * 
 * 상품 id는 상품에 관한 변수로 추가
 */
package com.rpa.goods.sportswear.domain;

import lombok.Data;

@Data
public class AttachImageVO {

	//경로
	private String uploadPath;
	//uuid
	private String uuid;
	//파일 이름
	private String fileName;
	//상품 id
	private Long goods_swID; 
}
