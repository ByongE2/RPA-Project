package com.rpa.goods.sportswear.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.domain.SwPageDto;
import com.rpa.goods.sportswear.mapper.AttachMapper;
import com.rpa.goods.sportswear.service.AttachService;
import com.rpa.goods.sportswear.service.Goods_SportswearService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@AllArgsConstructor
@Log4j
public class Goods_SportswearController {

	private Goods_SportswearService swService;
	
	private AttachService attachService;
	
	
//		@Autowired
//		private ReplyService replyService;
	
	@GetMapping("/main")
	public String mainPageGet() {
		log.info("메인 페이지로 이동");
		return "mainTEST";
	}//mainPageGet
	
	@GetMapping("/goods/sportswear/list")
	public String swListGet(SwCriteria cri, Model model) throws Exception{
		log.info("sw 목록 페이지" + cri);
		//getList
		List<SportswearDto> list = swService.swGetList(cri);
		if(!list.isEmpty()) {
			model.addAttribute("list",list); //검색결과 존재
		} else {
			model.addAttribute("listCheck", "empty");	// 검색결과 존재하지 않을 경우
		}
		//페이징
		int total = swService.swGetTotal(cri);
		SwPageDto pageMaker = new SwPageDto(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		
		
		log.info("목록 리스트 정보 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:" + list);
		return "Goods/sportswear/swClientList";
	}//swGetList
	
	
	/* 상품 상세 정보*/
	@GetMapping("/goods/sportswear/detail/{goods_swID}")
	public String swDetailGet(@PathVariable("goods_swID")Long swID, Model model) {
		
		log.info("상품 사용자 상세 페이지..........");
		
		model.addAttribute("swInfo", swService.swGetDetail(swID));
		
		return "/Goods/sportswear/swClientDetail";
	}
	
	
	/* 이미지 출력 */
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
	
	
	//상세페이지 넘어갈 때 상품+ 상품이미지 정보 같이 넘겨주는 방법도 있으나,
	//상세페이지 이동 후 AJAX 또는 getJSON으로 정보 요청하는 방법으로 하겠음.(여기선 getJSON)
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(Long swID){
		
		log.info("getAttachList..........swID : " + swID);
		
		return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(swID), HttpStatus.OK);
	}//getAttachList
	
}//Goods_SportswearController
