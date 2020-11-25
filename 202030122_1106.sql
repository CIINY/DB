drop table dept_second;
drop table dept_third;

create table dept_second(
    dno number(2) constraint pk_dept_second primary key,
    dname varchar2(14),
    loc varchar2(13)
    );

insert into dept_second
values(10, '������', '����');

insert into dept_second(dno, dname)
values(20, '�ѹ���');

select * from dept_second;

create table Customer1(
    id VARCHAR2(20) constraint Customer1_id_uk unique,
    pwd VARCHAR2(20) constraint Customer1_pwd_nn not null,
    name VARCHAR2(20) constraint Customer1_name_nn not null,
    phone VARCHAR2(30),
    address VARCHAR2(100)
);

insert into customer1
values('greentea', '1234', '�����ư���', '010-111-1111', 'seoul');

select * from customer1;

insert into customer1
values('greentea', '3456', '�����ư���', '010-111-1111', 'seoul');

insert into customer1
values(null, '3456', '�����ư���', '010-111-1111', 'seoul');

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
values(2, '��浿');

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
values(8000, '����ȭ', 50);


alter table emp_copy
disable constraint emp_copy_dno_fk;


select table_name, constraint_name, status
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');



/*
employee ���̺��� ������ �����Ͽ� emp_sample ���̺� ����(��������, where 1=0;)
- �����ȣ(eno)�� �⺻Ű�� �ϴ� �������� �߰��ϱ�
- �μ���ȣ(dno)�� �ܷ�Ű�� �ϴ� �������� �߰��ϱ�
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
values(1, 'ȫ�浿', 10);
/*���� ���Ἲ �������� ���Ͽ� �ؿ� sql���� ������ ����. �μ���ȣ�� 10~40�����ۿ� ����*/
insert into emp_sample(eno, ename, dno)
values(2, '��浿', 50);

insert into emp_sample(eno, ename, dno)
values(2, '��浿', 40);

select table_name, constraint_name, status  /*constraint_name : �������� �̸�*/
from user_constrints
where talbe_name='EMP_SAMPLE';  /*������ �빮�ڸ� ����ؾ��Ѵ�*/

alter table emp_sample
disable constraint sys_c007110;

insert into emp_sample(eno, ename, dno)
values(3, '�ڱ浿', 50);

/*������ : ���̺��� ������ ���ڸ� �ڵ����� ������ ��, ������ ���ڸ� �����ص� �� �ڿ� �� ���� ��� �Ұ���*/

/*? ���� ���� 10�̰� 10�� �����ϴ� ������ �����ϱ�*/
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

update dept_copy1       /*�� �ٲٱ����ؼ� �̷�������. ������ �� �ٲٴ� ���� ���� ����*/
set dnmae='HR';

update dept_copy1       /*�μ���ȣ�� 10���� �Ϳ� �̸��� PROGRAMMING����, ������ SEOUL�� �ٲ۴�.*/
set dname='PROGRAMMING', loc='SEOUL'
where dno=10;

delete dept_copy1
where dno=10;       /*�μ���ȣ 10���� ����, where�� �����´ٸ� ��� ���� �� �� �����*/
/* update�� where�� ��Ʈ��� ����ϱ�. */
select * from dept_copy2;       /*�μ���ȣ 10���� �����Ǿ� ����*/

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
