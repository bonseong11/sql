--[bong ����]�� �ִ� prod ���̺��� ��� �÷��� ��ȸ�ϴ� SELECT ���� (SQL) �ۼ�
SELECT *
FROM prod;

--[bong ����]�� �ִ� prod ���̺��� prod_id, prod_name �ΰ��� �÷��� ��ȸ�ϴ� SELECT ����(SQL) �ۼ�
SELECT prod_id, prod_name
FROM prod;

--SELECT (�ǽ� select1)
--1 prod ���̺��� ��� �����͸� ��ȸ�ϴ� ������ �ۼ��ϼ���
--2 buyer ���̺��� buyer_id, buyer_name �÷��� ��ȸ�ϴ� ������ �ۼ��ϼ���
--3 cart ���̺��� ��� �����͸� ��ȸ�ϴ� ������ �ۼ��ϼ���
--4 member ���̺��� mem_id, mem_pass, mem_name �÷��� ��ȸ�ϴ� ������ �ۼ��ϼ���
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

�÷� ������ ���� ���
1. SELECT * ==> �÷��� �̸��� �� �� �ִ�.
2. SQL DEVELOPER�� ���̺� ��ü�� Ŭ���Ͽ� ����Ȯ��

����, ��¥���� ��밡���� ������
�Ϲ����� ��Ģ���� + - / *, �켱���� ������ ()