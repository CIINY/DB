select name, sum(saleprice) as "���Ǹž�"
from customer, orders
where customer.custid = orders.custid
group by name
order by name;


/*�ֹ� ���̺��� bookid�� �ܷ�Ű�� �����ϱ�*/
alter table orders
add foreign key(bookid) references book(bookid);


/*���̺� ��Ī �����ϱ�*/
/*select * from*/


/*���̸��� ���� �ֹ��� ������ �̸� ��ȸ�ϱ�*/
select name, bookname
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid;


/*������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸� ��ȸ�ϱ�*/
select name, bookname
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid
and price=20000;


/*ename�� BLAKE�� ����� �����ϴ� ���ϻ���� ename�� job ����ϱ� + �����ȣ, �����*/
select stff.eno, stff.ename, stff.job, stff.manager
from employee stff, employee mgr
where stff.manager=mgr.eno and mgr.ename like 'BLAKE';


/*������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ��� ��ȸ�ϱ�
left outer join        where�� ���� ����*/
select name, saleprice
from customer left outer join
orders on customer.custid=orders.custid;


/*�����ͺ��̽� �⸻ ������Ʈ : �⺻������ join�Ӽ����� �ݵ�� ����ؾ� �Ѵ�.*/


/*where ������ ���� ��*/
select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid=od.bookid
order by bk.bookid;


/*������ �Ǹ� ���� , where��� on�� ��� ��
å�� ��� �ȷȴ°�. book���̺��� �������� �� ��.*/
select bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.bookname;


/*���ǻ纰 �Ǹ� ����
salecount : ��Ī*/
select bk.publisher, count(od.bookid) as "salecount"
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.publisher;


/*scott ����� �μ���ȣ�� �μ��̸��� ����ϱ�*/
select dno, eno
from employee 
where ename like 'SCOTT';

select dp.dno, dp.dname
from department dp, employee ep
where dp.dno=ep.dno and ep.ename like 'SCOTT';


/*���� ������ ����Ͽ� �����ں��� �Ի����� ���� ��� ����ϱ�*/
select stff.ename, stff.job, stff.hiredate, ep.ename as "managername"
from employee stff, employee ep
where stff.manager=ep.eno 
and stff.hiredate<ep.hiredate;


/*������ ������ ���� �̸��� ������, �������ڸ� ���������� ������������ ����ϱ�*/
select cu.name, bk.bookname, od.orderdate
from customer cu, book bk, orders od 
where cu.custid=od.custid
and od.bookid=bk.bookid
order by od.orderdate asc;


/*�ű� ����� ���� ����*/
create user dituser1
IDENTIFIED BY ditdb20;

create user InYoung
IDENTIFIED BY ditdb20;


/*����� ���� ���� �� ����*/
/*alter user InYoung
identified by ditdb20;

drop user dituser1 cascade; /*cascade: �������Ἲ�� �����ϱ� ����*/
*/

GRANT CONNECT, RESOURCE to InYoung;


