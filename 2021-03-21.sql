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

숫자, 날짜에서 사용가능한 연산자
일반적인 사칙연산 + - / *, 우선순위 연산자 ()