create table dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(13), 
    primary key (dno)
);
    
create table dept_second
as
select *
from department;

select * from dept_second;

create table dept20
as
select eno, ename, salary*12 annsal
from employee
where dno=20;

select * from dept20;

create table depth_third
as
select dno, dname
from dept
where 0=1;

desc dept_third;
select * from dept_third;

ALTER TABLE dept20
add(birth data);
/* add birth data */

desc dept20;

alter table dept20
    modify ename varchar2(30);

desc dept20;

alter table dept20
    drop column ename;

desc dept20;



create table NewBook(
    bookid NUMBER,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price NUMBER,
    PRIMARY KEY (bookid)
);

/*practice*/
desc NewBook;

alter table NewBook
    add isbn varchar2(13);
    
desc NewBook;

alter table NewBook
    modify isbn number;

desc NewBook;

alter table NewBook
    drop column isbn;

desc NewBook;

alter table NewBook
    modify bookname number not null;
    
desc NewBook;


/*rename*/
rename dept20 to emp20;
desc dept20;
desc emp20;

drop table emp20;
desc emp20;

drop table dept_second;

select * from dept_second;

truncate table dept_second;
select * from dept_second;

desc dept_second;




/* 교수님께서 강의 영상에서 말씀하셨던대로 한 번 실행했던 코드를 다시 실행하면 
오류가 떴었습니다. 한 명령문씩 실행을 했어야했는데 스크립트 실행 버튼을 자주 눌렀다가
전체적으로 여러 오류가 떴고 이것저것 만져보았습니다만 더더욱 되돌릴 수 없게 되어버린 것 같습니다.
새로운 서버를 만들어 거기에서도 다시 해보았지만 생각해보니 같은 계정(?) 이여서 똑같은 결과가
나오게 되었습니다. 초반에 실습코드를 입력하고 출력 했을 시엔 어느 정도 정상으로 떴지만
지금은 객체가 존재하지 않습니다 같은 말들이 많이 뜨게 되었습니다. 접속창에서 서버의 테이블목록을
건드려 이렇게 된 건지는 모르겠지만 어찌 해야할 지 모르겠어서 일단 다시 입력하여 제출하게 되었습니다.*/