--[bong 계정]에 있는 prod 테이블의 모든 컬럼을 조회하는 SELECT 쿼리 (SQL) 작성
SELECT *
FROM prod;

--[bong 계정]에 있는 prod 테이블의 prod_id, prod_name 두개의 컬럼만 조회하는 SELECT 쿼리(SQL) 작성
SELECT prod_id, prod_name
FROM prod;

--SELECT (실습 select1)
--1 prod 테이블에서 모든 데이터를 조회하는 쿼리를 작성하세요
--2 buyer 테이블에서 buyer_id, buyer_name 컬럼만 조회하는 쿼리를 작성하세요
--3 cart 테이블에서 모든 데이터를 조회하는 쿼리를 작성하세요
--4 member 테이블에서 mem_id, mem_pass, mem_name 컬럼만 조회하는 쿼리를 작성하세요
--1.
SELECT *
FROM prod;
--2.
SELECT buyer_id, buyer_name
FROM buyer;
--3.
SELECT *
FROM cart
--4.
SELECT mem_id, mem_pass, mem_name
FROM member;

컬럼 정보를 보는 방법
1. SELECT * ==> 컬럼의 이름을 알 수 있다.
2. SQL DEVELOPER의 테이블 객체를 클릭하여 정보확인
3. DESC 테이블명; 테이블명 정보를 알수있음 0과 null은 다른것 //DESCRIBE 설명하다

DESC emp; 

empno : number ;
empno + 10 --> expression 
alias --> 컬럼명을 바꿀수 있음 컬럼명뒤에 컬럼 이름을 붙여주면 그 컬럼으로 이름이 수정
SELECT empno empnumber, empno + 10 emp_plus, 10,
        hiredate, hiredate + 10
FROM emp;


숫자, 날짜에서 사용가능한 연산자
일반적인 사칙연산 + - / *, 우선순위 연산자 ()
날짜는 +,- 만 가능

ALIAS : 컬럼의 이름을 변경
        컬럼 | expression [AS] [별칭명]
SELECT empno "empno", empno + 10 AS empno_plus
FROM emp;

NULL : 아직 모르는 값
       0과 공백은 NULL과 다르다
       **** NULL을 포함한 연산은 결과가 항상 NULL ****
       ==> NULL 값을 다른 값으로 치환해주는 함수
       
SELECT ename, sal, comm, sal+comm, comm + 100
FROM emp;
--SELECT (실습 select2)
1.
SELECT prod_id id, prod_name name
FROM prod;
2.
SELECT lprod_gu gu, lprod_nm nm
FROM lprod;
3.
SELECT buyer_id AS 바이어아이디, buyer_name 이름
FROM buyer;

literal : 값 자체
literal 표기법 : 값을 표현하는 방법

java 정수 값을 어떻게 표현할까 (10)?
int a = 10;
float f = 10f;
long l = 10L;
String s = "Hello World";

 * | {컬럼 | 표현식 [AS] [ALIAS], ...}
SELECT empno, 10, 'Hello World'
FROM emp;

문자열 연산 concat함수는 두개만 결합 가능
java : String msg = "Hello" + "world";

SELECT empno + 10, ename || 'Hello' || ', World',
       CONCAT(ename, ', World')  --결합할 두개의 문자열을 입력받아 결합하고 결합된 문자열을 변환 해준다 --
FROM emp;

DESC emp;

아이디 : brown
아이디 : apeach

SELECT '아이디 : ' || userid,
       CONCAT('아이디 : ', userid)
FROM users;

Literal Character, Concaternation (문자열 결합 실습 sel_con1)
CONCAT(문자열1, 문자열2, 문자열3) 는 안됨
==> CONCAT(CONCAT(문자열1, 문자열2), 문자열3)
SELECT table_name, 'SELECT * FROM ' || table_name || ';' AS QUERY,
       CONCAT(CONCAT('SELECT * FROM ', table_name), ';') AS QUERY
FROM user_tables; --오라클에서 내부적으로 관리하는 테이블--

--부서번호가 10인 직원들만 조회
--부서번호 : deptno
SELECT *
FROM emp
WHERE deptno =10;

--users 테이블에서 userid 컬럼의 값이 brown인 사용자만 조회 
--**주의사항 SQL 키워드는 대소문자를 가리지 않지만 데이터값은 대소문자를 가린다**
SELECT *
FROM users
WHERE userid = 'brown';

--emp 테이블에서 부서번호가 20번보다 큰 부서에 속한 직원 조회
SELECT *
FROM emp
WHERE deptno > 20;

--emp 테이블에서 부서번호가 20번 부서에 속하지 않은 모든 직원 조회
SELECT *
FROM emp
WHERE deptno != 20;

WHERE : 기술한 조건을 참(TRUE)으로 만족하는 행들만 조회한다(FILTER)
--이조건을 참으로 하냐 안하냐 판단 한다-- 
SELECT *
FROM emp
WHERE 1=1;

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= '81/03/01'; -- 81년 3월1일 날짜 값을 표기하는 방법 되기는되는데 한가지 오류가있다

문자열을 날짜 타입으로 변환하는 방법
TO_DATE(날짜 문자열, 날짜 문자열의 포맷팅)
TO_DATE('1981/12/11', 'YYYY/MM/DD')

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1981/03/01', 'YYYY/MM/DD'); --이게더 안전한방법 

