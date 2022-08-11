package com.rpa.pt.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.service.Pt_Goods_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;




@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/ptproduct/*")
public class PT_Goods_Controller {
	private Pt_Goods_Service service;
	
	
	
	//�۾���
	@PostMapping("/ptregister")
	public String ptregister(Pt_Goods_DTO dto,RedirectAttributes rttr) throws IOException {
		
		System.out.println("�۾��� ����"+dto);
		rttr.addFlashAttribute("result",dto.getPT_no());
		
		int ptnum= service.PtViewGet();
		return "redirect:/ptproduct/ptget?PT_no="+ptnum;
	}
	
	@GetMapping("/ptget")
	public void ptget(int PT_no, Model model) {
		log.info(PT_no+" �� ° �󼼺���");
		System.out.println("( "+PT_no+" ) ��° ��ǰ"+service.pt_get(PT_no));
		model.addAttribute("pt_no", service.pt_get(PT_no));
	}
	
	
	
	@GetMapping("/ptregister")
	public void ptregister() {
		
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list�� �Ѿ��");
		model.addAttribute("list",service.getlist());
	}
	
	@GetMapping("/ptremove")
	public String ptdelete(int pt_no) {
		log.info(pt_no+" ��°�� ���� �Ǿ����ϴ�");
		service.ptdelete(pt_no);
		return  "redirect:/ptproduct/list";
	}
	
	@GetMapping("/ptmodify")
	public void ptmodify(int pt_no,Model model) {
		log.info("������ ������ : "+pt_no);
		model.addAttribute("ptlist",service.pt_get(pt_no));
	}
	
	@PostMapping("/ptmodify")
	public String ptmodify() {
		service.ptupdate(0);
		return  "redirect:/ptproduct/list";
	}
	
	@RequestMapping(value = "/summernoteImage",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String uploadsummernoteimagefile(@RequestParam("file")MultipartFile multipartFile,HttpServletRequest requset) {
		JsonObject jsonobject = new JsonObject();
		String contextroot= new HttpServletRequestWrapper(requset).getRealPath("/");
		String fileroot = contextroot+"resources/upload/";
		String originalfilename = multipartFile.getOriginalFilename();
		String extension = originalfilename.substring(originalfilename.lastIndexOf("."));
		String savedfilename = UUID.randomUUID()+extension;
		File targetfile =new File(fileroot+savedfilename);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetfile);
			jsonobject.addProperty("url", "/resources/upload/"+savedfilename);
			jsonobject.addProperty("responseCode", "success");
			
			
		}catch (Exception e) {
			FileUtils.deleteQuietly(targetfile);
			jsonobject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a= jsonobject.toString();
		return a;
	}
	
}