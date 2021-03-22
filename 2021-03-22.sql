join1
erd 다이어그램을 참고하여 prod 테이블과 lprod 테이블을 조인하여 다음과 같은 결과가 나오는 쿼리를 작성해보세요

SELECT *
FROM prod;

SELECT *
FROM lprod;


SELECT lprod.lprod_gu, lprod.lprod_nm,
        prod.prod_id, prod.prod_name
FROM lprod, prod
WHERE lprod.lprod_gu = prod.prod_lgu;


join2
erd 다이어그램을 참고하여 buyer,prod 테이블을 조인하여
buyer별 담당하는제품 정보를 다음과 같은 결과가 나오도록 쿼리를 작성해보세요


SELECT *
FROM buyer;

SELECT *
FROM prod;

SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name
FROM prod, buyer
WHERE prod.prod_buyer = buyer.buyer_id;


join3
erd 다이어그램을 참고하여 member,cart,prod 테이블을 조인하여 회원별 장바구니에 담은 제품 정보를 다음과 같은 결과가
나오는 쿼리를 작성해보세요

SELECT *
FROM member;

SELECT *
FROM cart;

SELECT *
FROM prod;
-- 내가한거
SELECT member.mem_id, member.mem_name, prod.prod_id, prod.prod_name, cart.cart_qty
FROM member, prod, cart
WHERE member.mem_id = cart.cart_member
    AND prod.prod_id = cart.cart_prod;


SELECT mem_id, mem_name, prod_id, prod_name, cart_qty
FROM member, cart, prod
WHERE member.mem_id = cart.cart_member
    AND cart.cart_prod = prod.prod_id;

SELECT mem_id, mem_name, prod_id, prod_name, cart_qty
FROM member JOIN cart ON (member.mem_id = cart.cart_member)
    JOIN prod on (cart.cart_prod = prod.prod_id);


SELECT *
FROM customer;

SELECT *
FROM product;

SELECT *
FROM cycle;

join4
--erd 다이어그램을 참고하여 customer, cycle 테이블을 조인하여 고객별 애음 제품, 애음요일
--개수를 다음과 같은 결과가 나오도록 쿼리를작성해보세요(고객명이 brown, sally인 고객만 조회)
--(*정렬과 관계없이 값이 맞으면 정답)

SELECT customer.cid, customer.cnm, cycle.pid, cycle.day, cycle.cnt
FROM customer, cycle
WHERE customer.cid = cycle.cid
AND customer.cnm IN ('brown', 'sally');

join5
--erd 다이어그램을 참고하여 customer, cycle, product 테이블을 조인하여
--고객별 애음 제품, 애음요일, 개수, 제품명을 다음과 같은 결과가 나오도록
--쿼리를 작성해보세요(고객명이 brown, sally인 고객만 조회)
--(*정렬과 관계없이 값이 맞으면 정답)

SELECT customer.cid, customer.cnm, cycle.pid, product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
AND cycle.pid = product.pid
AND customer.cnm IN ('brown', 'sally');

join 6
--erd 다이어그램을 참고하여 customer, cycle, product 테이블을 조인하여
--애음요일과 관계없이 고객별 애음 제품별, 개수의 합과, 제품명을 다음과 같은 결과가 나오도록 쿼리를 작성
--(*정렬과 관계없이 값이 맞으면 정답)

SELECT customer.cid, customer.cnm, cycle.pid, product.pnm, sum(cycle.cnt) cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, cycle.pid, product.pnm;


join7
erd 다이어그램을 참고하여 cycle, product 테이블을 이용하여
제품별 , 개수의 합과, 제품명을 다음과 같은 결과가 나오도록 쿼리를 작성해보세요

SELECT cycle.pid, product.pnm, sum(cycle.cnt) cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
AND cycle.pid = product.pid
GROUP BY cycle.pid, product.pnm;

-- 아우터 조인 

OUTER JOIN = 컬럼 연결이 실패해도 [기준]이 되는 테이블 쪽의 컬럼 정보는 나오도록 하는 조인
LEFT OUTER JOIN : 기준이 왼쪽에 기술한 테이블이 되는 OUTER JOIN
RIGHT OUTER JOIN : 기준이 오른쪽에 기술한 테이블이 되는 OUTER JOIN
FULL OUTER JOIN : LEFT OUTER + RIGHT OUTER - 중복데이터 제거

테이블1 JOIN 테이블2

테이블1 LEFT OUTER JOIN 테이블2
==
테이블2 RIGHT OUTER JOIN 테이블1

직원의 이름, 직원의 상사 이름 두개의 컬럼이 나오도록 join query 작성

SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

SELECT e.ename, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno);

SELECT e.ename, m.ename
FROM emp e LEFT OUTER JOIN emp m ON( e.mgr = m.empno);

--ORACLE SQL OUTER JOIN 표기 : (+)
--OUTER 조인으로 인해 데이터가 안나오는 쪽 컬럼에 (+)를 붙여준다
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+);

SELECT e.ename, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m ON( e.mgr = m.empno AND m.deptno = 10);

SELECT e.ename, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m ON( e.mgr = m.empno)
WHERE m.deptno = 10;

SELECT e.ename, m.ename, m.deptno
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno = 10;

SELECT e.ename, m.ename, m.deptno
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno(+) = 10;

SELECT e.ename, m.ename, m.deptno
FROM emp e RIGHT OUTER JOIN emp m ON( e.mgr = m.empno);

--FULL OUTER : LEFT OUTER(14) + RIGHT OUTER(21) - 중복 데이터 1개만 남기고 제거 (13) = 22
SELECT e.ename, m.ename
FROM emp e FULL OUTER JOIN emp m ON (e.mgr = m.empno);

SELECT e.ename, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m ON( e.mgr = m.empno);

--FULL OUTER 조인은 오라클 SQL 문법으로 제공하지 않는다 (한쪽에만 쓸수있다)
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.mgr(+) = m.empno(+);

--outerjoin1

SELECT *
FROM buyprod
WHERE buy_date = TO_DATE('2005/01/25', 'YYYY/MM/DD');

모든 제품을 다 보여주고 실제 구매가 있을 때는 구매수량을 조회, 없을 경우는 NULL로 표현
제품 코드  :  수량 
buyprod 테이블에 구매일자가 2005년 1월 25일인 데이터는 3품목 밖에 없다.
모든 품목이 나올수 있도록 쿼리를 작성 해보세요

SELECT buy_date, buy_prod, prod_id, prod_name, buy_qty
FROM buyprod RIGHT OUTER JOIN prod ON 
(buyprod.buy_prod = prod.prod_id AND buy_date = TO_DATE('2005/01/25', 'YYYY/MM/DD'));

SELECT buy_date, buy_prod, prod_id, prod_name, buy_qty
FROM buyprod, prod
WHERE buyprod.buy_prod(+) = prod.prod_id 
    AND buy_date(+) = TO_DATE('2005/01/25', 'YYYY/MM/DD');
