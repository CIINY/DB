select name, sum(saleprice) as "총판매액"
from customer, orders
where customer.custid = orders.custid
group by name
order by name;


/*주문 테이블의 bookid를 외래키로 수정하기*/
alter table orders
add foreign key(bookid) references book(bookid);


/*테이블 별칭 설정하기*/
/*select * from*/


/*고객이름과 고객이 주문한 도서의 이름 조회하기*/
select name, bookname
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid;


/*가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름 조회하기*/
select name, bookname
from customer cu, orders od, book bk
where cu.custid=od.custid
and od.bookid=bk.bookid
and price=20000;


/*ename이 BLAKE인 사원이 관리하는 부하사원의 ename과 job 출력하기 + 사원번호, 담당자*/
select stff.eno, stff.ename, stff.job, stff.manager
from employee stff, employee mgr
where stff.manager=mgr.eno and mgr.ename like 'BLAKE';


/*도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격 조회하기
left outer join        where이 들어가지 않음*/
select name, saleprice
from customer left outer join
orders on customer.custid=orders.custid;


/*데이터베이스 기말 프로젝트 : 기본적으로 join속성들은 반드시 사용해야 한다.*/


/*where 적으면 에러 남*/
select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid=od.bookid
order by bk.bookid;


/*도서별 판매 갯수 , where대신 on을 써야 함
책이 몇권 팔렸는가. book테이블을 기준으로 할 것.*/
select bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.bookname;


/*출판사별 판매 갯수
salecount : 별칭*/
select bk.publisher, count(od.bookid) as "salecount"
from book bk left outer join orders od
on bk.bookid=od.bookid
group by bk.publisher;


/*scott 사원의 부서번호와 부서이름을 출력하기*/
select dno, eno
from employee 
where ename like 'SCOTT';

select dp.dno, dp.dname
from department dp, employee ep
where dp.dno=ep.dno and ep.ename like 'SCOTT';


/*셀프 조인을 사용하여 관리자보다 입사일이 빠른 사원 출력하기*/
select stff.ename, stff.job, stff.hiredate, ep.ename as "managername"
from employee stff, employee ep
where stff.manager=ep.eno 
and stff.hiredate<ep.hiredate;


/*도서를 구매한 고객의 이름과 도서명, 구입일자를 구입일자의 오름차순으로 출력하기*/
select cu.name, bk.bookname, od.orderdate
from customer cu, book bk, orders od 
where cu.custid=od.custid
and od.bookid=bk.bookid
order by od.orderdate asc;


/*신규 사용자 계정 생성*/
create user dituser1
IDENTIFIED BY ditdb20;

create user InYoung
IDENTIFIED BY ditdb20;


/*사용자 계정 수정 및 삭제*/
/*alter user InYoung
identified by ditdb20;

drop user dituser1 cascade; /*cascade: 참조무결성을 유지하기 위해*/
*/

GRANT CONNECT, RESOURCE to InYoung;


