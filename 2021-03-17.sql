WHERE 조건 : 10건

WHERE 조건1
  AND 조건2 : 10건을 넘을수 없음
    
WHERE deptno =10
    AND sal > 500
    
OR는 늘어남

TABLE 객체의 특징 : 순서가 없다. 조회되는 순서가 같지 않다.

SELECT *
FROM 
(SELECT ROWNUM AS rn, empno,ename
FROM emp
ORDER BY ename)
WHERE rn BETWEEN 11 AND 20;

트랜잭션 NOT IN rownum 시험에 나옴

오라클에서 함수는
single row function 
단일 행을 기준으로 작업하고, 행당 하나의 결과를 반환
특정 컬럼의 문자열 길이 : length(ename)

multi row function
여러 행을 기준으로 작업하고, 하나의 결과를 반환
그룹함수
count, sum, avg

SELECT COUNT(*) --14개 출력
FROM emp;

함수명을 보고
1. 파라미터가 어떤게 들어갈까??
2. 몇개의 파라미터가 들어갈까?
3. 반환되는 값은 무엇일까?

Character
대소문자 
1. LOWER : 소문자로 바꿔줌

2. UPPER : 대문자로만 바꿔주는거

3. INITCAP : 첫글자를 대문자로 바꿔주는거

4. CONCAT : 연결해주는거

5. SUBSTR : 문자열 잘라내기

6. LENGTH : 문자열이 몇개인지

7. INSTR : 함수의 위치를 찾음

8. LPAD | RPAD : 왼쪽 오른쪽에 특정 문자를 원하는 자리수 만큼 넣기

9. TRIM : 문자열의 공백은 제거하지 않음

10. REPLACE : 컬럼의 특정한 문자열을 다른 문자열로 일괄적으로 바꾸어 주는 문자열 치환 함수

--SELECT * | {컬럼 | expression}
SELECT ename, LOWER(ename), UPPER(ename),
        SUBSTR(ename, 1, 3), --1~3번째까지 예를들면 SMITH면 SMI로 나옴
        SUBSTR(ename, 2) --2번째부터 끝까지 뒤에 숫자를 넣어줘야 나옴
FROM emp;

DUAL table
sys계정에 있는 테이블
누구나 사용 가능
DUMMY 컬럼 하나만 존재하며 값은 'X'이며 데이터는 한 행만 존재
사용 용도
데이터와 관련없이
함수 실행
시퀀스 실행
merge 문에서
데이터 복제시(connect by level)


SELECT *
FROM dual;
--행의 건수를 영향을주는건 WHERE 절
SELECT LENGTH('TEST') 
FROM emp;

SELECT LENGTH('TEST')
FROM dual;

SINGLE ROW FUNCTION : WHERE 절에서도 사용 가능
emp 테이블에 등록된 직원들 중에 직원의 이름의 길이가 5글자를 초과하는 직원만 조회

SELECT * 
FROM emp
WHERE LENGTH(ename) > 5;

SELECT *
FROM emp
WHERE LOWER(ename) = 'smith'; --lower함수가 14번 실행되서 권장하지않음

SELECT *
FROM emp
WHERE ename = UPPER('smith'); --upper 하번만 실행

SELECT *
FROM emp
WHERE ename = 'SMITH';

ORACLE 문자열 함수

SELECT 'HLLO' || ',' || 'WORLD', 
    CONCAT('HELLO', CONCAT(', ' ,'WORLD')) CONCAT,
    SUBSTR('HELLO, WORLD', 1, 5) SUBSTR, --1~5번째까지 예를들면 HELLO, WORLD면 HELLO로 나옴
    LENGTH('HELLO, WORLD') LENGTH, --문자가 몇개인지
    INSTR('HELLO, WORLD', 'O') INSTR, -- HELLO, WORLD 에서 O는 몇번째인지 출력해라 결과는 5
    INSTR('HELLO, WORLD', 'O', 6) INSTR2,
    LPAD('HELLO, WORLD', 15, '*') LPAD, -- 15자리로 만들고싶고 글자수가 12개이면 왼쪽에 *을 3개 넣어줌
    RPAD('HELLO, WORLD', 15, '*') RPAD,  -- 15자리로 만들고싶고 글자수가 12개이면 오른쪽에 *을 3개 넣어줌
    REPLACE('HELLO, WORLD', 'O', 'X') REPLACE, -- HELLO WORLD에서 O라는것을 X로 바꿈
    TRIM('   HELLO, WORLD  ') TRIM, --공백을 제거, 문자열의 앞과, 뒷부분이에 있는 공백만(중간은 치지 않음 앞과 뒤쪽)
     TRIM('D' FROM  'HELLO, WORLD') TRIM2 --HELLO WORLD에서 D를 빼줘라
FROM dual;

--number
--숫자 조작
--ROUND
--반올림
--TRUNC
--내림
--MOD
--나눗셈의 나머지

JAVA : 10%3 => 1;

SELECT MOD(10,3)
FROM dual;


SELECT 
ROUND(105.54,1)ROUND1, --반올림 결과가 소수점 첫번째 자리까지 나오도록 : 둘째자리에서 반올림 105.5
ROUND(105.55,1)ROUND2, --반올림 결과가 소수점 첫번재 자리까지 나오도록 : 둘째자리에서 반올림 105.6
ROUND(105.55,0)ROUND3, --반올림 결과가 첫번째 자리(일의자리)까지 나오도록 : 소수점 첫째 자리에서 반올림 106
ROUND(105.55,-1)ROUND4, --반올림 결과가 두번째 자리(십의자리)까지 나오도록 : 정수 첫째 자리에서 반올림 110
ROUND(105.55)ROUND5 -- 소수점 첫번재자리에서 반올림 한다 : 106
FROM dual;

SELECT 
TRUNC(105.54,1)TRUNC1, --절삭 결과가 소수점 첫번째 자리까지 나오도록 : 둘째자리에서 절삭 105.5
TRUNC(105.55,1)TRUNC2, --절삭 결과가 소수점 첫번재 자리까지 나오도록 : 둘째자리에서 절삭 105.5
TRUNC(105.55,0)TRUNC3, --절삭 결과가 첫번째 자리(일의자리)까지 나오도록 : 소수점 첫째 자리에서 절삭 105
TRUNC(105.55,-1)TRUNC4, --절삭 결과가 두번째 자리(십의자리)까지 나오도록 : 정수 첫째 자리에서 절삭 100
TRUNC(105.55)TRUNC5 -- 소수점 첫번째자리에서 절삭을 한다 : 105
FROM dual;

--ex : 7499, ALLEN, 1600, 1, 600
SELECT empno, ename, sal, TRUNC(sal/1000), MOD (SAL, 1000) 
FROM emp; 

날짜 <==> 문자
서버의 현재 시간 : SYSDATE
SELECT SYSDATE
FROM dual;
--1일을 추가
SELECT SYSDATE + 1
FROM dual;
--1시간 추가
SELECT SYSDATE + 1/24 
FROM dual;

--1분추가 
SELECT SYSDATE, SYSDATE + 1/24/60 
FROM dual;

--1초추가
SELECT SYSDATE, SYSDATE + 1/24/60/60
FROM dual;


--DATE 실습 FN1
--1. 2019년 12월 31일을 date 형으로 표현
--2. 2019년 12월 31일을 date 형으로 표현하고 5일 이전 날짜
--3. 현재 날짜
--4. 현재 날짜에서 3일 전 값
--위 4개 컬럼을 생성하여 다음과 같이 조회하는 쿼리를 작성하세요
--(PT 예시는 현재 날짜가 2019/10/14)

SELECT TO_DATE('2019/12/31', 'YYYY/MM/DD') AS LASTIDAY, 
        TO_DATE('2019/12/31', 'YYYY/MM/DD') - 5 AS LASTDAY_BEFORE5, 
            SYSDATE AS NOW, SYSDATE - 3 AS NOW_BEFORE3
FROM dual;

TO_DATE : 인자-문자, 문자의 형식
TO_CHAR : 인자-날짜, 문자의 형식

--SELECT TO_DATE(SYSDATE....) --이미 날짜인데 날짜에서 날짜로 바꾸는게 에러
--1년은 52~53주
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;
--오늘 몇주차인지 뜨는 함수 
--주간요일(D) 1 일요일, 2 월요일, 3 화요일 , ......., 7 토요일
--YYYY : 4자리 년도
-- MM :  2자리 월
-- DD : 2자리 일자
-- D : 주간 일자(1~7)
-- IW : 주차(1~53)
-- HH,HH12 : 2자리 시간 (12시간 표현)
-- HH24 : 2자리 시간(24시간 표현)
-- MI : 2자리 분
-- SS : 2자리 초

SELECT SYSDATE, TO_CHAR(SYSDATE, 'IW'), TO_CHAR(SYSDATE, 'D')
FROM dual;

--date
--형변환(DATE->CHARACTER)
--TO_CHAR(DATE,'포맷)
--형변환(CHARACTER->DATE)


SELECT SYSDATE, TO_DATE(TO_CHAR(SYSDATE-5, 'YYYY/MM/DD'), 'YYYY/MM/DD')
FROM dual;

--실습2
-- 오늘 날짜를 다음과 같은 포맷으로 조회하는 쿼리를 작성하시오
-- 1. 년-월-일
-- 2. 년-월-일 시간(24)-분-초
-- 3. 일-월-년

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24-MI-SS') DT_DASH_WITH_TIME,
        TO_CHAR(SYSDATE, 'DD-MM-YYYY') DT_DD_MM_YYYY
FROM dual;

TO_DATE(문자열, 문자열 포맷)

TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'YYYY-MM-DD') --시간을 날려버릴때 사용

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT TO_CHAR(TO_DATE('2021-03-17', 'YYYY-MM-DD'), 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

round(hiredate, 'YYYY') // 년에서에서 반올림 해줘라
