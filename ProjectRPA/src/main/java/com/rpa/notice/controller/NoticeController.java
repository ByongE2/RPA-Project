package com.rpa.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.notice.domain.Criteria;
import com.rpa.notice.domain.NoticeDTO;
import com.rpa.notice.domain.PageDTO;
import com.rpa.notice.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	
//	//공지사항 페이지
//	@GetMapping("/Noticelist")
//	public void list(Model model) {
//		log.info("공지사항 리스트");
//		
//		model.addAttribute("list",service.getList());
//	}
	
	//공지사항 페이지(페이징)
	@GetMapping("/Noticelist")
	public void list(Model model,Criteria cri) {
		log.info("공지사항 리스트");
		
		model.addAttribute("list",service.getListWithPagging(cri));
		
		int total = service.getTotalCount(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("page", pageDTO);
	}
	
	//공지사항 등록 페이지
	@GetMapping("/NoticeRegister")
	public void register_NoticeGet() {
		log.info("공지사항 등록 페이지 호출");
		
	}
	
	//공지사항 등록
	@PostMapping("/NoticeRegister")
	public String register_NoticePost(NoticeDTO noticeDTO, RedirectAttributes rttr) {
		log.info("공지사항 등록");
		log.info("NoticeDTO : " + noticeDTO);
		
		service.register(noticeDTO);
		
		rttr.addFlashAttribute("result", "register success");
		
		return "redirect:/notice/Noticelist";
	}
	
	//상세보기
	@GetMapping("/Noticeget")
	public void get(Long notice_no, Model model, Criteria cri) {
		model.addAttribute("NoticeInfo",service.get(notice_no));
		model.addAttribute("cri",cri);
		
	}
	
	//공지사항 수정페이지 이동
	@GetMapping("/Noticemodify")
	public void noticModifyGet(Long notice_no, Model model, Criteria cri) {
		model.addAttribute("NoticeInfo",service.get(notice_no));
		model.addAttribute("cri",cri);
		
	}
	
	// 공지사항 수정
	@PostMapping("/Noticemodify")
	public String noticeModifyPost(NoticeDTO noticeDTO, RedirectAttributes rttr) {
		service.modify(noticeDTO);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/notice/Noticelist";
	}
	
	//삭제
	@PostMapping("/Noticedelete")
	public String noticeDeletePost(Long notice_no, RedirectAttributes rttr) {
		service.remove(notice_no);
		
		rttr.addFlashAttribute("result", "remove success");
		
		return "redirect:/notice/Noticelist";
	}
	
	
}
