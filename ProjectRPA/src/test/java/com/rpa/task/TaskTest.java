/*
 * 	이미지 삭제 시, 배치프로그램 사용해서 db에는 없고 서버(upload디렉토리)에만 남아있는 이미지 삭제하기 위해서.
 *   
 *  첫 번째, DB에 존재하는 이미지 정보 리스트를 가져온다.
 *  
 	두 번째, 서버에 저장된 이미지 리스트를 가져온다.
 	
 	세 번째, 두개의 리스트를 비교하여 DB리스트에 존재하지 않는 서버 이미지 리스트를 분류한다.
 	
 	네 번재, 해당 리스트의 이미지 파일을 삭제한다.
 	
 * */

package com.rpa.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.AttachImageVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TaskTest {

	@Autowired
	private Admin_Goods_SportswearMapper mapper;
	
	//폴더 경로 문자열(어제 날짜)을 얻는 메서드
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}//getFolderYesterDay
	
	
	@Test
	public void taskTest() {
	
	//첫 번째, DB에 존재하는 이미지 정보 리스트를 가져온다.
	//DB정보 이미지리스트 가져옴(기준)
	List<AttachImageVO> fileList = mapper.checkFileList();
	
	System.out.println("fileList : ");
	fileList.forEach( list -> System.out.println(list));
	System.out.println("========================================");
	
	
	//리스트 비교하기 전에 자료형 같게 만들어줌.(Path 객체로-java api) - DB정보를 path객체로.(checkFilePath)
	List<Path> checkFilePath = new ArrayList<Path>();
	
	fileList.forEach(vo -> {
		//Paths.get : static(정적)메서드이고, 반환타입이 path객체
		Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()); 
		checkFilePath.add(path);
	});
	System.out.println("checkFilePath : ");
	checkFilePath.forEach(list -> System.out.println(list));
	System.out.println("========================================");
	
	
	//썸네일도 checkFilePath에 넣어서, 데이터 기준만들어서 삭제 안되게 끔
	fileList.forEach(vo -> {
		Path path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" +  vo.getUuid() + "_" + vo.getFileName());
		checkFilePath.add(path);
	});
	System.out.println("checkFilePath(썸네일 이미지 정보 추가 후) : ");
	checkFilePath.forEach(list -> System.out.println(list));
	System.out.println("========================================");
	
	
	//두 번째, 서버에 저장된 이미지 리스트를 가져온다.
	//서버(디렉토리)이미지 파일 File객체로 생성
	File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
	File[] targetFile = targetDir.listFiles();
	
	System.out.println("targetFile : ");
	for(File file : targetFile) {
		System.out.println(file);
	}
	System.out.println("========================================");
	
	
	//세 번째, 두개의 리스트를 비교하여 DB리스트에 존재하지 않는 서버 이미지 리스트를 분류한다.
	List<File> removeFileList = new ArrayList<File>(Arrays.asList(targetFile));
	
	System.out.println("removeFileList(필터 전) : ");		
	removeFileList.forEach(file -> {
		System.out.println(file);
	});		
	System.out.println("========================================");		
	
	for(File file : targetFile){
		checkFilePath.forEach(checkFile ->{
			if(file.toPath().equals(checkFile)) 
				removeFileList.remove(file);	
		});
	}//for
	
	System.out.println("removeFileList(필터 후) : ");
	removeFileList.forEach(file -> {
		System.out.println(file);
	});
	System.out.println("========================================");
	
	
	//네 번재, 분류된 해당 리스트의 이미지 파일을 삭제한다.
	/* 파일 삭제 */
	for(File file : removeFileList) {
		System.out.println("삭제 : " + file);
		file.delete();
	}
	
	
	
	
	
	}//method taskTest
	
}//Class TaskTest
