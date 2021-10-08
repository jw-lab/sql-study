--DDL 테이블 생성 수정 삭제

--테이블 생성
CREATE TABLE 테스트 (
    문자열 VARCHAR2(100),
    숫자  NUMBER,
    날짜  DATE DEFAULT SYSDATE 
);

--테이블 삭제
DROP TABLE 테스트;

DESC 테스트;
SELECT * FROM 테스트;
--데이터 입력
INSERT INTO 테스트 VALUES('HTML',5,'2021-10-8');
INSERT INTO 테스트 VALUES('CSS',3,SYSDATE);
INSERT INTO 테스트(문자열,숫자) VALUES('자바',7);

--기존 테이블 복사해서 만드는 방법
--열 구조만 복사
CREATE TABLE EMP_TEMP 
AS
SELECT * FROM EMPLOYEES WHERE 1 != 1; --1과 1을 다르다는 조건으로 데이터는 안 가져오고 열만 복사

SELECT *
FROM EMP_TEMP;

DESC EMP_TEMP;

-- 80번 부서의 직원들만 따로 테이블 생성
CREATE TABLE EMP80
AS
SELECT employee_id 직원번호, last_name 이름, salary 월급,salary*12 연봉, hire_date 고용일  
FROM EMPLOYEES WHERE department_id= 80;

DESC emp80;
SELECT *
FROM emp80;

--예제
CREATE TABLE stmans
AS
SELECT employee_id id,job_id job,salary sal
FROM employees
WHERE job_id = 'ST_MAN';

select * from stmans;

--예제
CREATE TABLE sample_product(
    product_id      NUMBER,
    product_name    VARCHAR2(20),
    menu_date       DATE
);

DROP TABLE sample_product;
desc sample_product;