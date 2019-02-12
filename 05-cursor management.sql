When ever user executes select statement or DML statements(insert , update,
delete and merge) oracle is going to allocate some private area in PGA or SGA depends on the 
process.if it is a dedicated server process it is going to create in PGA, if it is a shared
server process it is going to create in SGA.

What is cursor :-A cursor is a pointer to a private SQL area that stores information about 
the processing of a SELECT or data manipulation language (DML) statement (INSERT, UPDATE, 
DELETE, or MERGE). Cursor management of DML statements is handled by Oracle Database, but 
PL/SQL offers several ways to define and manipulate cursors to execute SELECT statements.

Types of cursors
a)Implicit cursor
b)Explicit cursor

Implicit cursor:-where user dont have control these cursors, oracle internally manages these
cursors  

cursor attributes

a)%ISOPEN:-Is going to return boolean value.If cursor is open returns TRUE else FALSE.

b)%FOUND:-:-Is going to return boolean value.if one or more records effected by the most 
recent sql statement then it will returns true else false.

c)%NOTFOUND:-Is going to return boolean value.if zero records effected by the most 
recent sql statement then it will returns true else false.

d)%ROWCOUNT:-It is going to return number.It will returns total how many rows effected by
 the most recent sql statement. 

Explicit Cursor:-Explicit cursors are designed to handle the select statements which will 
return more than one record.

1)standard cursor
   stages in Explicit cursor
   a)cursor declaration
   b)cursor opening
   c)cursor fetching
   d)cursor closing

cursor with loops:-
a)cursor with simple loop
b)cursor with while loop
c)cursor with for loop


/* cursor which returns more than one record */

 declare
 cursor emp_cur is select empno, ename from emp where deptno=10;
 v_empno emp.empno%type;
 v_ename emp.ename%type;
 begin
 open emp_cur;
 fetch emp_cur into v_empno, v_ename;
 dbms_output.put_line(v_empno||' '||v_ename);
 close emp_cur;
 end;
 /


/* Example for basic loop */

 declare
 cursor emp_cur is select empno, ename from emp where deptno=10;
 v_empno emp.empno%type;
 v_ename emp.ename%type;
 begin
 open emp_cur;
 loop
 fetch emp_cur into v_empno, v_ename;
 exit when emp_cur%notfound;
 dbms_output.put_line(v_empno||' '||v_ename);
 end loop;
 close emp_cur;
 end;
 /
 
 
 /*Example for while loop */
 
 declare
cursor emp_cur is select empno, ename from emp where deptno=10;
v_empno emp.empno%type;
v_ename emp.ename%type;
begin
open emp_cur;
fetch emp_cur into v_empno, v_ename;
while emp_cur%found
loop
dbms_output.put_line(v_empno||' '||v_ename);
fetch emp_cur into v_empno, v_ename;
end loop;
close emp_cur;
end;
/

/* Example for FOR loop */

declare
cursor emp_cur is select empno, ename from emp where deptno=10;
begin
for i in emp_cur
loop
dbms_output.put_line(i.empno||' '||i.ename);
end loop;
end;


/* cursor with arguments */

declare
cursor dept_cur(v_deptno dept.deptno%type) is select deptno, dname from dept where deptno=v_deptno;
v_deptno dept.deptno%type;
v_dname dept.dname%type;
begin
open dept_cur(10);
fetch dept_cur into v_deptno, v_dname;
dbms_output.put_line(v_deptno||' '|| v_dname);
close dept_cur;
end;

/* above cursor with out arguments */

declare
cursor dept_cur is select deptno, dname from dept where deptno=&deptno;
v_deptno dept.deptno%type;
v_dname dept.dname%type;
begin
open dept_cur;
fetch dept_cur into v_deptno, v_dname;
dbms_output.put_line(v_deptno||' '|| v_dname);
close dept_cur;
end;





/*cursor communication */

DECLARE
CURSOR dept_cur IS 
 SELECT deptno, dname 
   FROM dept;
  v_deptno dept.deptno%TYPE;
  v_dname  dept.dname%TYPE;
  
cursor emp_cur(e_deptno emp.deptno%type) is 
select ename from emp where deptno=e_deptno;
v_ename emp.ename%type;

begin
open dept_cur;
	loop
	fetch dept_cur into v_deptno, v_dname;
	exit when dept_cur%notfound;
	dbms_output.put_line('the employees belongs to department'||' '||v_dname);
		open emp_cur(v_deptno);
		loop
		fetch emp_cur into v_ename;
		exit when emp_cur%notfound;
		dbms_output.put_line(v_ename);
		end loop;
		close emp_cur;
	end loop;
	close dept_cur;
end;







DESC USER_SOURCE


COLUMN TEXT FORMAT A40
SELECT line, Text FROM USER_SOURCE WHERE NAME = 'EMPSEARCH';



CREATE OR REPLACE PROCEDURE
EmpBonus
AS
  CURSOR EmpCursor IS SELECT *  FROM Emp ;
  E_JobNotFound EXCEPTION;
BEGIN
FOR R_EmpCursor IN EmpCursor
LOOP
IF R_EmpCursor.Job = 'PRESIDENT'
THEN
UPDATE Emp
SET Sal = Sal + (Sal * 0.40)
WHERE Empno = R_EmpCursor.Empno;
DBMS_OUTPUT.PUT_LINE('The Job For Updation is '||R_EmpCursor.Job);
DBMS_OUTPUT.PUT_LINE('Old Sal : '||R_EmpCursor.Sal);
DBMS_OUTPUT.PUT_LINE('Increament Added : '||((R_EmpCursor.Sal +(R_EmpCursor.Sal * 0.40)) - (R_EmpCursor.Sal)));
DBMS_OUTPUT.PUT_LINE('The Salary With Increment is : '||(R_EmpCursor.Sal +(R_EmpCursor.Sal * 0.40)));
ELSE
IF R_EmpCursor.Job = 'MANAGER'
THEN
UPDATE Emp
SET Sal = Sal + (Sal * 0.35)
WHERE Empno = R_EmpCursor.Empno;
DBMS_OUTPUT.PUT_LINE('The Job For Updation is '||R_EmpCursor.Job);
DBMS_OUTPUT.PUT_LINE('Old Sal : '||R_EmpCursor.Sal);
DBMS_OUTPUT.PUT_LINE('Increament Added : '||((R_EmpCursor.Sal +(R_EmpCursor.Sal * 0.40)) - (R_EmpCursor.Sal)));
DBMS_OUTPUT.PUT_LINE('The Salary With Increment is :'||(R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)));
ELSE
IF R_EmpCursor.Job = 'ANALYST'
THEN
UPDATE Emp
SET Sal = Sal + (Sal * 0.30)
WHERE Empno = R_EmpCursor.Empno;
DBMS_OUTPUT.PUT_LINE('The Job For Updation is'||R_EmpCursor.Job);
DBMS_OUTPUT.PUT_LINE('Old Sal : '||R_EmpCursor.Sal);
DBMS_OUTPUT.PUT_LINE('Increament Added : '||((R_EmpCursor.Sal+(R_EmpCursor.Sal * 0.40)) - (R_EmpCursor.Sal)));
DBMS_OUTPUT.PUT_LINE('The Salary With Increment is :'||(R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)));
ELSE
IF R_EmpCursor.Job = 'SALESMAN'
THEN
UPDATE Emp
SET Sal = Sal + (Sal * 0.25)
WHERE Empno = R_EmpCursor.Empno;
DBMS_OUTPUT.PUT_LINE('The Job For Updation is'||R_EmpCursor.Job);
DBMS_OUTPUT.PUT_LINE('Old Sal : '||R_EmpCursor.Sal);
DBMS_OUTPUT.PUT_LINE('Increament Added :'||((R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)) - (R_EmpCursor.Sal)));
DBMS_OUTPUT.PUT_LINE('The Salary With Increment is :'||(R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)));
ELSE
DBMS_OUTPUT.PUT_LINE('The Job For Updation is:'||R_EmpCursor.Job);
DBMS_OUTPUT.PUT_LINE('Old Sal :'||R_EmpCursor.Sal);
DBMS_OUTPUT.PUT_LINE('Increament Added :'||((R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)) - (R_EmpCursor.Sal)));
DBMS_OUTPUT.PUT_LINE('The Salary With Increment is : '||(R_EmpCursor.Sal + (R_EmpCursor.Sal * 0.40)));
END IF;
END IF;
END IF;
END IF;
END LOOP;
EXCEPTION
WHEN E_JobNotFound THEN
DBMS_OUTPUT.PUT_LINE('The Respective Job is Not Found...Please Verify!');
END EmpBonus;
/




EXEC EmpBonus;

ROLLBACK;






2)Dynamic cursor or REF cursor





CREATE OR REPLACE PROCEDURE TEST_REF(pc_Result OUT SYS_REFCURSOR)
AS
BEGIN
OPEN pc_RESULT FOR SELECT * FROM EMP;
END;
/


var res refcursor;
exec TEST_REF(:res);
print res;




create or replace procedure TAB_DISP(rc out sys_refcursor)
as
begin
if to_char(sysdate,'DY') ='SAT'  then
open rc for select * from emp;
elsif to_char(sysdate,'DY') ='SUN'  then
open rc for select * from dept;
else
open rc for select * from dual;
end if;
end;
/

var res refcursor;
exec TAB_DISP(:res);
print res;