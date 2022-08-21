CREATE TABLE notice (
   num number NOT NULL primary key,
   title varchar2(50) NOT NULL,
   content varchar2(4000) not null,
   notice_date date default sysdate,
   hits number NOT NULL,
   image varchar2(4000) NULL,
   notice_like number not null,
   --fk 
   id varchar2(20) not null,
   CONSTRAINT fk_member_to_notice foreign key(id) references member(id)
);