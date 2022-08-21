package com.rpa.board.controller;

import java.io.File;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.rap.board.mapper.NoticeMapper;
import com.rpa.board.domain.NoitceVO;
import com.rpa.board.service.NoticeService;
import com.rpa.board.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/board/*")
public class NoticeController {
	private NoticeMapper mapper;
	private UserService userService;
	private NoticeService boardService;

	@RequestMapping("list")
	public String list(Model model) {
		log.info("--------- getBoardList -----------");
		List<NoitceVO> list = mapper.getList();

		log.info(list);

		for (NoitceVO board : list) {
			log.info(board.getUsernum());
			board.setUser(userService.get(board.getUsernum()));
		}

		model.addAttribute("list", list);
		return "board/list";
	}

	@GetMapping("get")
	public String get(Model model, int bno) {
		log.info("--------- getBoard -----------");
		log.info("bno : " + bno);

		NoitceVO board = mapper.get(bno);
		board.setUser(userService.get(board.getUsernum()));

		model.addAttribute("board", board);
		return "board/get";
	}

	@GetMapping("register")
	public String registerPage() {
		log.info("------- registerPage ----------");

		return "board/register";
	}

	@PostMapping("register")
	public String register(NoitceVO vo, RedirectAttributes rttr) {
		log.info("register : " + vo);
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getBoard_num());

		return "redirect:/board/list.do";
	}

	@GetMapping("modify")
	public String modify() {
		log.info("------- modifyPage ----------");

		return "board/modify";
	}

	@GetMapping("remove.do")
	public String remove(int num) {
		log.info("------- remove ----------");
		mapper.delete(num);

		return "redirect:/board/list";
	}

	   @RequestMapping(value = "/summernoteImage.do",produces = "application/json; charset=utf-8")
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
