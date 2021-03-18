round(hiredate, 'YYYY') -- 년에서 반올림 해줘라

날짜관련 함수 (date는 날짜형으로 해석하면됨)
MONTHS_BETWWEN : 인자- START DATE, END DATE, 반환값 : 두 인자 사이의 개월수

ADD_MONTHS
인자 : date, number 더할 개월수 : date로 부터 x개월 뒤의 날짜

date + 90
1/15 3개월 뒤의 날짜 --

NEXT_DAY
인자 : date, number(weekday, 주간일자)
date 이후의 가장 첫번째 주간일자에 해당하는 date를 변환

LAST_DAY (***)
인자 : date :  date가 속한 월의 마지막 일자를 date로 반환

MONTHS_BETWWEN -- 빈도가 높지 않다
SELECT ename, TO_DATE(hiredate, 'yyyy/mm/dd HH24:mi:ss') hiredate,
    MONTHS_BETWEEN(sysdate, hiredate) month_between,
    ADD_MONTHS (SYSDATE, 5),
    TO_DATE('2021-02-15', 'YYYY-MM-DD'), --SYSDATE와 같은 날짜형으로 바뀜
    ADD_MONTHS(TO_DATE('2021-02-15', 'YYYY-MM-DD'), 5),
    NEXT_DAY(SYSDATE, 5) NEXT_DAY, --오늘이 모교일이니까 다음 목요일로 
    LAST_DAY(SYSDATE) LAST_DAY, --오늘로부터 마지막날 이뜸 3월 18일이니 3월 31일이 뜸
     TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD') FIRST_DAY   --SYSDATE를 이용하여 SYSDATE가 속한 월의 첫번째 날짜 구하기
   
FROM emp;

SELECT TO_DATE('2021', 'YYYY')
FROM dual;

SELECT TO_DATE(TO_CHAR(SYSDATE-5, 'YYYY/MM/DD'), 'YYYY/MM/DD')
FROM dual;


SELECT TO_DATE('2021' || '0101' , 'YYYYMMDD')
FROM dual;

/* FN3
    파라미터로 yyyymm형식의 문자열을 사용 하여 (ex : yyyymm = 201912)
    해당 년 월에 해당하는 일자 수를 구해보세요
    yyyymm=201912 -> 31
    yyyymm=201911 -> 30
    yyyymm=201602 -> 29 (2016년은 윤년)
*/
SELECT :YYYYMM, 
        TO_CHAR(LAST_DAY(TO_DATE(:YYYYMM, 'YYYYMM')), 'DD') DT
FROM dual;

형변환
1. 명시적 형변환
    TO_DATE, TO_CHAR, TO_NUMBER
2. 묵시적 형변환
    자동으로 형변환하는거
묵시적 형변환

SELECT *
FROM emp 
WHERE empno = '7499';

1. 위에서 아래로
2. 단, 들여쓰기 되어있을 경우(자식 노드) 자식노드부터 읽는다.


NUMBER
FORMAT
9 : 숫자
0 : 강제로 0표시
, : 1000자리 표시
. : 소수점
L : 화폐단위(사용자 지역)
$ : 달러화폐표시

SELECT ename, sal, TO_CHAR(sal, 'L0009,999,00') fm_sal --잘안씀
FROM emp;


null 처리 함수 : 4가지 
NVL(expr1, expr2) : expr1이 null값이 아니면 expr1을 사용하고, expr1이 null값이면 expr2로 대체해서 사용한다.
if( expr1 == null)
    System.out.println(expr2)
else
system.out.println(expr1)

emp 테이블에서 comm 컬럼의 값이 null일 경우 0으로 대체 해서 조회하기
comm 값이 null일경우 0으로 바꿔준다 NVL함수 역활
SELECT empno, comm, NVL(comm, 0) 
FROM emp;

SELECT empno, comm, 
        sal + NVL(comm, 0) nvl_sal_comm, -- comm에 null값을 0으로 바꿔주고 거기에 sal를 더한다.
        NVL(sal+comm, 0) nvl_sal_comm2 -- sal+comm 를 더한상태에서 null이 나오는걸 0으로 바꿔준다는 의미 잘못된 사용법
FROM emp;

NVL2(expr1, expr2, expr3)
if(expr1 != null)
    System.out.println(expr2);
else
    System.out.println(expr3);
    
comm이 null이 아니면 sal+comm 반환,
comm이 null 이면 sal을 반환

SELECT empno, sal, comm, 
        NVL2(comm, sal+comm, sal) nv12, --comm이 null이 아니면 sal+comm을 반환 null이면 sal을 반환
        sal + NVL(comm, 0) nv1
FROM emp;

NULLIF(expr1, expr2) -- 첫번째 값과, 두번째 값이 같으면 null값을 출력 아니면 첫번째 값 출력
if(expr1 == expr2)
    System.out.println(null)
else
    System.out.println(expr1)

SELECT empno, sal, NULLIF(sal, 1250)
FROM emp;


COALESCE(expr1, expr2, expr3.....)
인자들 중에 가장먼저 등장하는 null이 아닌 인자를 반환
if(expr1 != null)
    System.out.println(expr1);
else
    COALESCE(expr2, expr3......);
    
if(expr2 != null)
    System.out.println(expr2);
else
    COALESCE(expr3......);  

SELECT empno, sal, comm, COALESCE() 
FROM emp;

fn4
emp 테이블의 정보를 다음과 같이 조회되도록 쿼리를 작성하세요

SELECT empno, ename, mgr, NVL(mgr, 9999) mgr_n_1, NVL2(mgr, mgr, 9999) mgr_n_2, COALESCE(mgr, 9999) mgr_n_3
FROM emp;

fn5

SELECT userid, usernm, reg_dt, nvl(reg_dt, SYSDATE) n_reg_dt
FROM users
WHERE userid in ('cony', 'sally', 'james', 'moon');

조건분기
1. CASE 절
    CASE expr1 비교식(참거짓 판단 할수 있는 수식) THEN 사용할값 ==> if
    CASE expr2 비교식(참거짓 판단 할수 있는 수식) THEN 사용할값 ==> else if
    CASE expr3 비교식(참거짓 판단 할수 있는 수식) THEN 사용할값 ==> else if
    ELSE 사용할 값4                                         ==> else
    END
2. DECODE 절 => COALESCE 함수 처럼 가변인자 사용
DECODE( expr1, search1, return1, search2, return2, search3, return3....[, default])

DECODE( expr1, 
        search1, return1, 
        search2, return2, 
        search3, return3
        ....[, default])


if (expr1 == search1)
    System.out.println(return1)
else if (expr1 == search2)
    System.out.println(return2)
else if (expr1 == search3)
    System.out.println(return3)
else
    System.out.println(default)

if()
else if
else if
.
.
else

직원들의 급여를 인상하려고 한다
job이 SALESMAN 이면 현재 급여에서 5%를 인상
job이 MANAGER 이면 현재 급여에서 10%를 인상
job이 PRESIDENT 이면 현재 급여에서 20%를 인상
그 외의 직군은 현재 급여를 유지

SELECT ename, job, sal,
        CASE
            WHEN job = 'SALESMAN' THEN sal * 1.05
            WHEN job = 'MANAGER' THEN sal * 1.10 
            WHEN job = 'PRESIDENT' THEN sal * 1.20 
            ELSE sal * 1.0
        END sal_bonus,
        DECODE(job, 
                'SALESMAN', sal *1.05,
                'MANAGER', sal * 1.10,
                'PRESIDENT', sal * 1.20,
                sal * 1.0) sal_bonus_decode  --default값 sal * 1.0을 안넣어주면 null값이 나옴
FROM emp;   

cond 1
emp 테이블을 이용하여 deptno에 따라 부서명으로 변경 해서 다음과 같이 조회되는 쿼리를 작성하세요
10 -> 'ACCOUNTING'
20 -> 'RESEARCH'
30 -> 'SALES'
40 -> 'OPERATIONS'
기타 다른값 -> 'DDIT'


SELECT empno, ename, deptno,
    CASE
    WHEN deptno = 10 THEN 'ACCOUNTING'
    WHEN deptno = 20 THEN 'RESEARCH'
    WHEN deptno = 30 THEN 'SALES'
    WHEN deptno = 40 THEN 'OPERATIONS'
    ELSE 'DDIT'
    END dname,
    DECODE(deptno, 
                10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS','DDIT') sal_bonus_decode
    
FROM emp;

cond2
2=> 0, 1
SELECT MOD(1981, 2)
FROM dual;
--emp 테이블을 이용하여 hiredate에 따라 올해 건강보험 검진 대상자인지 조회하는 쿼리를 작성하세요
--(생년을 기준으로 하나 여기서는 입사년도를 기준으로 한다)
홀수년도 - 홀수해 출생자/ 짝수년도-짝수해

SELECT MOD(1981, 2)
FROM dual;

SELECT empno, ename,  TO_CHAR(hiredate, 'YY/MM/DD') hiredate, 
        CASE
            WHEN
                MOD(TO_CHAR(hiredate, 'yy'),2) = 
                MOD(TO_CHAR(SYSDATE, 'yy'),2) THEN '건강검진 대상자'
        ELSE '검강검진 비대상자'
        END contact_to_doctor,
        DECODE(MOD(TO_CHAR(hiredate, 'yy'),2),MOD(TO_CHAR(SYSDATE, 'yy'),2),'건강검진 대상자',
                                                    '건강검진 비대상자') contact_to_doctor1
FROM emp;

cond3
--users 테이블을 이용하여 reg_dt에 따라 올해 건강보험 검진 대상자인지 조회하는 쿼리를 작성하세요
--생년을 기준으로 하나 여기서는 reg_dt를 기준으로 한다

SELECT userid, usernm,  TO_CHAR(reg_dt, 'YY/MM/DD'), 
            CASE
                WHEN
                    MOD(TO_CHAR(reg_dt, 'yy'),2) = 
                    MOD(TO_CHAR(SYSDATE, 'yy'),2) THEN '건강검진 대상자'
        ELSE '검강검진 비대상자'
        END contact
FROM users
WHERE userid in('brown', 'cony', 'james', 'moon', 'sally');

GROUP FUNCTION : 여러행을 그룹으로 하여 하나의 행으로 결과값을 반환하는 함수

그룹 함수
AVG : 평균
COUNT : 건수
MAX : 최대값
MIN : 최소값
SUM : 합



SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal),2), 
                SUM(sal), COUNT(sal) count_sal, -- 그룹핑된 행중에 sal 컬럼의 값이 null이 아닌 행의 건수
                COUNT(mgr) count_mgr, -- 그룹핑된 행중에 mgr 컬럼의 값이 null이 아닌 행의 건수
                COUNT(*) count_all, -- 그룹핑된 행 건수
                SUM(COMM) sum_comm -- 그룹함수가 자동으로 널을 걸러줌
               
FROM emp
GROUP BY deptno; --deptno가 묶임


--GROUP BY를 사용하지 않을 경우 테이블의 모든 행을 하나의 행으로 그룹핑한다.
--max(sal)을 14명중에 급여 최대값
SELECT COUNT(*), MAX(sal), ROUND(AVG(sal), 2), SUM(sal)
FROM emp;

--group by 절에 나온 컬럼이 SELECT 절에 그룹함수가 적용되지 않은채로 기술되면 에러
--중복되는 값이 없으면 모든행이 다나온다. GROUP BY로 묶었을때

SELECT deptno, emptno, MAX(sal), MIN(sal), ROUND(AVG(sal),2), SUM(sal), COUNT(sal) count_sal, 
                COUNT(mgr) count_mgr, 
                COUNT(*) count_all 
FROM emp
GROUP BY deptno, emptno;

--상수나 문자열을 입력해도 가능
SELECT deptno, 'TEST', MAX(sal), MIN(sal), ROUND(AVG(sal),2), SUM(sal), COUNT(sal) count_sal, 
                COUNT(mgr) count_mgr, 
                COUNT(*) count_all 
FROM emp
GROUP BY deptno;


GROUP FUNCTION
그룹함수에서 NULL컬럼은 계산에서 제외된다
GROUP BY 절에 작성된 컬럼 이외의 컬럼이 SELECT 절에 올 수 없다
WHERE절에 그룹 함수를 조건으로 사용할 수 없다
HAVING 절 사용
WHERE SUM(sal) > 3000 (X)
HAVING SUM(sal) > 3000 (O)

GRP1
EMP 테이블을 이용하여 다음을 구하시오
직원중 가장 높은 급여
직원중 가장 낮은 급여
직원의 급여 평균(소수점 두자리까지 나오도록 반올림)
직원의 급여 합
직원중 급여가 있는 직원의 수 (NULL제외)
직원중 상급자가 있는 직원의 수 (NULL제외)
전체 직원의 수 
--5000 800 2073.21, 29025, 14, 13, 14

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), count(sal), count(mgr), count(*)
FROM emp;

grp2
emp 테이블을 이용하여 다음을 구하시오

SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), count(sal), count(mgr), count(*)
FROM emp
GROUP BY deptno;