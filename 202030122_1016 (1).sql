/* �ּұ޿��� �޴� ����� �̸�, ����, �޿��� ǥ�� 
�ּұ޿� : ��������, ����� �̸� : ename, ���� : job, �޿� : salary*/
 select ename, job, salary
 from employee
 where salary = (select min(salary)
 from employee);
 
 /* �μ��� �ּ� �޿��� �޴� ����� �����ȣ�� �̸��� ����ϴ� ����
 -�μ��� �ּ� �޿��� ��� - > �������� / dno, salary�߰��ϱ� */
 select dno, eno, ename, salary
 from employee
 where salary in (select min(salary)
                  from employee
                  group by dno);
                  
                  
/* < any : �ִ밪���� �۴�.
   > any : �ּҰ����� ũ��. */              
select eno, ename, job, salary
from employee
where salary < any (select salary   /* (select ~ 'SALESMAN')������ �������� */
        from employee
        where job = 'SALESMAN')  
        and job <> 'SALESMAN';
 
 
 /* ��� ������ �м���(analyst)�� ���(�� salary�� ��������) ���� 
 �޿��� �����鼭(�ִ밪���� �۴�) ������ �м����� �ƴ� ������� ǥ�� 
 / �����ȣ, �̸�, ����, �޿� ǥ��
 any��� */
 select dno, ename, job, salary
 from employee
 where salary < any (select salary
        from employee
        where job = 'ANALYST')
        and job <> 'ANALYST';
        
        
/* �޿��� ��պ��� ���� ������� �����ȣ�� �̸�, �޿��� ǥ���ϵ�
����� �޿��� ���ؼ� ������������ ���� ( ������, order by���(����)) */
select eno, ename, salary
from employee
where salary > (select avg(salary)
        from employee)
order by salary asc;


/* �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ��
IN������ ��� */
select eno, ename
from employee
where dno in(select dno
from employee
where ename like '%K%');

desc book;

/* ������ 20000�� �̻��� ������ �̸� */
select bookname
from book
where price >= 20000;

/* ���� ������ �� ���� */
select count(*)
from book;

/* ������ ������ �԰��ϴ� ���ǻ��� �� ���� */
select count(distinct publisher)
from book;


/* 19�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ */
select orderid
from orders
where orderdate not between '19/7/4' and '19/7/7';

desc customer;

/* ���� '��'���̰� �̸��� '��'�� ������ ���� �ּ� */
select name, address
from customer
where name like '��%��';

desc orders;

/* 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž� */
select sum(saleprice)
from orders
where orderid=2;


/* ������ �ֹ��� ������ �� ������ �� �Ǹž� */
select count(*) as "��������", sum(saleprice) as "�Ѿ�"
from orders
group by custid;


/* ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ������ �ֹ� ������ �� ������ ���ϱ�
��, �� �� �̻� ������ ���� ���� 
select count(orderid)
from orders
group by custid
where */


desc book;

/* ���� ��� ������ �̸��� ���� ��� 
���� �� �������� ��� */
select bookname, price
from book
where price = (select max(price)
from book);


desc orders
desc customer

/* ������ ������ �̷��� �ִ� �� �̸� ���
���� �� �������� ��� */
select name
from customer
where custid in(select custid 
    from orders);
    
    
    /* �⺻Ű ������
    ������ ũ�� 30 �� ��� ����
    ������ ũ�� 30 �� ��� ����
    ������ ũ�� 60
    ������ ũ�� 15 �� ��� ����
    ������ ũ�� 10 �� ��� ���� */
create table publishingcomp (
    pubid number primary key,
    pubname varchar2(30) not null,
    pubaddr varchar2(60),
    pubtel varchar2(15) not null,
    pub_reason varchar2(10) not null
);

alter table publishingcomp
modify pubname varchar2(40);

desc publishingcomp;