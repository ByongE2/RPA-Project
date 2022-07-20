<<<<<<< HEAD


jdk11
sts tool(5.2.7)
oracle 11g
Encoding utf-8
git ( https://github.com/ByongE2/RPA-Project.git )
lombok-1.18.24.jar (  ) 

DB


mybatis



-------------------------------------------------------------
ptµ¥ÀÌÅÍº£ÀÌ½º ±¸Á¶
-pt Å×ÀÌºí ±¸Á¶
/* ³ªÁß¿¡ ¼öÁ¤¿ä¸Á
=======


*jdk11
*sts tool(5.2.7)
*oracle 11g
*Encoding utf-8
*git ( https://github.com/ByongE2/RPA-Project.git )
*lombok-1.18.24.jar 

DB


--------------------------------------------------------------
-pt í…Œì´ë¸” êµ¬ì¡°
>>>>>>> f969dbaaa282318858f4865ccdda45048619c509
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


<<<<<<< HEAD
=======




>>>>>>> f969dbaaa282318858f4865ccdda45048619c509
CREATE TABLE PTproduct (
  PT_no INT NOT NULL,
  pt_name VARCHAR(45) NOT NULL,
  PT_content VARCHAR(1000) NOT NULL,
  PT_id VARCHAR(45) NOT NULL,
  PT_Registration DATE NOT NULL,
  PT_Price INT NOT NULL,
  PT_code INT NOT NULL,
  PT_State VARCHAR(45) NOT NULL,
<<<<<<< HEAD
  PT_title VARCHAR(45) NOT NULL,
=======
  PT_title VARCHAR(45)UNIQUE NOT NULL,
>>>>>>> f969dbaaa282318858f4865ccdda45048619c509
  PT_photourl VARCHAR(1000) NULL,
  Calendar_before VARCHAR(45) NULL,
  Calendar_after VARCHAR(45) NULL,
  PRIMARY KEY (PT_no),
  foreign key(pt_id)
  references member(id));

<<<<<<< HEAD

*/
	·Òº¹ ¾ø¾î¼­ Ãß°¡

		<dependency>
		    <groupId>org.projectlombok</groupId>
		    <artifactId>lombok</artifactId>
		    <version>1.18.24</version>
		    <scope>provided</scope>
		</dependency>
----------------------------------------------------------------------------------------
=======
CREATE TABLE PTbasket (
  PT_id_basket VARCHAR(45) ,
  PT_title_basket VARCHAR(45)  ,
  PT_price_basket INT NOT NULL,
  pt_photourl_basket VARCHAR(1000) ,
  purchase_basket VARCHAR(45),
  pt_date DATE NULL,

    FOREIGN KEY (PT_title_basket)
    REFERENCES PTproduct (PT_title),

  
    FOREIGN KEY (PT_id_basket)
    REFERENCES Member (id));
------------------------------------------------------


>>>>>>> f969dbaaa282318858f4865ccdda45048619c509
