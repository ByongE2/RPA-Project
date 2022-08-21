환경

*jdk11
*sts tool(5.2.7)
*oracle 11g
*Encoding utf-8
*git ( https://github.com/ByongE2/RPA-Project.git )
*lombok-1.18.24.jar 
*mybatis 3.5.10
*utf-8
*Quartz(batch program)

DB
테이블

--sportsWear(상품)
create table goods_sportsWear(
    goods_swId NUMBER not null,
    goods_swName VARCHAR2(200) not null,
    goods_swPrice NUMBER not null,
    goods_swStock NUMBER not null,
    goods_swDetail VARCHAR2(2000),
    goods_swDiscount number(2,2),
    goods_swRegDate DATE default sysdate,
    goods_swUpdateDate DATE default sysdate,
    CONSTRAINT PK_goods_sportsWear PRIMARY KEY(goods_swId)
   );
create SEQUENCE seq_Goods_sportsWear;

-- 상품 이미지 테이블(일단 sw만)
create table RPA_image(
    goods_swId NUMBER ,
    fileName varchar2(100) not null,
    uploadPath varchar2(200) not null,
    uuid varchar2(100)not null ,
    primary key (uuid),
    foreign key (goods_swId) references goods_sportsWear(goods_swId)
);
