package com.rpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.goods.service.Pt_Goods_Service;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ptproduct/*")
public class Pt_Goods_Controller {
	private Pt_Goods_Service service;
	
	
}
