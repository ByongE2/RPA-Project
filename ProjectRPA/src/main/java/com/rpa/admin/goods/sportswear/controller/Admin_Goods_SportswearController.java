package com.rpa.admin.goods.sportswear.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.admin.goods.sportswear.service.Admin_Goods_SportswearService;
import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.domain.SwPageDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin/goods/sportswear")
@Log4j
@AllArgsConstructor
public class Admin_Goods_SportswearController {
	
	private Admin_Goods_SportswearService swService;
	
//	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
//	public void admin_goods_sportswearMain() throws Exception{
//		log.info("Admin_Goods_Sportswear main");
//	}
	
	@GetMapping("/insert")
	public String swInsert() {
		return "Goods/sportswear/swRegister";
	}//swInsert(Get)
	
	@PostMapping("/insert")
	public String swInsert(SportswearDto swDto, RedirectAttributes rttr, Model m) {
		log.info("Admin_Goods_Sportswear insert : " + swDto);
		try {
			swService.swInsert(swDto);
			rttr.addFlashAttribute("insert_result", swDto.getGoods_swName()); //등록 후 알람창에 등록물품 뜨게 하려고.
			
			System.out.println("swDto2 : " + swDto);
			return "redirect:/admin/goods/sportswear/list";
		} catch (Exception e) {
			e.printStackTrace();
//			m.addAttribute(swDto);
//			m.addAttribute("msg", "INSERT_ERR");
			
			return "redirect:/admin/goods/sportswear/list"; //보류
		}//catch
	}//swInsert(POST)
	
	@GetMapping("/list")
	public String swGetList(SwCriteria cri, Model model) throws Exception{
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
		
		return "Goods/sportswear/swList";
	}//swGetList
	
	@GetMapping("/detail")
	public String swGetDetail(Long swID, @ModelAttribute("cri")SwCriteria cri, Model model) throws Exception {
		log.info("sw 상세 페이지" + swID);
		System.out.println("???안뜨냐" + swID);
		System.out.println("???안뜨냐cc" + cri);
		System.out.println("???안뜨냐mm" + model);
		//list 조건 정보
		model.addAttribute("cri", cri);
		//상세 페이지 정보
		model.addAttribute("swInfo", swService.swGetDetail(swID));
		
		return "Goods/sportswear/swDetail";
	}//swGetDetail(Get)
	
	@GetMapping("/modify")
	public String swGetModify(Long swID, @ModelAttribute("cri")SwCriteria cri, Model model) throws Exception {
		log.info("sw 상세 페이지" + swID);
		System.out.println("???안뜨냐" + swID);
		System.out.println("???안뜨냐cc" + cri);
		System.out.println("???안뜨냐mm" + model);
		//list 조건 정보
		model.addAttribute("cri", cri);
		//상세 페이지 정보
		model.addAttribute("swInfo", swService.swGetDetail(swID));
		
		return "Goods/sportswear/swModify";
	}//swGetModify(Get)
	
	@PostMapping("/modify")
	public String swModify(SportswearDto swDto, RedirectAttributes rttr, @ModelAttribute("cri")SwCriteria cri) throws Exception {
		log.info("sw 수정 페이지" + swDto);
		
		swService.swModify(swDto);
		
		System.out.println("???안뜨냐" + swDto);
		System.out.println("???안뜨냐cc" + cri);
		if(swService.swModify(swDto) == 1) {
			rttr.addAttribute("result", "수정되었습니다");
		}
		
		//redirect라 rttr에 정보담고, 수정 후 기존 list페이지로 가기위해
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/goods/sportswear/list";
	}//swModify(Post)
	
	@PostMapping("/remove")
	public String swRemove(Long goods_swID, @ModelAttribute("cri") SwCriteria cri, RedirectAttributes rttr) throws Exception{
		log.info("sw 삭제 페이지" + goods_swID);
		System.out.println("swID : " + goods_swID);
		System.out.println("cri : " + cri);
		int result = swService.swRemove(goods_swID);
		if(swService.swRemove(goods_swID) ==1) {
			rttr.addFlashAttribute("result", "삭제 성공");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType()); 
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/goods/sportswear/list";
	}//swRemove
	
	//첨부 파일 업로드
	/*과정 요약
	 * 1. 이미지 파일 저장 
	 * 2. 썸네일 이미지 파일 생성 및 저장
	 * 3. 각 이미지 정보 List 객체에 저장
	 * 4. ResponseEntity를 통해서 뷰(view)로 http 상태 코드가 200이고 http Body에 이미지 정보가 담긴 List 객체를 전송
	 * */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE) 
	// produces : 서버에서 뷰로 전송되는 Response의 Content-type을 제어 할 수 있는 속성
	// APPLICATION_JSON_UTF8_VALUE 는 depreciated됨. 한글깨짐 방지 역할.
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		log.info("첨부 파일 업로드 ajaxㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		/* 이미지 파일 체크(MIME TYPE로 한번 더 유효성 체크) */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}// end of try-catch
			
			if(!type.startsWith("image")) { // MIME TYPE에서 첫 단어가 "image" 이면 image 파일임
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
			
		}//end of for
		
		String uploadFolder = "C:\\upload";
		
		//이미지 파일 날짜별로 폴더화해서 저장하기 위해
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator); //날짜 ' - ' 형식을 ' / '로 바꾸기 위해
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) { //같은폴더 생성안되게 유효성 체크
			uploadPath.mkdirs(); // mkdirs : 여러개 폴더 생성 , 한개는 mkdir()
		}
		
		//이미저 정보 담는 객체 (여러 이미지로 맵핑해놔서 ArrayList)
		List<AttachImageVO> list = new ArrayList<>();
		
		//향상된 for
		for(MultipartFile multipartFile : uploadFile){
			//이미지 정보 객체
			AttachImageVO vo = new AttachImageVO();
			
			// 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			//uuid (범용 고유 식별자) 적용 파일 이름
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			//uuid_파일이름 형태로 저장
			uploadFileName = uuid + "_" + uploadFileName;
			//파일 위치, 파일 이름을 합친 File 객체 
			File saveFile = new File(uploadPath, uploadFileName);
			//파일 저장
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 작성 방법 1 : 직접*/
//				//과정 요약: 'Java내'에서 1:'크기를 미리 정한 이미지'를 만들고, 그 2:'이미지에 맞게 원본 이미지를 그려 넣고', 그 3:'이미지를 저장'.
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); //썸네일 이미지 이름 : s_ + 이미지 이름
//				
//				//크기를 미리 정한 이미지 생성(크기를 정한 흰색 도화지를 만드는 ..?)
//				BufferedImage bo_image = ImageIO.read(saveFile); //bo_image = buffered original image
//				
//				//썸네일 이미지를 내가 원하는 '비율'로 만들기 위해서.(이미지마다 넓이 높이 달라서)
//				/* 비율 */
//				double ratio = 3;
//				/*넓이 높이*/
//				int width = (int) (bo_image.getWidth() / ratio);
//				int height = (int) (bo_image.getHeight() / ratio);
//				
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR); // 넓이,높이,생성될 이미지 타입
//				//이미지에 맞게 원본 이미지를 그려 넣고							//반환타입 int했음
//				Graphics2D graphic = bt_image.createGraphics(); //왼쪽 상단 좌표 = '(0,0)'
//				graphic.drawImage(bo_image, 0, 0, width, height, null); // 넣을이미지, x좌표, y좌표, 넓이, 높이, ImageObserver(이미지 정보받아서 업데이트하는 역할, 보통 null 전달)
//				//만들어진 이미지(썸네일)를 파일로 저장
//				ImageIO.write(bt_image, "jpg", thumbnailFile);// 파일로 저장할 이미지, 이미지 타입, File객체(경로+이름)
				
				/* 썸네일 작성 방법 2 : Thumbnailator 라이브러리 API 활용*/
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);				
				
				BufferedImage bo_image = ImageIO.read(saveFile);

				//비율 
				double ratio = 3;
				//넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				Thumbnails.of(saveFile)
		        .size(160, 160)
		        .toFile(thumbnailFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}//end of try-catch
			
			list.add(vo);
			
		}//end of 향상된 for
		//Http body에 list 정보 담고 +  상태코드는 OK(200번) = result
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
		
	}//uploadAjaxActionPOST
	
	//이미지 파일 삭제 
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile................" + fileName);
		
		File file = null;

		try {
			//썸네일 파일 삭제 
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8")); // URLDecoder : utf-8에서 '/','\'로 경로를 지정할 수없어서
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", ""); //getAbsolutePath : file 객체의 경로를 String 타입으로 반환
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}// try-catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);

	}//deleteFile
	
	
	
}//Admin_Goods_SportswearController
