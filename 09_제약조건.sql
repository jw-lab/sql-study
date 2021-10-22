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


--제약조건 pk fk 기본키 외래키 관계

--부서 테이블 만들기
DROP TABLE 부서;
CREATE TABLE 부서 (
    부서번호    NUMBER(4)CONSTRAINT dept_pk PRIMARY KEY,
    부서이름    VARCHAR2(20)
);
INSERT INTO 부서 VALUES(1,'개발');
SELECT * FROM 부서;


--외래키 (FK) ->자식 테이블에 설정하여 부모 테이블을 참조한다.
--외래키로 참조할 수 있는 부모의 컬럼은 PK,UK만 가능하다
--외래키 문법: FOREIGN KEY(본인 열이름) REFERENCES 참조테이블(참조열) [ON DELETE CASCADE | ON DELETE SET NULL]
DROP TABLE 직원;
CREATE TABLE 직원(
    직원번호    NUMBER(4) PRIMARY KEY,
    이름      VARCHAR2(20),
    월급      NUMBER(10),
    부서번호    NUMBER(4),
    FOREIGN KEY(부서번호) REFERENCES 부서(부서번호) ON DELETE SET NULL
);
--데이터 입력
INSERT INTO 부서 VALUES(1,'개발');
INSERT INTO 부서 VALUES(2,'경영');
INSERT INTO 부서 VALUES(3,'회계');

INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES(100,'홍길동', 150,1);
INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES(110,'펭수', 100,1);
INSERT INTO 직원(직원번호,이름,월급,부서번호) VALUES(120,'라이언', 200,NULL); --외래키는 널값 입력가능
SELECT * FROM 직원;

--삭제시 문제 발생
DELETE FROM 부서 WHERE 부서번호 = 1; --현재 참조하는 외래키 열이 있어서 바로 삭제가 안 됨.즉, 다른 테이블에서 참조중

--외래키 설정을 할 당시 옵션을 부여할 수 있다.
--ON DELETE CASCADE : 부모테이블의 레코드가 삭제되면 그 레코드를 참조하던 자식테이블의 레코드도 같이 삭제
--ON DELETE SET NULL : 부모테이블의 참조받던 레코드 삭제시, 그 레코드를 참조하던 자식테이블의 값을 NULL로 변경해준다


--이미 만들어진 테이블에 제약조건 추가 하는 법(1.테이블 생성 2.제약조건 추가)
--문법 : ALTER TABLE 테이블
--      ADD CONSTRAINT 제약조건 이름 PRIMARY KEY(컬럼이름) | FOREIGN KEY(컬럼이름) | UNIQUE(컬럼이름) | CHECK(조건)
--NOT NULL 제약조건의 경우는 ADD 대신 MODIFY 컬럼 ~을 사용한다
CREATE TABLE 과목(
    과목번호    VARCHAR2(2),
    과목이름    VARCHAR(20)
);

INSERT INTO 과목 VALUES('01','데이터베이스');
INSERT INTO 과목 VALUES('02','프로그래밍');
SELECT * FROM 과목;

CREATE TABLE 학생(
    학번  VARCHAR2(4),
    이름  VARCHAR(50),
    과목번호    VARCHAR2(2)
);

INSERT INTO 학생 VALUES('0414','홍길동','01');
INSERT INTO 학생 VALUES('0415','임꺽정','02');
INSERT INTO 학생 VALUES('0416','이순신','03');
SELECT * FROM 학생;

--1. 과목 테이블부터 제약조건 추가
ALTER TABLE 과목
ADD PRIMARY KEY(과목번호);

--제약조건 조회 (테이블 이름만 수정), ''홑따옴표 안에 넣는다.(대문자로 적는다)
SELECT * 
FROM all_constraints
WHERE table_name='학생';

--과목 테이블 과목 이름열에 유니크 제약조건 추가
ALTER TABLE 과목
ADD UNIQUE(과목이름);

--2. 학생 테이블 제약조건 추가
ALTER TABLE 학생
ADD PRIMARY KEY(학번);

ALTER TABLE 학생
MODIFY 이름 NOT NULL; -- NOT NULL 추가시 MODIFY + 열이름 + NOT NULL

ALTER TABLE 학생
ADD FOREIGN KEY(과목번호) REFERENCES 과목(과목번호); --자식테이블(학생)의 (과목번호)값이 부모 테이블(과목)에 없는 (과목번호)값을 가지고 있어서 에러발생

--학생 테이블 업데이트
UPDATE 학생
SET 과목번호 = '01' --원래는 '03'이어서 에러발생
WHERE "학번"='0416';


--제약조건 삭제
--ALTER TABLE 테이블
--DROP PRIMARY KEY|UNIQUE(컬럼)|CONSTRAINT 제약조건이름 [CASCADE];
--기본키는 테이블에 1개이므로 컬럼명 없이 사용

ALTER TABLE 과목 
DROP PRIMARY KEY; --과목테이블의 기본키인 과목번호 컬럼을 학생테이블의 외래키가 참조중이라 삭제가 안됨
-- CASCADE 옵션으로 외래키의 제약조건도 같이 삭제
ALTER TABLE 과목 
DROP PRIMARY KEY CASCADE;

--제약조건의 이름으로 삭제
ALTER TABLE 과목 
DROP CONSTRAINT SYS_C008116;

--학생 테이블 제약조건 삭제
ALTER TABLE 학생 
DROP CONSTRAINT SYS_C008117;
ALTER TABLE 학생 
DROP CONSTRAINT SYS_C008118;


--테이블에 열을 추가 / 수정 / 삭제
--서브쿼리로 테이블 카피
DROP TABLE 직원;

CREATE TABLE 직원 (직원번호,이름,급여,부서번호)
AS
SELECT employee_id, first_name, salary, department_id FROM employees
WHERE department_id=90; -- 90번 부서의 직원들
SELECT * FROM 직원;

--열을 추가
ALTER TABLE 직원
ADD(성별 VARCHAR2(3));
ALTER TABLE 직원
ADD(커미션 NUMBER DEFAULT 0);

--열을 수정 (데이터 타입을 바꾸거나 용량을 늘릴때)
DESC 직원2;
ALTER TABLE 직원
MODIFY (성별 VARCHAR2(10));

ALTER TABLE 직원
MODIFY (커미션 VARCHAR2(10)); --데이터가 있어서 데이터 타입 변경이 안된다. NULL 일때만 변경 가능
--용량을 늘리는것은 데이터가 있어도 가능
ALTER TABLE 직원
MODIFY (성별 NUMBER);

--열을 삭제 (데이터가 있어도 삭제 된다)
ALTER TABLE 직원
DROP COLUMN 커미션;
ALTER TABLE 직원
DROP COLUMN 성별;

--테이블의 이름 수정
RENAME 직원 TO 직원2;