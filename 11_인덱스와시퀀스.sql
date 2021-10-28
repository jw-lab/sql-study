--인덱스
--검색속도 향상을 위해 기존 테이블에서 특정 컬럼을 색인화(따로 파일로 저장)하여 검색시 기존 테이블을 풀 스캔하지 않고 색인화 되어있는 인덱스 파일을 검색  
--단점: 레코드가 업데이트될 때 마다 인덱스 파일도 업데이트해야 하므로 레코드 업데이트, 추가,삭제시 성능이 떨어진다. 또한,인덱스 파일의 공간이 추가적으로 필요하다

--인덱스 조회하기
SELECT *
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS';--PK,UK는 자동으로 인덱스 생성

--새 테이블 만들기
DROP TABLE members;
CREATE TABLE members(
    member_id   NUMBER  PRIMARY KEY,
    first_name  VARCHAR2(100) NOT NULL,
    last_name  VARCHAR2(100) NOT NULL,
    gender  VARCHAR2(1) NOT NULL,
    dob DATE NOT NULL,
    email   VARCHAR2(255)   NOT NULL
);
SELECT * FROM MEMBERS ORDER BY member_id;

--일반 열 검색하기: 이름이 하스인 사람
SELECT * FROM MEMBERS WHERE last_name='Harse';

--아래의 쿼리문의 실행보고서를 작성한다
EXPLAIN PLAN FOR
SELECT * FROM MEMBERS WHERE last_name='Harse';

--저장된 실행보고서를 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

--인덱스 만들기
CREATE INDEX members_last_name_i ON members(last_name);

--인덱스 삭제
DROP INDEX members_last_name_i;

--멀티 인덱스 만들기
CREATE INDEX members_name_i ON members(first_name,last_name);--같은 이름의 인덱스가 2개 생성

SELECT *
FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';

--실행보고서 작성
EXPLAIN PLAN FOR
SELECT *
FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';
--저장된 실행보고서 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());


--시퀀스 : 유일(중복이 안 되는)값을 생성/자동으로 순차적 증가/보통 PRIMARY KEY(ID) 값을 생성하기 위해 사용/테이블과는 독립적으로 저장되고 생성된다.
CREATE SEQUENCE 시퀀스1; --생성
DROP SEQUENCE 시퀀스1; --삭제

SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스1';

--시퀀스 테스트 (이름.NEXTVAL => 실행하면 값이 증가)
SELECT 시퀀스1.NEXTVAL FROM DUAL;


CREATE TABLE 부서_테스트 (
    부서번호    NUMBER PRIMARY KEY,
    부서이름    VARCHAR2(100)
);

INSERT INTO 부서_테스트(부서번호,부서이름) VALUES(시퀀스1.NEXTVAL,'영업부');
INSERT INTO 부서_테스트(부서번호,부서이름) VALUES(시퀀스1.NEXTVAL,'개발부');

SELECT * FROM 부서_테스트;

--시퀀스의 값은 증가시키지 않고 현재 값을 알고 싶을때 (이름.CURRVAL)
SELECT 시퀀스1.CURRVAL FROM DUAL;

--시퀀스 옵션 시작값 10 부터 증가는 20
DROP SEQUENCE 시퀀스2;
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 20;
--시퀀스 확인
SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스2';

--입력
INSERT INTO 부서_테스트(부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'마케팅부');
INSERT INTO 부서_테스트(부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'교육부');
INSERT INTO 부서_테스트(부서번호,부서이름) VALUES(시퀀스2.NEXTVAL,'경영부');
SELECT * FROM 부서_테스트 ORDER BY 부서번호;


--시퀀스로 전체 번호 업데이트
UPDATE 부서_테스트
SET 부서번호=시퀀스2.NEXTVAL;

--시퀀스 수정 :START WITH를 제외하고 수정가능
--시퀀스2의 증가값을 2로 수정
ALTER SEQUENCE 시퀀스2
INCREMENT BY 2;

DROP SEQUENCE 시퀀스2;
