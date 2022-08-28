/*
 * 서버 내부에서 주기적으로 
 * DB에 이미지 정보가 존재하지 않는 이미지 파일을 삭제하기 위해서 
 * 배치프로그램 사용
 * 
 * */

package com.rpa.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class BatchTest {
	
	 //메서드가 실행될 시간 설정 위해서
	@Scheduled(cron = "0 * * * * *") // 1분마다 실행 , cron(유닉스 계열 운영체제 시간 기반 잡 스케쥴러) 표현식
	public void sdTestMethod() throws Exception{
		log.warn("배치 실행 테스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡcron:1분마다");
		log.warn("============================================================");
	}

}
