-- 그룹함수 (다중행 함수, 집계함수)
SELECT ROUND(AVG(salary)) 평균값, MAX(salary) 최대값, MIN(salary) 최소값, SUM(salary) 합계, COUNT(salary) 카운트
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*)
FROM employees;


SELECT COUNT(*)
FROM employees
WHERE department_id =80; --80번 부서의 직원들

-- 그룹함수에서는 널값을 제외하고 계산한다. (예외 COUNT(*) )
SELECT COUNT(department_id)
FROM employees; --1명이 부서가 없음

SELECT COUNT(DISTINCT department_id)
FROM employees; --중복되지 않는 부서의 갯수

SELECT AVG(commission_pct)
FROM employees; --널값은 제외한 모든 직원들의 커미션 평균

-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY department_id; --부서번호로 그룹 나눔

SELECT *
FROM employees
WHERE department_id IS NULL; --부서가 없는 사람

--예제1
SELECT department_id 부서명, COUNT(department_id) 사원수, MAX(salary) 최대급여,MIN(salary) 최소급여,SUM(salary) 급여합계,ROUND(AVG(salary))평균급여
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;

--예제2
SELECT department_id 부서번호, job_id 직업, manager_id 상사번호,SUM(salary) 월급합계, COUNT(department_id) 직원수 
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY department_id;

--예제3
SELECT AVG(MAX(salary)),AVG(MIN(salary))
FROM employees
GROUP BY department_id;

---HAVING 절: GROUP BY절의 조건비교시 사용
SELECT department_id 부서명,COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;

--예제1
SELECT job_id, SUM( salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary)> 10000 AND job_id != 'AC_MCR'
ORDER BY SUM( salary) DESC;

--예제2
SELECT department_id, ROUND(AVG(salary))
FROM employees
GROUP BY department_id
HAVING department_id != 40 AND AVG(salary)<=7000;

--예제3
SELECT job_id, SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(salary)>=13000 AND job_id NOT LIKE '%REP%'
ORDER BY SUM(salary) DESC;