package com.rpa.goods.sportswear.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class Goods_SportswearController {

	
//	private AttachService attachService;
	
	
//	private swService swService;
	
//		@Autowired
//		private ReplyService replyService;
	
	@GetMapping("/main")
	public void mainPageGet() {
		log.info("메인 페이지로 이동");
	}//mainPageGet
	
	@GetMapping("/goods/sportswear/display")
	//이미지 파일은 바이너리 파일 범주임(text파일을 제외하면 다 바이너리 파일 0,1 범주임) 그래서 byte배열 byte[] 사용
	public ResponseEntity<byte[]> getSwImage(String fileName){
		log.info("getImage()ㅡㅡㅡㅡㅡㅡㅡ:" + fileName);
		
		//'유동 경로' + '파일 이름'
		File file = new File("c:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;
		try {
			//Response의 header와 관련된 설정의 객체를 추가해주기 위해서
			HttpHeaders header = new HttpHeaders();
			//'Content Type' 속성 값에 이미지 파일 MIME TYPE을 추가해주기 위해서 HttpHeader 클래스에 있는 add() 메서드를 사용
			header.add("Content-type", Files.probeContentType(file.toPath()));//  Response header의 '속성명', '속성명'에 부여할 값
			//FileCopyUtils 클래스는 파일과 stream 복사에 사용할 수 있는 메서드를 제공하는 클래스
			//copyToByteArray() 메서드는 파라미터로 부여하는 File 객체 즉, 대상 파일을 복사하여 byte 배열로 반환해주는 클래스
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			e.printStackTrace();
		}//end of try-catch
		
		return result;
	}//getSwImage
}//Goods_SportswearController
