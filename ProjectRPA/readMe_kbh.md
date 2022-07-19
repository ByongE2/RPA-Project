

*jdk11
*sts tool(5.2.7)
*oracle 11g
*Encoding utf-8
*git ( https://github.com/ByongE2/RPA-Project.git )
*lombok-1.18.24.jar 

DB


--------------------------------------------------------------
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
  PT_code INT NOT NULL,
  PT_State VARCHAR(45) NOT NULL,
  PT_title VARCHAR(45) NOT NULL,
  PT_photourl VARCHAR(1000) NULL,
  Calendar_before VARCHAR(45) NULL,
  Calendar_after VARCHAR(45) NULL,
  PRIMARY KEY (PT_no),
  foreign key(pt_id)
  references member(id));

CREATE TABLE PTbasket (
  PT_id_basket VARCHAR(45) ,
  PT_title_basket VARCHAR(45)  ,
  PT_price_basket INT NOT NULL,
  pt_photourl_basket VARCHAR(1000) ,
  purchase_basket VARCHAR(45),
  pt_date DATE NULL,
   constraint PT_price_basket1
    FOREIGN KEY (PT_price_basket)
    REFERENCES PTproduct (PT_Price),
    constraint PT_price_basket2
    FOREIGN KEY (PT_title_basket)
    REFERENCES PTproduct (PT_title),
   constraint PT_price_basket3
    FOREIGN KEY (pt_photourl_basket)
    REFERENCES PTproduct (PT_photourl),
   constraint PT_id_basket1
    FOREIGN KEY (PT_id_basket)
    REFERENCES Member (id));
*/




