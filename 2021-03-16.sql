AND가 OR보다 우선순위가 높다
==>헷갈리면 ()를 사용하여 우선순위를 조정하자.

직원의 이름이 ALLEN이면서 JOB이 SALESMAN거나 이름이 SMITH인 직원을 조회

SELECT *
FROM emp
WHERE ename='SMITH' OR ename='ALLEN' AND job='SALESMAN';


직원의 이름이 allen이거나 smith이면서 
job이 salesmana인 직원을 조회

SELECT *
FROM emp
WHERE (ename='SMITH' OR ename='ALLEN') AND job='SALESMAN';

[WHERE 실습 14]
EMP테이블에서
1.JOB이 SALESMAN이거나 
2. 사원번호가 78로 시작하면서 입사일자가 1981년 6월 1일 이후인 
직원의 정보를 조회하세요

SELECT *
FROM emp
WHERE job ='SALESMAN' OR empno LIKE '78%' AND hiredate >= TO_DATE('19810601', 'YYYYMMDD'); --AND가 우선순위가 된다.


--데이터정렬
--TABLE 객체에는 데이터를 저장/조회시 순서를 보장하지 않음
--보편적으로 데이터가 입력된 순서대로 조회됨
--데이터가 항상 동일한 순서로 조회되는 것을 보장하지 않는다
--데이터가 삭제되고, 다른 데이터가 들어 올 수도 있음
데이터정렬 (ORDER BY) 중요하다
ORDER BY
ASC : 오름차순 (기본)
DESC : 내림차순

ORDER BY {정렬기준 컬럼 OR ALIAS OR 컬럼번호}[ASC

데이터정렬이 필요한 이유
1. TABLE 객체는 순서를 보장하지 않는다
==> 오늘 실행한 쿼리를 내일 실행할 경우 동일한 순서로 조회가 되지 않을 수도 있다.
2. 실생활에서 필요하니까
==> 게시판의 게시글은 보편적으로 가장 최신글이 처음에 나오고, 가장 오래된 글이 맨 밑에 있다.
                                            
SQL 에서 정렬 : ORDER BY ==> SELECT->FROM->[WHERE](있을수도 없을수도있다)->ORDER BY

SELECT *
FROM emp
ORDER BY ename DESC;
A-> B -> C -> [D] -> Z
1-> 2-> ..... -> 100 : 오름차순 (ASC => DEFAULT)//자동으로 기본값으로 실행됨
100 -> 99 .... -> 1 : 내림차순 (DESC => 명시)//자동이 아니라서 코드 넣어줘야됨

SELECT *
FROM emp
ORDER BY job DESC, sal ASC, ename;

정렬 : 컬럼명이 아니라 select 절의 컬럼 순서(index)
SELECT *
FROM emp
ORDER BY 2; //두번째 컬럼으로 정렬해라

SELECT empno, job, mgr
FROM emp
ORDER BY 2; //이렇게되면 인덱스가 JOB으로 바껴서 나옴 


SELECT empno, job, mgr AS M
FROM emp
ORDER BY M; //알리아스 명칭으로도 정렬이 가능하다

SQL 에서 정렬 : ORDER BY ==> SELECT -> FROM -> [WHERE] -> ORDER BY
정렬 방법  : ORDER BY 컬럼명 | 컬럼인덱스(순서) | 별칭 [정렬순서]
정렬 순서 : 기본 ASC(오름차순), DESC(내림차순)

데이터 정렬(ORDER BY 실습 ORDERBY1)
dept 테이블의 모든 정보를 부서이름으로 오름차순 정렬로 조회되도록 쿼리를 작성하세요
dept 테이블의 모든 정보를 부서위치로 내림차순 정렬로 조회되도록 쿼리를 작성하세요

SELECT *
FROM dept
ORDER BY dname;

SELECT *
FROM dept
ORDER BY loc DESC; 

데이터 정렬 (ORDER BY 실급 orderby2)
emp 테이블에서 상여(comm) 정보가 있는 사람들만 조회하고
상여(comm)를 많이 받는 사람이 먼저 조회되도록 정렬하고
상여가 같을 경구 사번으로 내림차순 정렬하세요(상여가 0인 사람은 상여가 없는것으로 간주)

SELECT *
FROM emp
WHERE comm IS NOT NULL
AND comm !=0;

SELECT *
FROM emp
WHERE comm > 0
ORDER BY comm ASC, empno DESC;

데이터정렬 Orderby3
emp 테이블에서 관리자가 있는 사람들만 조회하고, 직군(job) 순으로 오름차순 정렬하고
직군이 같을 경우 사번이 큰 사원이 먼저 조회되도록 쿼리를 작성하세요

SELECT *
FROM emp
WHERE mgr IS NOT NULL
ORDER BY job, empno DESC;

데이터정렬 orderby5
emp 테이블에서 10번 부서 (deptno) 혹은 30번 부서에 속하는 사람중 급여(sal)가 1500이 넘는 
사람들만 조회하고 이름으로 내림차순 정렬되도록 쿼리를 작성하세요

SELECT *
FROM emp
WHERE deptno IN (10,30)
AND sal > 1500
ORDER BY ename DESC;
*******************************************************
--페이징 처리 : 전체 데이터를 조회하는게 아니라 페이지 사이즈가 정해졌을 때 원하는 페이지의 데이터만 가져오는 방법
--(1. 400건을 다 조회하고 필요한 20것만 사용하는 방법 --> 전체조회
-- 2. 400건의 데이터중 원하는 페이지의 20건만 조회 --> 페이징 처리(20) 이방법을 배워야됨
--페이징 처리(게시글) ==> 정렬 기준이 뭔데???(일반적으로는 게시글의 작성일시 역순)
--페이징 처리시 고려할 변수  : 페이지 번호, 페이지 사이즈


--ROWNUM : 행번호를 부여하는 특수 키워드(오라클에서만 제공)
* 제약사항
    ROWNUM은 WHERE 절에서도 사용 가능하다
    단 ROWNUM의 사용을 1부터 사용하는 경우에만 사용 가능
    WHERE ROWNUM BETWEEN 1 AND 5 ==> O
    WHERE ROWNUM BETWEEN 6 AND 10 ==> X //1번부터 읽지 않았기에 순차적으로 읽지않아서 
    WHERE ROWNUM = 1; ==> O
    WHERE ROWNUM = 2; ==> X
    WHERE ROWNUM <= 10; ==> O 1번부터 10번까지 가져오기때문에 가능 =없어도 됨
    WHERE ROWNUM > 10; ==> X 1번이 나오지 않기에 되지 않는다.
    SQL 절은 다음의 순서로 실행된다
    FROM => WHERE => SELECT => ORDER BY
    ORDER BY와 ROMNUM을 동시에 사용하면 정렬된 기준으로 ROWNUM이 부여되지 않는다
    (SELECT 절이 먼저 실행되므로 ROWNUM이 부여된 상태에서 ORDER BY 절에 의해 정렬이 된다)
    
전체 데이터 : 14건
페이지사이즈 : 5건
1번째 페이지 : 1~5
2번째 페이지 : 6~10
3번째 페이지 : 11~15(14) *
*인라인 뷰 : 테이블을 in으로 만드는거

--ALIAS

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 5;

FROM = > SELECT = > ORDER BY
SELECT ROWNUM, empno, ename
FROM emp
ORDER BY ename;

SELECT empno, ename
FROM emp
ORDER BY ename;

--인라인 뷰 --
SELECT ename
FROM (SELECT empno, ename 
      FROM emp
      ORDER BY ename);

SELECT *
FROM
(SELECT ROWNUM, empno, ename
FROM (SELECT empno, ename 
      FROM emp
      ORDER BY ename));
WHERE ROWNUM --이렇게 하면 인라인 뷰에 들어있는 ROWNUM이아니라 바깥쪽 전체 ROWNUM이 조회됨 ***꼭 별칭이 있어야함 안하면 실행 안됨***

SELECT *
FROM
(SELECT ROWNUM AS rn, empno, ename
FROM (SELECT empno, ename 
      FROM emp
      ORDER BY ename))
WHERE rn BETWEEN (:page-1)*:pageSize + 1 AND :page*:pageSize;      

WHERE rn BETWEEN 1 AND 5;     
WHERE rn BETWEEN 6 AND 10;
WHERE rn BETWEEN 11 AND 15;

pageSize : 5건
1. page : rn BETWEEN 1 AND 5;
2. page rn BETWEEN 6 AND 10;
3. page rn BETWEEN 11 AND 15;
n page : rn BETWEEN n*pageSize-4 AND n*pageSize;
                    (n-1)*pageSize + 1
rn BETWEEN (page-1)*pageSize + 1 AND page*pageSize;
rn BETWEEN (:page-1)*:pageSize + 1 AND :page*:pageSize; // :을 넣어주면 변수선언이된다 

--ROW_1 데이터정렬 가상 컬럼 ROWNUM 실습
--emp 테이블에서 ROWNUM 값이 1~10인 값만 조회하는 쿼리를 작성해보세요
(정렬없이 진행하세요, 결과는 화면과 다를수 있습니다.)

SELECT ROWNUM AS rn, empno,ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 10;

--ROW2
--ROWNUM 값이 11~20(11~13)인 값만 조회하는 쿼리를 작성해보세요
SELECT *
FROM 
(SELECT ROWNUM AS rn, empno,ename
FROM emp)
WHERE rn BETWEEN 11 AND 20;

--ROW3
--emp 테이블의 사원 정보를 이름컬럼으로 오름차순 적용 했을 때의 11~14번째 행을 다음과 같이 조회하는 쿼리를 작성해보세요



SELECT *
FROM 
(SELECT ROWNUM rn, empno, ename
    FROM
    (SELECT empno, ename
        FROM emp
        ORDER BY ename));
WHERE rn BETWEEN 11 AND 20;

SELECT ROWNUM, emp.*
FROM emp;

SELECT ROWNUM rn, e.* --여기도 emp에서 e로 선언해주었기때문에 e로 써준다
FROM emp e; --테이블 알리아스(별칭) 만들기


SELECT e.*
FROM 
(SELECT ROWNUM rn, empno, ename
    FROM
    (SELECT empno, ename
        FROM emp
        ORDER BY ename)) e --인라인도 알리아스 만들수 있음
WHERE rn BETWEEN 11 AND 20;


