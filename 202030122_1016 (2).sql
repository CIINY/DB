select ename, salary
from employee
where salary > (select salary
                from employee
                where ename='SCOTT');
            
            
select ename, job, salary
from employee
where salary > (select min(salary)
                from employee);
              
              
select ename, job, salary
from employee
where salary =(select min(salary)
                from employee);
                
        
select ename, dno
from employee
where dno = ( select dno
                from employee
                where ename='SCOTT');
                
                
select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno=30);
                        
          
select ename, job
from employee
where job = (select job
            from employee
            where eno=7788);
           
           
