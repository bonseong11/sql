SELECT
    DECODE(deptno, 
                10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS','DDIT') sal_bonus_decode , MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), count(sal), count(mgr), count(*)
FROM emp
GROUP BY deptno;

grp3

emp 테이블을 이용하여 다음을 구하시오
grp2에서 작성한 쿼리를 활용하여 deptno 대신 부서명이 나올수 있도록 수정하시오.

SELECT
    DECODE(deptno, 
                10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS','DDIT') sal_bonus_decode , MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), count(sal), count(mgr), count(*)
FROM emp
GROUP BY deptno;

grp4
emp 테이블을 이용하여 다음을 구하시오
직원의 입사 년월별로 몇명의 직원이 입사했는지 조회하는 쿼리를 작성하세요.

SELECT TO_CHAR(hiredate, 'YYYYMM') hire_yyyymm, COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYYMM');

grp5
emp 테이블을 이용하여 다음을 구하시오
직원의 입사 년별로 몇명의 직원이 입사했는지 조회하는 쿼리를 작성하세요.
--COUNT는 그룹바이 되어 있는 거중에 몇개인지 
SELECT TO_CHAR(hiredate, 'YYYY') hire_yyyymm, COUNT(*) CNT 
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY');

SELECT COUNT(*)
FROM dept;

직원이 속한 부서의 개수를 조회하는 쿼리를 작성하시오 (emp 테이블 사용)
-- 인라인을 사용해서 3개 행이 조회되는 것을 만들고 바깥쪽에 SELECT에 COUNT를 해서 행을 세준다 그럼 3개가 조회됨
SELECT COUNT(*) CNT  
FROM
(SELECT deptno
FROM emp
GROUP BY deptno);



JOIN
RDBMS는 중복을 최소화 하는 형태의 데이터 베이스 
다른 테이블과 결합하여 데이터를 조회

데이터를 확장(결합)
1. 컬럼에 대한 확장 : JOIN
2. 행에 대한 확장 : 집한연산자(UNION ALL, UNION(합집합), MINUS(차집합), INTERSECT(교집합)

JOIN
중복을 최소화 하는 RDBMS 방식으로 설계한 경우

EMP 테이블에서 부서코드만 존재 (KEY)
부서정보를 담은 dept 테이블 별도로 생성

emp 테이블과 dept테이블의 연결고리 (deptno)로 조인하여 실제 부서명을 조회한다.

join 
1. 표준 SQL => ANSI SQL
2. 비표준 SQL - DBMS를 만드는 회사에서 만든 고유의 SQL 문법

ANSI : SQL
ORACLE : SQL

ANSI - NATURAL JOIN
.조인하고자 하는 테이블의 연결 컬럼 명(타입도 동일)이 동일한 경우 (emp.deptno , dept.deptno)
.연결 컬럼의 값이 동일할 때 (=) 컬럼이 확장된다

SELECT ename, dname
FROM emp NATURAL JOIN dept;

--NATURAL 은 한정자를 쓰지 않는다. 
SELECT emp.ename, emp.empno 
FROM emp NATURAL JOIN dept;

ORACLE join :
1. FROM절에 조인할 테이블을 (,)콤마로 구분하여 나열
2. WHERE : 조인할 테이블의 연결조건을 기술

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

7369 SMITH, 7902 FORD 스미스의 상사가 누구인지 알고싶다.
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno; --사원의 매니저가 사원의 empno번호를 연결한다 이럴때 테이블 별칭을 써야된다
                        --null값은 연결이안됨
                        
SELECT *
FROM emp;

ANSI SQL  : JOIN WITH USING
조인 하려고 하는 테이블의 컬럼명과 타입이 같은 컬럼이 두개 이상인 상황에서
두 컬럼을 모두 조인 조건으로 참여시키지 않고, 개발자가 원하는 특정 컬럼으로만 연결을 시키고 싶을 때 사용

SELECT *
FROM emp JOIN dept USING(deptno); --ansi는 조인 하려고하는 컬럼명에 별칭을 넣어도 실행되지 않음

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

JOIN WITH ON  : NATURAL JOIN, JOIN WITH USING을 대체할 수 있는 보편적인 문법
조인 컬럼 조건을 개발자가 임의로 지정

-- emp.deptno 랑 dept.deptno은 같고 이것을 emp dept를 연결해서 출력해라.
SELECT *
FROM emp JOIN dept ON (emp.deptno = dept.deptno) ;

사원 번호, 사원 이름, 해당사원의 상사 사번, 해당사원의 상사 이름 : join with on 을 이용하여 사용
단 사원의 번호가 7369에서 7698인 사원들만 조회
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)   -- WHERE e.mgr = m.empno
WHERE e.empno BETWEEN 7369 AND 7698;

오라클로 바꾸면


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e , emp m 
WHERE e.mgr = m.empno
    AND e.empno BETWEEN 7369 AND 7698;

논리적인 조인 형태
1. SELF JOIN : 조인 테이블이 같은 경우
    -계층구조
2. NONEQUI-JOIN : 조인 조건이  = (equals)가 아닌 조인

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno; --연결 조건이다. 두개의 컬럼이 같을 때다.

SELECT *
FROM emp, dept
WHERE emp.deptno != dept.deptno; --emp 부서번호랑 dept 부서번호가 다를때 연결해라 스미스가 3건으로 연결 한사원은 3개의 부서와 연결됨


SELECT *
FROM salgrade;

--salgrade를 이용하여 직원의 급여 등급 구하기
-- empno, ename, sal,  급여등급
-- emp.sal >= salgrade.losal AND emp.sal <= salgrade.hisal
-- emp.sal BETWEEN salgrade losal AND salgrad hisal
SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e , salgrade s
WHERE e.sal BETWEEN s.losal AND s. hisal;

ANSI

SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s. hisal);

JOIN실습0
emp, dept 테이블을 이용하여 다음과 같이 조회되도록 쿼리를 작성하세요

SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

join0_1
emp dept 테이블을 이용하여 다음과 같이 조회되도록 쿼리를 작성하세요
10,30 만 조회되게
SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.deptno IN (10, 30);

--JOIN0_2
--emp, dept 테이블을 이용하여 다음과 같이 조회되도록 쿼리를 작성하세요
--(급여가 2500 초과)

SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.sal > 2500;

--join0_3
--emp,dept 테이블을 이용하여 다음과 같이 조회되도록 쿼리를 작성하세요
--(급여 2500 초과, 사번이 7600 보다 큰 직원)

SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.sal > 2500
    AND e.empno > 7600;

--join0_4
--emp dept 테이블을 이용하여 다음과 같이 조회되도록 쿼리를 작성하세요
--(급여 2500 초과, 사번이 7600 보다 큰 직원, RESEARCH 부서에 속하는 직원)
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.sal > 2500
    AND e.empno > 7600
    AND d.dname = 'RESEARCH';





