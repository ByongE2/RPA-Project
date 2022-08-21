select * from PTproduct;
select * from member;
select * from PTBASKET;
drop table member;
drop table PTproduct;
drop table PTbasket;

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
  PT_Registration DATE NULL,
  PT_Price varchar2(1000) NOT NULL,
  PT_code varchar2(1000)  NOT NULL,
  PT_title VARCHAR(45)not null,
  PT_State varchar2(40)not null,
  PT_photourl VARCHAR(1000) NULL,
  Calendar_before VARCHAR(45) NULL,
  Calendar_after VARCHAR(45) NULL,
  PRIMARY KEY (PT_code),
  foreign key(pt_id)
  references member(id));




CREATE TABLE PTbasket (
  PT_id_basket VARCHAR(45),
  PT_title_basket VARCHAR(45),
  PT_price_basket INT NOT NULL,
  pt_photourl_basket VARCHAR(1000) ,
  purchase_basket VARCHAR(45),
  pt_code varchar(1000),
  pt_date DATE NULL,
FOREIGN KEY (PT_code)
REFERENCES PTproduct (pt_code),
FOREIGN KEY (PT_id_basket)
REFERENCES Member (id));

insert into PTbasket(PT_id_basket,PT_title_basket,PT_price_basket,pt_photourl_basket,purchase_basket,pt_code,pt_date)
values('kkao45617','헬스장이용','4123','사진','결제완료','cxazcxrvfgixufbijypx',null);

delete from PTbasket where PT_CODE='gceosqvbugvjyycbyymd';

select * from PTBASKET where PT_ID_BASKET='kkao45617';

commit;
    
create sequence no_seq increment by 1 start with 1 minvalue 1 maxvalue 9999;

insert into member(id,pw,phone,address,Email,grade,name,todate)
values('kkao45617','1234','010-1234-1234','경기도화성시 병점동','kkao45617@naver.com','2','이재현',sysdate);

insert into PTproduct(PT_no,PT_title,PT_content,pt_name,PT_Price,PT_photourl,Calendar_before,Calendar_after,PT_id,PT_Registration,PT_code) 
values(no_seq.nextval,'당신의 멋진 몸을 위해','이 내용을 토대로 저는 이 이미지와 글을 썻으며 이것을 활용해 여러분도 즐겨보세요','이재현',30000,'이미지','날짜전','날짜후','kkao45617',TO_DATE(sysdate,'yyyy-MM-dd'),1);


insert into tbl_board(bno,title,content,writer)values(SEQ_BOARD.NEXTVAL, (SELECT DBMS_RANDOM.STRING('X', 20) STR FROM DUAL),'selse','ase');

insert into PTproduct(PT_no,PT_title,PT_content,pt_name,PT_Price,PT_photourl,Calendar_before,Calendar_after,PT_id,PT_Registration,PT_code)
values(no_seq.nextval,'복근있는 여름을 잘 보내기','이 내용은 말그대로 내용이며 글이고 또한 양식입니다','이재현',30000,'사진1','캘린더1','캘린더2','kkao45617',TO_DATE(sysdate,'yyyy-MM-dd'),(SELECT DBMS_RANDOM.STRING('X', 20) STR FROM DUAL));




/*
create sequence no_seq increment by 1 start with 1 minvalue 1 maxvalue 9999;







SELECT DBMS_RANDOM.STRING('X', 100) STR FROM DUAL



*/

*/ 롬복

	<dependency>
	    <groupId>org.projectlombok</groupId>
	    <artifactId>lombok</artifactId>
	    <version>1.18.24</version>
	    <scope>provided</scope>
	</dependency>
	<dependency>
	
	
이미지 업로드

		<dependency>
          <groupId>commons-io</groupId>
          <artifactId>commons-io</artifactId>
          <version>2.6</version>
      </dependency>
	
	
      <!-- https://mvnrepository.com/artifact/com.google.code.gson/gson -->
      <!-- json 변환 -->
      <dependency>
          <groupId>com.google.code.gson</groupId>
          <artifactId>gson</artifactId>
          <version>2.8.6</version>
      </dependency>

      <!-- commons-fileupload -->
      <!-- multipart등을 사용할수 있음 -->
      <dependency>
          <groupId>commons-fileupload</groupId>
          <artifactId>commons-fileupload</artifactId>
          <version>1.3.1</version>
      </dependency>
servlet-context.xml

<beans:beans xmlns="http://www.springframework.org/schema/mvc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:beans="http://www.springframework.org/schema/beans" xmlns:context="http://www.springframework.org/schema/context" xsi:schemaLocation="http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd">

<!-- DispatcherServlet Context: defines this servlet's request-processing infrastructure -->

<!-- Enables the Spring MVC @Controller programming model -->
<annotation-driven />

<!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
<resources mapping="/resources/**" location="/resources/" />

<!-- Resolves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	<beans:property name="prefix" value="/WEB-INF/views/" />
	<beans:property name="suffix" value=".jsp" />
	
</beans:bean>

<context:component-scan base-package="com.rpa"></context:component-scan>
<!--  <context:component-scan base-package="com.rap.pt.controller"/>-->

<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	<beans:property name="maxUploadSize" value="100000000"></beans:property>
</beans:bean>
</beans:beans>
아임포트 jitpack.io https://jitpack.io

com.github.iamport iamport-rest-client-java 0.2.14