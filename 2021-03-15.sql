2021-03-12 복습
조건에 맞는 데이터 조회 : where 절 - ; 기술한 조건을 참(TRUE)으로 만족하는 행들만 조회한다(FILTER);


--row : 14개 ,  col : 8개
SELECT *
FROM emp
WHERE 1 = 1;

SELECT *
FROM emp
WHERE deptno = 30;

SELECT *
FROM emp
WHERE deptno = deptno;


int a = 20;
String a = "20";
'20';

SELECT table_name
FROM user_tables;

SELECT 'SELECT * FROM ' || table_name || ';' AS HELLO
FROM user_tables;

TO_DATE('81/03/01', 'YY/MM/DD');

--입사일자가 1982년 1월 1일 이후인 모든 직원 조회 하는 SELECT 쿼리를 작성하세요
30 > 20 : 숫자 > 숫자
날짜 > 날짜 
2021-03-15 > 2021-03-12

SELECT * 
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01', 'YYYY/MM/DD');

SELECT * 
FROM emp
WHERE hiredate >= TO_DATE('19820101', 'YYYYMMDD');

SELECT * 
FROM emp
WHERE hiredate >= TO_DATE('1982-01-01', 'YYYY-MM-DD');


WHERE절에서 사용 가능한 연산자
(비교 ( =, !=, >, <.....)
a + b;
a++ ==> a = a + 1;
++a ==> a = a + 1;

비교대상 BETWEEN 비교대상의 허용 시작값 AND 비교대상의 허용 종료값
ex : 부서번호가 10번에서 20번 사이의 속한 직워들만 조회
SELECT *
FROM emp
WHERE deptno BETWEEN 10 AND 20;

emp 테이블에서 급여(sal)가 1000보다 크거나 같고 2000보다 작거나 같은 직원들만 조회
    sal >= 1000
    sal <= 2000
    
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;
--위와 같은 조건
SELECT *
FROM emp
WHERE sal >= 1000 
  AND sal <= 2000
  AND deptno = 10;

true AND true ==> true
true AND false ==> false

true OR false ==> true

--조건에 맞는 데이터 조회하기 (BETWEEN ... AND ... 실습 WHERE1)
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('1982/01/01', 'YYYY/MM/DD') AND TO_DATE('1983/01/01', 'YYYY/MM/DD');

--where2 위와 같은 방법이지만 정답은 없음 비교연산자는 초과 미만의 개념을 적용할때 사용하는게 적합해보임
SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01', 'YYYY/MM/DD') 
AND   hiredate <= TO_DATE('1983/01/01', 'YYYY/MM/DD');


BETWEEN AND : 포함(이상, 이하) 
              초과 미만의 개념을 적용하려면 비교연산자를 사용해야 한다.

IN 연산자
대상자 IN (대상자와 비교할 값1, 대상자와 비교할 값2, 대상자와 비교할 값3....)
deptno IN (10, 20) ==> deptno값이 10이나 20번이면 TRUE;

SELECT *
FROM emp
WHERE deptno IN (10, 20);
-- 위와 같음
SELECT *
FROM emp
WHERE deptno = 10
   OR deptno = 20;

SELECT *
FROM emp
WHERE 10 IN (10, 20);

10은 10과 같거나 10은 20과 같다 
TRUE     OR     FALSE ==> TRUE

--조건에 맞는 데이터 조회하기 (IN 실습 WHERE3)
--users 테이블에서 userid가 brown, cony, sally인 데이터를 다음과 같이 조회 하시오 (IN 연산자 사용)

SELECT userid AS 아이디, usernm AS 이름, alias AS 별명
FROM users
WHERE userid IN ('brown', 'cony', 'sally');
--위와 같은 방법임
SELECT userid AS 아이디, usernm AS 이름, alias AS 별명
FROM users
WHERE userid = 'brown' 
   OR userid = 'cony'
   OR userid = 'sally';

LIKE 연산자 : 문자열 매칭 조회
게시글 : 제목 검색, 내용 검색
        제목에 (맥북에어)가 들어가는 게시글만 조회
        
        1. 얼마 안된 맥북에어 팔아요
        2. 맥북에어 팔아요
        3. 팝니다 맥북에어
테이블: 게시글
제목 컬럼 : 제목
내용 컬럼 : 내용
SELECT *
FROM 게시글
WHERE 제목 LIKE '%맥북에어%'
   OR  내용 LIKE '%맥북에어%';
   제목          내용 
   1       ||    2
   TRUE    OR    TRUE    TRUE
   TRUE    OR    FALSE   TRUE
   FALSE   OR    TRUE    TRUE
   FALSE   OR    FALSE   FALSE
   제목          내용 
   1       &&    2
   TRUE    AND   TRUE    TRUE
   TRUE    AND   FALSE   FALSE 
   FALSE   AND   TRUE    FALSE 
   FALSE   AND   FALSE   FALSE   
   
   
   
% : 0개 이상의 문자
_ : 1개의 문자
c????????

SELECT *
FROM users
WHERE userid LIKE 'c%';

userid가 c로 시작하면서 c 이후에 3개의 글자가 오는 사용자
SELECT *
FROM users
WHERE userid LIKE 'c___';
--userid에 l(알파벳 엘)이 들어가는 모든 사용자 조회
--앞뒤로 l이 문자가 있을수도 있고 없을수도 있고
SELECT *
FROM users
WHERE userid Like '%l%';

--조건에 맞는 데이터 조회하기 (LIKE,  %,_ 실습 WHERE4)
--member 테이블에서 회원의 성이 [신]씨인 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오

SELECT mem_id, mem_name
FROM member
WHERE mem_name Like '신%';

--조건에 맞는 데이터 조회하기 (LIKE,%,_ 실습 WHERE5)
--member 테이블에서 회원의 이름에 글자[이]가 들어가는 모든 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오
SELECT mem_id, mem_name
FROM member
WHERE mem_name Like '%이%';

IS (NULL 비교)
emp 테이블에서 comm 컬럼의 값이 NULL인 사람만 조회
SELECT *
FROM emp
WHERE comm IS NULL;

IS NOT(NULL 비교 널이아닌 값 조회할때)
SELECT *
FROM emp
WHERE comm IS NOT NULL;

emp 테이블에서 매니저가 없는 직원만 조회
SELECT *
FROM emp
WHERE MGR IS NULL;

BETWEEN AND, IN, LIKE, IS

논리 연산자 : AND, OR, NOT
AND : 두가지 조건을 동시에 만족시키는지 확인할 때
      조건1 AND 조건2
OR  : 두가지 조건중 하나라도 만족시키는지 확인할 때
      조건1 OR 조건2
NOT : 부정형 논리연산자, 특정 조건을 부정
      mgr IS NULL : mgr 컬럼의 값이 NULL인 사람만 조회
      mgr IS NOT NULL : mgr 컬럼의 값이 NULL이 아닌 사람만 조회
      
emp 테이블에서 mgr의 사번이 7698이면서 sal값이 1000보다 큰 직원만 조회

SELECT *
FROM emp
WHERE mgr = 7698
    AND   sal > 1000;
    
--조건의 순서는 결과와 무관하다.

SELECT *
FROM emp
WHERE sal > 1000
    AND mgr = 7698;
-- sal 컬럼의 값이 1000보다 크거나 mgr의 사번이 7698인 직원조회 (두개조건중 하나만 만족해도 출력)   
SELECT *
FROM emp
WHERE sal > 1000
    OR mgr = 7698;

AND 조건이 많아지면 : 조회되는 데이터 건수는 줄어든다
OR 조건이 많아지면 : 조회되는 데이터 건수는 많아진다

NOT : 부정형 연산자, 다른 연산자와 결합하여 쓰인다.
        IS NOT, NOT IN, NOT LIKE
--직원의 부서번호가 30번이 아닌 직원들
SELECT *
FROM emp
WHERE deptno != 30;
--위랑 같은 방법임
SELECT *
FROM emp
WHERE deptno NOT IN (30);

NOT IN 연산자 사용시 주의점 중요함 : 비교값중에 NULL이 포함되면 *************
                                    데이터가 조회되지 않는다. (NULL이 안나왔음 IN연산자는 OR랑 같아서)
SELECT *
FROM emp
WHERE mgr IN (7698, 7839, NULL);
==> 7698 이거나 7839이거나 NULL이거나 **중요
mgr = 7698 OR mgr = 7839 OR mgr = NULL

-- 7698 이 아니면서 7839가 아니면서 NULL이 아니여야됨
SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839, NULL);
!(mgr = 7698 OR mgr = 7839 OR mgr = NULL)
==> mgr != 7698 OR mgr != 7839 OR mgr != NULL 시험을 냄 
    !=NULL 때문에 TURE FALSE 의미가 없음 AND FALSE
-- mgr = 7698 ==> mgr != 7698
-- OR         ==> AND

--조건에 맞는 데이터 조회하기 (IS NULL 실습 WHERE6)
--emp 테이블에서 상여(comm)가 있는 회원의 정보를 다음과 같이 조회되도록 쿼리를 작성하시오
SELECT *
FROM emp
WHERE comm IS NULL;

--논리연산 (AND OR 실습 WHERE7)
--emp 테이블에서 job이 SALESMAN 이고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회 하세요.

SELECT *
FROM emp
WHERE job = 'SALESMAN' AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

--논리연산 (AND OR 실습 WHERE8)
--emp 테이블에서 부서번호가 10번이 아니고 입사일자가 1981년 6월 이후인 직원의 정보를 다음과 같이 조회 하세요
--(IN, NOT IN 연산자 사용금지)

SELECT *
FROM emp
WHERE deptno != 10 -- deptno NOT IN (10) NOT인 연산자사용하면 저것으로 해주세요
  AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');
  
--논리연산 (AND, OR 실습 WHERE10)
--emp 테이블에서 부서번호가 10번이 아니고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회하세요
--(부서는 10, 20, 30 만 있다고 가정하고 IN 연산자를 사용)

SELECT *
FROM emp
WHERE deptno in (20,30) -- deptno NOT IN (10)
    AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

--논리연산 (AND OR 실습 WHERE11)
--emp 테이블에서 job이 SALESMAN이거나 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회 하세요
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');
    
WHERE 12] 풀면 좋고, 못풀어도 괜찮은 문제
--emp 테이블에서 job이 SALESMAN이거나 사원번호가 78로 시작하는 직원의 정보를 다음과 같이 조회 하세요.
--empno는 숫자인데 문자열로 수정해서 78로 간다
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno LIKE '78%';
WHERE 13] 풀면 좋고, 못풀어도 괜찮은 문제
--emp 테이블에서 job이 SALESMAN이거나 사원번호가 78로 시작하는 직원의 정보를 다음과 같이 조회 하세요.
--[LIKE 사용 X]
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno BETWEEN 7800 AND 7899;
    
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno in (7499, 7521, 7654, 7839, 7844, 7876);



