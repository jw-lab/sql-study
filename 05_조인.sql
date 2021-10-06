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