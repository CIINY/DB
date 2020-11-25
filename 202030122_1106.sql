drop table dept_second;
drop table dept_third;

create table dept_second(
    dno number(2) constraint pk_dept_second primary key,
    dname varchar2(14),
    loc varchar2(13)
    );

insert into dept_second
values(10, '영업부', '서울');

insert into dept_second(dno, dname)
values(20, '총무부');

select * from dept_second;

create table Customer1(
    id VARCHAR2(20) constraint Customer1_id_uk unique,
    pwd VARCHAR2(20) constraint Customer1_pwd_nn not null,
    name VARCHAR2(20) constraint Customer1_name_nn not null,
    phone VARCHAR2(30),
    address VARCHAR2(100)
);

insert into customer1
values('greentea', '1234', '녹차아가씨', '010-111-1111', 'seoul');

select * from customer1;

insert into customer1
values('greentea', '3456', '녹차아가씨', '010-111-1111', 'seoul');

insert into customer1
values(null, '3456', '녹차아가씨', '010-111-1111', 'seoul');

create table emp_second1(
    eno number CONSTRAINT emp_second1_eno_pk primary key,
    ename VARCHAR2(9),
    job VARCHAR2(10),
    dno NUMBER CONSTRAINT emp_second1_dno_fk REFERENCES department
);

insert into emp_second1
values(1, 'SMITH', 'SALESMAN', 50);

create table emp3(
    eno number constraint emp3_eno_pk primary key,
    ename VARCHAR2(10) constraint emp3_ename_nn not null,
    salary number(7,2) default 1000 constraint emp3_salary_min check(salary>0)
);

insert into emp3
values(1, 'DO', 100);

insert into emp3(eno, ename)
values(2, '김길동');

select * from emp3;

create table emp_copy
as
select * from employee;

create table dept_copy
as
SELECT * FROM department;

select table_name, constraint_name
from user_constraints
where table_name in('EMPLOYEE', 'DEPARTMENT');

alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_dno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk
foreign key(dno) references dept_copy(dno);

select table_name, constraint_name
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

insert into emp_copy
values(1, 'OIOI', 'MANAGER', null, null, null, null, 20);

SELECT * FROM emp_copy;

select * from emp_copy
where eno=1;

insert into emp_copy(eno, ename, dno)
values(8000, '윤정화', 50);


alter table emp_copy
disable constraint emp_copy_dno_fk;


select table_name, constraint_name, status
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');



/*
employee 테이블의 구조를 복사하여 emp_sample 테이블 생성(서브쿼리, where 1=0;)
- 사원번호(eno)를 기본키로 하는 제약조건 추가하기
- 부서번호(dno)를 외래키로 하는 제약조건 추가하기
*/
create table emp_sample
as
select * from employee
where 1=0;

alter table emp_sample
add constraint emp_sample_eno_pk PRIMARY KEY(eno);

alter table emp_sample
add PRIMARY KEY(dno)REFERENCES department(dno);

select * from emp_sample;

insert into emp_sample(eno, ename, dno)
values(1, '홍길동', 10);
/*참조 무결성 조건으로 인하여 밑에 sql문은 에러가 난다. 부서번호는 10~40까지밖에 없음*/
insert into emp_sample(eno, ename, dno)
values(2, '김길동', 50);

insert into emp_sample(eno, ename, dno)
values(2, '김길동', 40);

select table_name, constraint_name, status  /*constraint_name : 제약조건 이름*/
from user_constrints
where talbe_name='EMP_SAMPLE';  /*무조건 대문자를 사용해야한다*/

alter table emp_sample
disable constraint sys_c007110;

insert into emp_sample(eno, ename, dno)
values(3, '박길동', 50);

/*시퀀스 : 테이블내의 유일한 숫자를 자동으로 생성해 줌, 생성한 숫자를 삭제해도 그 뒤에 그 숫자 사용 불가능*/

/*? 시작 값이 10이고 10씩 증가하는 시퀀스 생성하기*/
create sequence sample_seq
start with 10
increment by 10;

/**/
select * from dept_copy1;

create table dept_copy1
as
select * from department where 0=1;

insert into dept_copy1
values(sample_seq.nextval, 'ACCOUNTING', 'NEW YORK');

insert into dept_copy1
values(sample_seq.nextval, 'SALES', 'CHICAGO');

select * from dept_copy1;

alter table sample_seq
drop sequence 

create table dept_copy2
as
select * from department where 0=1;

insert into dept_copy2
values(10, 'ACCOUNTING', 'NEW YORK');

select * from emp_copy1;

create table emp_copy3
as
select eno, ename, job, hiredate, dno from employee where 0=1;

insert into emp_copy3
values(7000, 'CANDY', 'MANAGER', '2012/05/01', 10);

insert into emp_copy3
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

select * from emp_copy3;

desc emp_copy1;
desc emp_copy2;
desc department;

update dept_copy1
set dname='PROGRAMMING'
where dno = 10;

update dept_copy1       /*다 바꾸기위해선 이런식으로. 하지만 다 바꾸는 경우는 별로 없음*/
set dnmae='HR';

update dept_copy1       /*부서번호가 10번인 것에 이름을 PROGRAMMING으로, 지역을 SEOUL로 바꾼다.*/
set dname='PROGRAMMING', loc='SEOUL'
where dno=10;

delete dept_copy1
where dno=10;       /*부서번호 10번을 삭제, where을 안적는다면 모든 행이 싹 다 사라짐*/
/* update와 where은 세트라고 기억하기. */
select * from dept_copy2;       /*부서번호 10번이 삭제되어 있음*/

select * from emp_copy1;
select * from emp_copy3;
select * from employee;

create table dept_cp
as
select * from department;

select * from dept_cp;

delete dept_cp;
select * from dept_cp;
ROLLBACK;
select * from dept_cp;

delete dept_cp
where dno=10;
select * from dept_cp;

COMMIT;
ROLLBACK;
select * from dept_cp;
