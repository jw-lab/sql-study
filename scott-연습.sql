--연습1 : 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

--연습2 : 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라.
SELECT ename,hiredate,deptno
FROM emp
WHERE empno = 7369;

--연습3 : 이름이 ALLEN인 사람의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE ename = 'ALLEN';

--연습4 : 입사일이 81/02/20인 사원의 이름,부서번호,월급을 출력하라.
SELECT ename,deptno,sal
FROM emp
WHERE hiredate = '81/02/20';

--연습5 : 직업이 MANAGER가 아닌 사람의 정보 출력
SELECT *
FROM emp
WHERE job != 'MANAGER';

--연습6: 입사일이 81/04/02 이후에 입사한 사원의 정보 출력
SELECT *
FROM EMP
WHERE hiredate >= '81/04/02';

--연습7: 급여가 $800이상인 사람의 이름,급여,부서번호 출력
SELECT ename,sal,deptno
FROM EMP
WHERE sal >= 800;

--연습8: 부서번호가 20번 이상인 사원의 정보출력
SELECT *
FROM EMP
WHERE deptno >=20;

--연습9: 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 정보를 출력
SELECT *
FROM EMP
WHERE ename >= 'L'; --K 다음 알파벳 이상이면 된다

--연습10: 입사일이 81/12/09보다 먼저 입사한 사람들의 정보 출력
SELECT *
FROM EMP
WHERE hiredate < '81/12/09';


--연습11: 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력
SELECT empno,ename
FROM EMP
WHERE empno <= 7698;

--연습12: 입사일이 81/04/02보다 같거나 늦고 82/12/09보다 같거나 빠른 사원의 이름,월급,부서번호 출력
SELECT ename,sal,deptno
FROM EMP
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--연습13: 급여가 $1600 보다 크고 $3000보다 작은 직원의 이름,직업,급여를 출력하라
SELECT ename,job,sal
FROM EMP
WHERE SAL > 1600 AND SAL < 3000;

--연습14: 직원번호가 7654와 7782 사이가 아닌 직원의 모든 정보를 출력하라.
SELECT *
FROM EMP
WHERE empno NOT BETWEEN 7654 AND 7782;

--연습15 : 이름이 B와 J 사이의 모든 직원의 정보를 출력하라
SELECT *
FROM EMP
WHERE ename BETWEEN 'B' AND 'J';

--연습16: 입사일이 81년이 아닌 모든 직원의 정보 출력
SELECT *
FROM EMP
WHERE hiredate NOT LIKE '81%';

--연습17 : 직업이 MANAGER이거나 SALESMAN인 직원의 정보 출력
SELECT *
FROM EMP
WHERE job IN ('MANAGER','SALESMAN');

--연습18: 부서번호가 20,30번을 제외한 모든 직원의 이름,사원번호,부서번호 출력
SELECT ename,empno,deptno
FROM EMP
WHERE deptno NOT IN(20,30);

--연습19: 이름이 S로 시작하는 직원의 사원번호,이름,입사일,부서번호 출력
SELECT empno,ename,hiredate,deptno
FROM EMP
WHERE ename LIKE 'S%';

--연습20: 입사일이 81년도인 사람의 모든 정보를 출력하라
SELECT *
FROM EMP
WHERE TO_CHAR(hiredate,'YYYY') = '1981'; 
--WHERE hiredate LIKE '81%';

--연습21 : 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력
SELECT *
FROM EMP
WHERE ename LIKE '%S%';

--연습22: 이름이 M으로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력, 이름은 전체 6자리로 _ 를 이용한다
SELECT *
FROM EMP
WHERE ename LIKE 'M____N';

--연습23: 이름이 첫 번째 문자는 관계없고 두 번째 문자가 A인 사람의 정보를 출력하라
SELECT *
FROM EMP
WHERE ename LIKE '_A%';

--연습24: 커미션이 NULL인 사람의 정보를 출력하라(IS NULL, IS NOT NULL 사용)
SELECT *
FROM EMP
WHERE comm IS NULL;

--연습25: 커미션이 NULL이 아닌 사람의 정보를 출력하라(IS NULL, IS NOT NULL 사용)
SELECT *
FROM EMP
WHERE comm IS NOT NULL;

--연습26: 부서가 30번 부서이고 급여가 $1500 이상인 사람의 이름,부서,월급 출력
SELECT ename,deptno,sal
FROM EMP
WHERE deptno = 30 AND sal >=1500;

--연습27: 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호,이름,부서번호 출력
SELECT empno,ename,deptno
FROM EMP
WHERE ename LIKE 'K%' OR deptno =30;

--연습28: 급여가 $1500 이상이고 부서번호가 30인 사원 중 직업이 MANAGER인 사람의 정보 출력
SELECT *
FROM EMP
WHERE sal>=1500 AND deptno=30 AND job = 'MANAGER';

--연습29: 부서번호가 30인 사람의 모든 정보 출력/ 직원번호로 정렬
SELECT *
FROM EMP
WHERE deptno =30
ORDER BY empno;

--연습30: 직원들의 급여가 많은 순으로 정렬
SELECT *
FROM EMP
ORDER BY SAL DESC;

--연습31: 부서번호로 ASCENDING SORT 한 후 급여가 많은 사람 순으로 출력(한개 이상의 열로 정렬시 콤마를 사용한다)
SELECT *
FROM EMP
ORDER BY deptno,sal DESC;

--연습32: 부서번호로 DESC SORT하고 이름순으로 ASC SORT ,급여 순으로 DESC SORT 한다
SELECT deptno,ename,sal
FROM EMP
ORDER BY deptno DESC,ename,sal DESC;

--연습33: 10번부서의 모든 직원에게 급여의 13%를 보너스로 지급, 이름,급여,보너스금액,부서번호 출력(소수점은 반올림)
SELECT ename,sal, ROUND(sal*0.13)BONUS, deptno
FROM EMP
WHERE deptno=10;

--연습34: 직원의 이름,급여,커미션,총액(급여+커미션)을 구하여 총액이 많은 순서로 출력(단, 커미션이 NULL인 사원도 0으로 해서 포함)
SELECT ename,sal,NVL(comm,0),sal+NVL(comm,0) TOTAL
FROM EMP
ORDER BY sal+NVL(comm,0) DESC;

--연습35: 급여가 $1500부터 $3000사이 사원에 대해서 급여의 15%를 회비로 지불/ 이름,급여,회비(소수이하2자리 반올림,$표시)
SELECT ename,sal,TO_CHAR(ROUND(sal*0.15,1),'$999.9') 회비
FROM EMP
WHERE sal BETWEEN 1500 AND 3000;

--연습36: 사원수가 5명이 넘는 부서의 부서명과 사원수 조회(조인필요)
SELECT d.dname,COUNT(E.EMPNO)
FROM EMP e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(E.EMPNO)>5;

--연습37: 직업별 급여합계가 5000을 초과하는 각 직무에 대해서 급여 합계를 조회, 단 SALESMAN은 제외
SELECT job,SUM(sal)
FROM EMP
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000;

--연습38: 사원들의 사원번호,사원명,급여,급여등급을 출력/ 테이블 SALGRADE 조인
SELECT empno,ename,sal, s.grade
FROM EMP e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

--연습39: 부서별로 사원의 수와 커미션을 받은 사원의 수를 출력
SELECT deptno,COUNT(*) 사원수, COUNT(comm) "커미션 받은 사원수"
FROM EMP
GROUP BY deptno;

--연습40: 부서번호가 10은 총무부, 20은 개발부, 30은 영업부라고 하여 이름,부서번호,부서명 순으로 출력(DECODE나 CASE함수 사용)
SELECT ename,deptno,
    CASE deptno WHEN 10 THEN '총무부'
                WHEN 20 THEN '개발부'
                WHEN 30 THEN '영업부'
    END 부서명
FROM EMP;
