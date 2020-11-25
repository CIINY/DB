create role programmer;

GRANT CONNECT, RESOURCE, create view TO programmer;


/*사용자 추가*/
create user dituser101      /*아이디*/
identified by ditdb20;      /*비밀번호*/

GRANT programmer to dituser101;

/*dituser11에 programmer 역할의 권한 회수*/
revoke programmer from dituser101;

/*
programmer role 삭제
drop role programmer;
*/


/*절댓값을 구하는 함수*/
select abs(-78), abs(78)
from dual;

/*반올림*/
select round(4.875, 1)
from dual;

/*지정한 자리수 이하를 버리기*/
select trunc(4.875)
from dual;


/*고객별 평균 주문 금액을 백원 단위로 반올림한 값 구하기*/
/* -2 -> 100*/
select custid "고객번호", round(AVG(saleprice), -2) "평균금액"
from orders
group by custid
order by desc;


/*
LOWER : 영문자를 모두 소문자로 변환
UPPER : 영문자를 모두 대문자로 변환
INITCAP : 첫 글자만 대문자로 변환
*/
/*employee테이블의 이름을 소문자로 담당업무는 첫 글자만 대문자로 변환*/
select ename, lower(ename), job, initcap(job)
from employee;


/*LENGTH : 문자길이 반환*/
/*BOOK 테이블의 bookid가 1인 데이터의 bookname의 글자수 출력*/
select bookname, length(bookname)
from book
where bookid=1;


/*REPLASE : 문자열을 치환*/
/*REPLASE(대상, 변경할 문자, 새 문자)*/
/*BOOK 테이블의 도서명 중 야구가 포함된 도서를 농구로 변환하기*/
/*bookname까지 한 번 더 적어줘야함. replace() + bookname이 한 덩어리다.*/
select bookid, replace(bookname, '야구', '농구') bookname, publisher, price
from book;

select * from book;


/*SUBSTR : 지정한 길이만큼의 문자열 반환*/
select substr(name, 1, 1) "성", count(*) "인원"
from customer
group by substr(name, 1, 1);


/*SYSDATE : 시스템의 현재날짜와 시간 반환*/
select sysdate from dual;

/*사원의 현재까지의 근무일수 구하기(round, sysdate사용)*/
select round(sysdate-hiredate) "근무일수"
from employee;


/*MONTHS_BETWEEN : 두 날짜 사이의 개월 수 반환*/
/*MONTHS_BETWEEN(최근 날짜, 이전날짜)*/
/*각 사원들이 근무한 개월 수*/
select ename, sysdate, hiredate,
trunc(months_between(sysdate, hiredate)) "근무월수"
from employee;


/*동의 서점은 ORDERS 테이블의 주문일로부터 10일 후 매출을 확정한다.
각 주문의 확정일자를 구하기*/
select orderid "주문번호", orderdate "주문일", orderdate+10 "확정일"
from orders;


/*TO_DATE : 문자형으로 저장된 날짜를 날짜형으로 변환하는 함수*/
/*사원 중 1981년 2월 20일에 입사한 사원 검색하기*/
select ename, hiredate
from employee
where hiredate = to_date(19810220, 'YYYYMMDD');


/*TO_CHAR : 날짜형을 문자형으로 변환하는 함수*/
/*2019년 7월7일에 주문 받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 보이시오.
단, 주문일은 'yyy-mm-dd 요일' 형태로 표시함 */
select orderid, to_char(orderdate, 'yyyy-mm-dd dy') custid, bookid
from orders
where orderdate = to_date('20190707', 'yyyymmdd');

/*
null 값을 확인하는 방법
is null : null 값을 찾을 때
is not null : null이 아닌 값을 찾을 때
employee 테이블에서 cmmission이 null인 값 찾기
*/
select *
from employee
where commission is null;  /*commission 값 안에 null값이 있습니까? 라는.*/

select *
from employee
where manager is null;

/*널 값이 없음*/
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

/*NVL : null을 다른 값으로 대치하여 연산하거나 출력하는 함수*/
/*
이름, 전화번호가 포함된 고객목록을 보이시오.
단, 전화번호가 없는 고객은 '연락처없음'으로 표시함
*/
select * from customer;

insert into customer(custid, name, address)
values(6, '손흥민', '영국 토트넘');
/*phone데이터에서 null값이 아니면 폰 번호가 뜨고, null값이면 '연락처없음'이라고 뜸*/
select name "이름", nvl(phone, '연락처없음') "전화번호"
from customer;


/*오라클에서 내부적으로 생성되는 가상 컬러믕로 SQL조회결과의 순번을 나타냄*/
/*자료를 일부분만 확인하여 처리할 때 유용함*/
/*고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이기*/
(select ROWNUM "순번", custid, name, phone
from customer);

select ROWNUM "순번", custid, name, phone
from customer
where ROWNUM <=2;

/*주소가 대한민국인 사람들만 뽑아보기*/
select *
from customer
where address like '대한민국%';

select ROWNUM "순번", custid, name, phone
from customer
where address like '대한민국%';

select * from customer;

/*실행순서대로 인하여 순번이 1, 2가 아닌 2, 1이 된 상태로 출력된다.*/
select ROWNUM "순번", custid, name, phone     /*3*/
from customer               /*1  #순서 */
where ROWNUM <=2            /*2*/
order by name;              /*4*/

/*정렬된 걸 가지고 순번을 붙이기*/
select ROWNUM "순번", custid, name, phone
from (select custid, name, phone
from customer
order by name)
where rownum <= 2;









