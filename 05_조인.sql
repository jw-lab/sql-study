-- 조인(JOIN)

--ON 을 사용한 기본 조인
SELECT e.employee_id 직원번호, e.last_name 성, e.department_id 부서번호, d.department_name 부서명
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;
    
--where 절을 사용한 예전 조인방법
SELECT e.employee_id 직원번호, e.last_name 성, e.department_id 부서번호, d.department_name 부서명
FROM employees e , departments d
WHERE e.department_id = d.department_id;

--3개 테이블 직원 부서 로케이션 테이블 조인하기
SELECT e.employee_id 직원번호, d.department_name 부서이름,l.city 도시
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;

--예제
SELECT d.department_name 부서명 ,l.city 도시, c.country_name 국가
FROM departments d 
JOIN locations l ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id
WHERE l.city IN ('Seattle','London') AND c.country_name LIKE 'United%';


--셀프조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

--외부 조인
--기본조인
SELECT e.last_name,d.department_id,d.department_name
FROM employees e JOIN departments d ON e.department_id=d.department_id;

--LEFT OUTER JOIN
SELECT e.last_name,d.department_id,d.department_name
FROM employees e LEFT OUTER JOIN departments d ON e.department_id=d.department_id; --부서번호가 NULL(왼쪽만 있는 부서번호)인 레코드도 출력

--RIGHT OUTER JOIN
SELECT e.last_name,d.department_id,d.department_name
FROM employees e RIGHT OUTER JOIN departments d ON e.department_id=d.department_id; --부서번호가 일치하지 않는(오른쪽만 있는 부서번호) 레코드도 출력

--FULL OUTER JOIN
SELECT e.last_name,d.department_id,d.department_name
FROM employees e FULL OUTER JOIN departments d ON e.department_id=d.department_id; --왼쪽만 있는 것과 오른쪽만 있는 것 모두 출력

--예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries c LEFT OUTER JOIN locations l ON l.country_id = c.country_id
ORDER BY l.location_id DESC;

--CROSS JOIN 예제
SELECT *
FROM countries CROSS JOIN regions;