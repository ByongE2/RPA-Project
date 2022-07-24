-------------------------------------------------------------
pt데이터베이스 구조
-pt 테이블 구조
/* 나중에 수정요망
CREATE TABLE Member (
  id VARCHAR(20) NOT NULL,
  pw VARCHAR(20) NOT NULL,
  Phone VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  grade VARCHAR(45) NOT NULL,
  name VARCHAR(45) NOT NULL,
  todate DATE NULL,
  PRIMARY KEY (id));


CREATE TABLE PTproduct (
  PT_no INT NOT NULL,
  pt_name VARCHAR(45) NOT NULL,
  PT_content VARCHAR(1000) NOT NULL,
  PT_id VARCHAR(45) NOT NULL,
  PT_Registration DATE NOT NULL,
  PT_Price INT NOT NULL,
  PT_code INT  NOT NULL,
  PT_title VARCHAR(45) unique,
  PT_photourl VARCHAR(1000) NULL,
  Calendar_before VARCHAR(45) NULL,
  Calendar_after VARCHAR(45) NULL,
  PRIMARY KEY (PT_code),
  foreign key(pt_id)
  references member(id));

/*
시퀀스 추가
create sequence no_seq increment by 1 start with 1 minvalue 1 maxvalue 9999;

멤버 등록
insert into member(id,pw,phone,address,Email,grade,name,todate)
values('kkao45617','1234','010-1234-1234','경기도화성시 병점동','kkao45617@naver.com','2','이재현',sysdate);

pt상품 등록 
insert into PTproduct(PT_no,PT_title,PT_content,pt_name,PT_Price,PT_photourl,Calendar_before,Calendar_after,PT_id,PT_Registration,PT_code) 
values(no_seq.nextval,'당신의 멋진 몸을 위해','이 내용을 토대로 저는 이 이미지와 글을 ㎱만 이것을 활용해 여러분도 즐겨보세요','이재현',30000,'이미지','날짜전','날짜후','kkao45617',TO_DATE(sysdate,'yyyy-MM-dd'),1);


상품 랜덤코드 등록 sql 문
SELECT DBMS_RANDOM.STRING('X', 100) STR FROM DUAL



*/

*/
	롬복 없어서 추가

		<dependency>
		    <groupId>org.projectlombok</groupId>
		    <artifactId>lombok</artifactId>
		    <version>1.18.24</version>
		    <scope>provided</scope>
		</dependency>
----------------------------------------------------------------------------------------
