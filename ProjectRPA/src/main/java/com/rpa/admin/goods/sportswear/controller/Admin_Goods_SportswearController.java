package com.rpa.admin.goods.sportswear.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.admin.goods.sportswear.service.Admin_Goods_SportswearService;
import com.rpa.goods.sportswear.domain.SportswearDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/goods/sportswear")
@Log4j
@AllArgsConstructor
public class Admin_Goods_SportswearController {
	
	private Admin_Goods_SportswearService admin_swService;
	
//	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
//	public void admin_goods_sportswearMain() throws Exception{
//		log.info("Admin_Goods_Sportswear main");
//	}
	
	@GetMapping("/insert")
	public void insert() {}
	
	@PostMapping("/insert")
	public String insert(SportswearDto swDto, RedirectAttributes rttr, Model m) {
		log.info("Admin_Goods_Sportswear insert : " + swDto);
		try {
			admin_swService.swInsert(swDto);
			rttr.addFlashAttribute("insert_result", swDto.getGoods_swName()); //등록 후 알람창에 등록물품 뜨게 하려고.
			
			return "redirect:/admin/goods/sportswear/main";
		} catch (Exception e) {
			e.printStackTrace();
//			m.addAttribute(swDto);
//			m.addAttribute("msg", "INSERT_ERR");
			
			return "redirect:/admin/goods/sportswear/main"; //보류
		}
	}
}
