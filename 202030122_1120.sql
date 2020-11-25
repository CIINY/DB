create role programmer;

GRANT CONNECT, RESOURCE, create view TO programmer;


/*����� �߰�*/
create user dituser101      /*���̵�*/
identified by ditdb20;      /*��й�ȣ*/

GRANT programmer to dituser101;

/*dituser11�� programmer ������ ���� ȸ��*/
revoke programmer from dituser101;

/*
programmer role ����
drop role programmer;
*/


/*������ ���ϴ� �Լ�*/
select abs(-78), abs(78)
from dual;

/*�ݿø�*/
select round(4.875, 1)
from dual;

/*������ �ڸ��� ���ϸ� ������*/
select trunc(4.875)
from dual;


/*���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� �� ���ϱ�*/
/* -2 -> 100*/
select custid "����ȣ", round(AVG(saleprice), -2) "��ձݾ�"
from orders
group by custid
order by desc;


/*
LOWER : �����ڸ� ��� �ҹ��ڷ� ��ȯ
UPPER : �����ڸ� ��� �빮�ڷ� ��ȯ
INITCAP : ù ���ڸ� �빮�ڷ� ��ȯ
*/
/*employee���̺��� �̸��� �ҹ��ڷ� �������� ù ���ڸ� �빮�ڷ� ��ȯ*/
select ename, lower(ename), job, initcap(job)
from employee;


/*LENGTH : ���ڱ��� ��ȯ*/
/*BOOK ���̺��� bookid�� 1�� �������� bookname�� ���ڼ� ���*/
select bookname, length(bookname)
from book
where bookid=1;


/*REPLASE : ���ڿ��� ġȯ*/
/*REPLASE(���, ������ ����, �� ����)*/
/*BOOK ���̺��� ������ �� �߱��� ���Ե� ������ �󱸷� ��ȯ�ϱ�*/
/*bookname���� �� �� �� ���������. replace() + bookname�� �� �����.*/
select bookid, replace(bookname, '�߱�', '��') bookname, publisher, price
from book;

select * from book;


/*SUBSTR : ������ ���̸�ŭ�� ���ڿ� ��ȯ*/
select substr(name, 1, 1) "��", count(*) "�ο�"
from customer
group by substr(name, 1, 1);


/*SYSDATE : �ý����� ���糯¥�� �ð� ��ȯ*/
select sysdate from dual;

/*����� ��������� �ٹ��ϼ� ���ϱ�(round, sysdate���)*/
select round(sysdate-hiredate) "�ٹ��ϼ�"
from employee;


/*MONTHS_BETWEEN : �� ��¥ ������ ���� �� ��ȯ*/
/*MONTHS_BETWEEN(�ֱ� ��¥, ������¥)*/
/*�� ������� �ٹ��� ���� ��*/
select ename, sysdate, hiredate,
trunc(months_between(sysdate, hiredate)) "�ٹ�����"
from employee;


/*���� ������ ORDERS ���̺��� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�.
�� �ֹ��� Ȯ�����ڸ� ���ϱ�*/
select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ����"
from orders;


/*TO_DATE : ���������� ����� ��¥�� ��¥������ ��ȯ�ϴ� �Լ�*/
/*��� �� 1981�� 2�� 20�Ͽ� �Ի��� ��� �˻��ϱ�*/
select ename, hiredate
from employee
where hiredate = to_date(19810220, 'YYYYMMDD');


/*TO_CHAR : ��¥���� ���������� ��ȯ�ϴ� �Լ�*/
/*2019�� 7��7�Ͽ� �ֹ� ���� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ���̽ÿ�.
��, �ֹ����� 'yyy-mm-dd ����' ���·� ǥ���� */
select orderid, to_char(orderdate, 'yyyy-mm-dd dy') custid, bookid
from orders
where orderdate = to_date('20190707', 'yyyymmdd');

/*
null ���� Ȯ���ϴ� ���
is null : null ���� ã�� ��
is not null : null�� �ƴ� ���� ã�� ��
employee ���̺��� cmmission�� null�� �� ã��
*/
select *
from employee
where commission is null;  /*commission �� �ȿ� null���� �ֽ��ϱ�? ���.*/

select *
from employee
where manager is null;

/*�� ���� ����*/
select *
from employee
where eno is null;
select *
from employee
where ename is null;
select *
from employee
where job is null;
select *
from employee
where hiredate is null;
select *
from employee
where salary is null;
select *
from employee
where dno is null;

select * from customer;

/*NVL : null�� �ٸ� ������ ��ġ�Ͽ� �����ϰų� ����ϴ� �Լ�*/
/*
�̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�.
��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ����
*/
select * from customer;

insert into customer(custid, name, address)
values(6, '�����', '���� ��Ʈ��');
/*phone�����Ϳ��� null���� �ƴϸ� �� ��ȣ�� �߰�, null���̸� '����ó����'�̶�� ��*/
select name "�̸�", nvl(phone, '����ó����') "��ȭ��ȣ"
from customer;


/*����Ŭ���� ���������� �����Ǵ� ���� �÷��׷� SQL��ȸ����� ������ ��Ÿ��*/
/*�ڷḦ �Ϻκи� Ȯ���Ͽ� ó���� �� ������*/
/*����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̱�*/
(select ROWNUM "����", custid, name, phone
from customer);

select ROWNUM "����", custid, name, phone
from customer
where ROWNUM <=2;

/*�ּҰ� ���ѹα��� ����鸸 �̾ƺ���*/
select *
from customer
where address like '���ѹα�%';

select ROWNUM "����", custid, name, phone
from customer
where address like '���ѹα�%';

select * from customer;

/*���������� ���Ͽ� ������ 1, 2�� �ƴ� 2, 1�� �� ���·� ��µȴ�.*/
select ROWNUM "����", custid, name, phone     /*3*/
from customer               /*1  #���� */
where ROWNUM <=2            /*2*/
order by name;              /*4*/

/*���ĵ� �� ������ ������ ���̱�*/
select ROWNUM "����", custid, name, phone
from (select custid, name, phone
from customer
order by name)
where rownum <= 2;









