/* 최소급여를 받는 사원의 이름, 업무, 급여를 표시 
최소급여 : 서브쿼리, 사원의 이름 : ename, 업무 : job, 급여 : salary*/
 select ename, job, salary
 from employee
 where salary = (select min(salary)
 from employee);
 
 /* 부서별 최소 급여를 받는 사원의 사원번호와 이름을 출력하는 쿼리
 -부서별 최소 급여를 출력 - > 서브쿼리 / dno, salary추가하기 */
 select dno, eno, ename, salary
 from employee
 where salary in (select min(salary)
                  from employee
                  group by dno);
                  
                  
/* < any : 최대값보다 작다.
   > any : 최소값보다 크다. */              
select eno, ename, job, salary
from employee
where salary < any (select salary   /* (select ~ 'SALESMAN')까지가 서브쿼리 */
        from employee
        where job = 'SALESMAN')  
        and job <> 'SALESMAN';
 
 
 /* 담당 업무가 분석가(analyst)인 사원(의 salary가 서브쿼리) 보다 
 급여가 적으면서(최대값보다 작다) 업무가 분석가가 아닌 사원들을 표시 
 / 사원번호, 이름, 업무, 급여 표시
 any사용 */
 select dno, ename, job, salary
 from employee
 where salary < any (select salary
        from employee
        where job = 'ANALYST')
        and job <> 'ANALYST';
        
        
/* 급여가 평균보다 많은 사원들의 사원번호와 이름, 급여를 표시하되
결과를 급여에 대해서 오름차순으로 정렬 ( 단일행, order by사용(정렬)) */
select eno, ename, salary
from employee
where salary > (select avg(salary)
        from employee)
order by salary asc;


/* 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시
IN연산자 사용 */
select eno, ename
from employee
where dno in(select dno
from employee
where ename like '%K%');

desc book;

/* 가격이 20000원 이상인 도서의 이름 */
select bookname
from book
where price >= 20000;

/* 서점 도서의 총 개수 */
select count(*)
from book;

/* 서점에 도서를 입고하는 출판사의 총 개수 */
select count(distinct publisher)
from book;


/* 19년 7월 4일 ~ 7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호 */
select orderid
from orders
where orderdate not between '19/7/4' and '19/7/7';

desc customer;

/* 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 주소 */
select name, address
from customer
where name like '김%아';

desc orders;

/* 2번 김연아 고객이 주문한 도서의 총 판매액 */
select sum(saleprice)
from orders
where orderid=2;


/* 고객별로 주문한 도서의 총 수량과 총 판매액 */
select count(*) as "도서수량", sum(saleprice) as "총액"
from orders
group by custid;


/* 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별로 주문 도서의 총 수량을 구하기
단, 두 권 이상 구매한 고객만 구함 
select count(orderid)
from orders
group by custid
where */


desc book;

/* 가장 비싼 도서의 이름과 가격 출력 
단일 행 서브쿼리 사용 */
select bookname, price
from book
where price = (select max(price)
from book);


desc orders
desc customer

/* 도서를 구매한 이력이 있는 고객 이름 출력
다중 행 서브쿼리 사용 */
select name
from customer
where custid in(select custid 
    from orders);
    
    
    /* 기본키 숫자형
    문자형 크기 30 널 허용 안함
    문자형 크기 30 널 허용 안함
    문자형 크기 60
    문자형 크기 15 널 허용 안함
    문자형 크기 10 널 허용 안함 */
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