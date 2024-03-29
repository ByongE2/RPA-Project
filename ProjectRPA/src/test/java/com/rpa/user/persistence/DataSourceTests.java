package com.rpa.user.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

//pom.xml 설정 ---> Junit 버전 4.12로 변경/ log4j 버전 1.2.17로 변경
// spring - webmvc  카피 후 spring - test 만들기
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testConnection() {
		try(Connection con = dataSource.getConnection()){
		log.info("dataSource : "+ dataSource);	
		log.info(con);	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
