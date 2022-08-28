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

--sw cart 장바구니
create table goods_cart(
    goods_cartId number primary key,
    id varchar2(50),
    goods_swId number,
    goods_sw_Count number,
    foreign key (id) references member(id),
    foreign key (goods_swId) references goods_sportsWear(goods_swId)
);
create SEQUENCE seq_goods_cart;
--유니크 제약
alter table goods_cart add unique (id, goods_swId);


--주문
--주문 테이블
create table rpa_order(
    orderId varchar2(50) primary key,
    addressee varchar2(50) not null,
    id varchar2(20),
    memberAddr1 varchar2(100) not null,
    memberAddr2 varchar2(100) not null,
    memberAddr3 varchar2(100) not null,
    orderState varchar2(30) not null,
    deliveryCost number not null,
    usePoint number not null,
    orderDate date default sysdate,
    FOREIGN KEY(id)REFERENCES member(id)
);
-- 주문-상품 맵핑테이블
CREATE table rpa_orderItem(
    orderItemId number primary key,
    orderId varchar2(50),
    goods_swId number,
    goods_sw_Count number not null, --상품수량
    goods_swPrice number not null,
    goods_swDiscount number not null,
    savePoint number not null,
    FOREIGN KEY(orderId) REFERENCES rpa_order(orderId),
    FOREIGN KEY(goods_swId) REFERENCES goods_sportsWear(goods_swId)
);
create SEQUENCE seq_rpa_orderItem;


ALTER table member DROP COLUMN phone;
ALTER TABLE member ADD address2 VARCHAR(100) ;
ALTER TABLE member ADD address3 VARCHAR(100) ;
ALTER TABLE member ADD money number default 0 not null ;
ALTER TABLE member ADD point number default 0 not null ;
ALTER TABLE member MODIFY(pw VARCHAR2(60));



