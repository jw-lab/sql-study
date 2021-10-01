-- 1. 모든 행과 열 조회하기
SELECT * 
FROM departments;

-- 2. 특정 열만 조회하기.
SELECT department_id,department_name 
FROM departments;

-- 3. 별칭 붙이기 (열의 이름)
SELECT department_id 부서번호, department_name 부서이름
FROM departments;

-- 4. 산술 연산자 (+,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
FROM employees;
-- 월급에 100씩 뺀 열을 만들기
SELECT first_name 이름, job_id 직책,salary 월급,salary-100 월급수정
FROM employees;
-- 월급에 10%를 빼기
SELECT first_name 이름, job_id 직책,salary 월급,salary-salary/10 월급수정
FROM employees;

-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT 
    last_name,
    first_name, 
    job_id,
    salary,
    (salary-1000)*0.05 보너스
FROM employees;

--distinct : 중복 값을 제거 !
SELECT DISTINCT job_id
FROM employees;

-- 예제 1
SELECT employee_id,first_name,last_name
FROM employees;

-- 예제 2
SELECT first_name,salary,salary*1.1 뉴셀러리
FROM employees;

-- 예제 3
SELECT employee_id 사원번호,first_name 이름,last_name 성
FROM employees; 

-- 연결 연산자 || : 열을 붙여서 하나의 열로 출력
SELECT LAST_NAME || ' is a ' || JOB_ID as 직업정보
FROM EMPLOYEES;

-- 예제 4 : 이름을 한칸 띄우고 붙여서 열, email에 문자열 붙여서 출력
SELECT 
    employee_id,
    first_name || ' ' || last_name full_name,
    email || '@company.com' email
FROM EMPLOYEES;

--DESC : DESCRIBE로 열의 정보를 알 수 있다.
--number(숫자갯수,소수점자리)/varchar2/date
DESC EMPLOYEES;
DESC DEPARTMENTS;

