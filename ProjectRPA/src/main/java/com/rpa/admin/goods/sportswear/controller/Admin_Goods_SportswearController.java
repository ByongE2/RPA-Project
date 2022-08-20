package com.rpa.admin.goods.sportswear.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.admin.goods.sportswear.service.Admin_Goods_SportswearService;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.domain.SwPageDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

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
		System.out.println("당연히 될거고~");
		return "Goods/sportswear/swRegister";
	}//swInsert(Get)
	
	@PostMapping("/insert")
	public String swInsert(SportswearDto swDto, RedirectAttributes rttr, Model m) {
		log.info("Admin_Goods_Sportswear insert : " + swDto);
		System.out.println("swDto : " + swDto);
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
		
	}
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
		
	}
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
	}
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
	}
	
	
	
	
	
}//Admin_Goods_SportswearController
