--제약조건

--최근에는 도구를 활용하여 간단하게 사용가능
--수업에서는 SQL문으로 하였음

--NOT NULL : 널값은 입력 안됨
DESC departments;

--UK 유니크 : 중복되지 않음, NULL 가능
--PK 기본키 : 중복되지 않음+NOT NULL/테이블당 하나만 가능

--emp_name은 NOT NULL 제약조건, email은 유니크 제약조건
CREATE TABLE emp1 (
    eno         NUMBER(3),
    emp_name    VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email       VARCHAR2(30),
    CONSTRAINT emp1_email_uk UNIQUE (email)
);
--데이터를 입력
INSERT INTO emp1 VALUES (208, 'Kim', 'KJS@naver.com');
INSERT INTO emp1 VALUES (209,  NULL, 'ABC@naver.com'); --널값을 입력할 수 없어서 에러 발생
INSERT INTO emp1 VALUES (210, 'Lee', 'KJS@naver.com'); --중복 안됨 email 유니크

-- Check 제약조건
CREATE TABLE emp2 (
    eno         NUMBER(3),
    emp_name    VARCHAR2(20),
    sal         NUMBER(10),
    CONSTRAINT emp2_sak_check CHECK(sal>1000)
);

INSERT INTO emp2 VALUES(208, 'Kim', 1200);
INSERT INTO emp2 VALUES(209, 'Lee', 900); --sal의 값이 1000보다 커야 된다.

--제약조건 이름 없이 테이블 생성
DROP TABLE emp;
CREATE TABLE emp(
    eno     NUMBER(4)       PRIMARY KEY,
    ename   VARCHAR2(20)    NOT NULL,
    gno     VARCHAR2(13)    UNIQUE CHECK(LENGTH(gno) > =8),
    gender  VARCHAR2(5)     CHECK(gender IN('woman','man'))
);
INSERT INTO emp VALUES(1,'Kim','12345678','man');
--예제
CREATE TABLE members(
    member_id   NUMBER(2)       PRIMARY KEY,
    first_name  VARCHAR2(50)    NOT NULL,
    last_name   VARCHAR2(50)    NOT NULL,
    gender      VARCHAR2(5)     CHECK(gender IN('Man','Woman')),
    birth_day   DATE    DEFAULT SYSDATE,
    email       VARCHAR2(200)   NOT NULL UNIQUE
);
