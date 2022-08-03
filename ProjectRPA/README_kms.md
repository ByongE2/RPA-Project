*pom.xml 설정

1. Java version 1.6 -> 11 변경
2. STS version 3.1.1 -> 5.2.7 변경
3. org.springframework test, jdbc, tx 추가
4. Log4j version 1.2.17 변경 후 exclusions 주석 처리
5. Junit version 4.7 -> 4.12 변경
6. lombok version 1.18.24
7. ojdbc8 version 21.6.0.0.1
8. HikariCP version 5.0.1
9. mybatis version 3.5.10
10.mybatis-spring version 2.0.7
11.log4jdbc 1.16
12. jackson-databind version 2.13.3
13. gson version 2.9.0
14. jackson-core version 2.13.3


CREATE table member(
    id VARCHAR2(20) not null PRIMARY KEY,
    pw VARCHAR2(20) not null,
    name VARCHAR2(45) not null,
    phone VARCHAR2(13) not null,
    address VARCHAR2(100) not null,
    email VARCHAR2(50) not null,
    grade NUMBER not null,
    regDate DATE default sysdate
);
