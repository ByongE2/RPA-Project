package com.rpa.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.pt.mapper.timemapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class timemappertest {
	@Autowired
	private timemapper timeMapper;
	
	@Test
	public void testGetTime() {
		System.out.println(timeMapper.getTime1());
	}
	
	@Test
	public void testGetTime2() {
		System.out.println(timeMapper.getTime2());
	}
}
