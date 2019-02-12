<<EmpSearch>>
DECLARE
V_Empno Emp.Empno%TYPE := &PEmpno;
V_Ename Emp.Ename%TYPE;
BEGIN
SELECT Ename INTO V_Ename
FROM Emp
WHERE Empno = V_Empno;
DBMS_OUTPUT.PUT_LINE(V_Ename);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Sorry!');
END EmpSearch;
/



CREATE OR REPLACE PROCEDURE
EmpSearch(PEmpno Emp.Empno%TYPE)
IS
V_Empno Emp.Empno%TYPE := PEmpno;
V_Ename Emp.Ename%TYPE;
BEGIN
SELECT Ename INTO V_Ename
FROM Emp
WHERE Empno = V_Empno;
DBMS_OUTPUT.PUT_LINE(V_Ename);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Sorry!');
END EmpSearch;
/

EXEC EmpSearch(7839);

BEGIN
EmpSearch(&GEmpno);
END;
/



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



<<GetEnameSalJob00>>
DECLARE
PEmpno Emp.Empno%TYPE := &pEmpno;
V_Ename Emp.Ename%TYPE;
V_Sal Emp.Sal%TYPE;
V_Job Emp.Job%TYPE;
BEGIN
SELECT
Ename, Sal, Job
INTO
V_Ename, V_Sal, V_Job
FROM Emp
WHERE Empno = PEmpno;
DBMS_OUTPUT.PUT_LINE('The Details of Employee '||PEmpno||' Are...');
DBMS_OUTPUT.PUT_LINE('The Name of The Employee is : '||V_Ename);
DBMS_OUTPUT.PUT_LINE('The Salary of The Employee is : '||V_Sal);
DBMS_OUTPUT.PUT_LINE('The Job of The Employee is : '||V_Job);
END GetEnameSalJob00;
/



CREATE OR REPLACE PROCEDURE
GetEnameSalJob00
(
PEmpno Emp.Empno%TYPE
)
AS
V_Ename Emp.Ename%TYPE;
V_Sal Emp.Sal%TYPE;
V_Job
Emp.Job%TYPE;
BEGIN
SELECT
Ename, Sal, Job
INTO
V_Ename, V_Sal, V_Job
FROM Emp
WHERE Empno = PEmpno;
DBMS_OUTPUT.PUT_LINE('The Details of Employee '||PEmpno||' Are...');
DBMS_OUTPUT.PUT_LINE('The Name of The Employee is : '||V_Ename);
DBMS_OUTPUT.PUT_LINE('The Salary of The Employee is : '||V_Sal);
DBMS_OUTPUT.PUT_LINE('The Job of The Employee is : '||V_Job);
END GetEnameSalJob00;
/

EXEC GetEnameSalJob00(7839);

--------------
CREATE OR REPLACE PROCEDURE
EmpInsert
(
P_Empno Emp.Empno%TYPE,
P_Ename Emp.Ename%TYPE,
P_Sal Emp.Sal%TYPE,
P_Deptno Emp.Deptno%TYPE,
P_Job Emp.Job%TYPE,
P_Comm
Emp.Comm%TYPE,
P_HireDate Emp.HireDate%TYPE,
P_MGR Emp.MGR%TYPE
)
AS
BEGIN
INSERT INTO
Emp (Empno, Ename, Sal, Deptno, Job, Comm, HireDate, MGR)
VALUES
(P_Empno, UPPER(P_Ename), P_Sal, P_Deptno, UPPER(P_Job), P_Comm,P_HireDate, P_MGR);
COMMIT;
Exception
WHEN DUP_VAL_ON_INDEX THEN
RAISE_APPLICATION_ERROR(-20001, 'Employee already exists');

WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20011, SQLERRM);
END;
/


DECLARE
TYPE EmpRecord
IS RECORD
(
Empno Emp.Empno%TYPE,
Ename Emp.Ename%TYPE,
Sal Emp.Sal%TYPE,
Deptno Emp.Deptno%TYPE,
Job Emp.Job%TYPE,
Comm Emp.Comm%TYPE,
HireDate Emp.HireDate%TYPE,
MGR Emp.MGR%TYPE
);
V_EmpRecord EmpRecord;
BEGIN
V_EmpRecord.Empno := &SEmpno;
V_EmpRecord.Ename := '&SEname';
V_EmpRecord.Sal := &SSal;
V_EmpRecord.Deptno := &SDeptno;
V_EmpRecord.Job := '&SJob';
V_EmpRecord.Comm := &SComm;
V_EmpRecord.HireDate := &SHireDate;
V_EmpRecord.MGR := &SMGR;
EmpInsert(
V_EmpRecord.Empno,
V_EmpRecord.Ename,
V_EmpRecord.Sal,
V_EmpRecord.Deptno,
V_EmpRecord.Job,
V_EmpRecord.Comm,
V_EmpRecord.HireDate,
V_EmpRecord.MGR
)
;
END;
/



CREATE OR REPLACE PROCEDURE OddNumber(Num1 NUMBER, Num2 NUMBER)
IS
MyNum NUMBER(4);
BEGIN
MyNum := Num1;
WHILE MyNum < Num2 LOOP
IF MOD(MyNum,2) != 0 THEN
DBMS_OUTPUT.PUT_LINE('The Odd Number : '||MyNum);
End IF;
MyNum := MyNum +1;
END LOOP;
END;
/

EXEC OddNumber(10, 25)
EXEC OddNumber(25, 10)
EXEC OddNumber(Num2 => 25, Num1 => 10)


--out

CREATE OR REPLACE PROCEDURE
FindEmp
(I_Empno IN NUMBER,O_Ename OUT VARCHAR2,O_Job OUT VARCHAR2)
AS
BEGIN
SELECT Ename, Job INTO O_Ename, O_Job
FROM Emp WHERE Empno = I_Empno;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Error in Finding the Details of Employee Number : '||I_Empno);
END FindEmp;
/



DECLARE
V_Ename Emp.Ename%TYPE;
V_Job Emp.Job%TYPE;
BEGIN
FindEmp(7839, V_Ename, V_Job);
DBMS_OUTPUT.PUT_LINE('Employee 7839 is : '|| V_Ename||','||V_Job||'.');
END;
/


--inout

 Create or replace procedure p_square
 (a in out number)  is
 begin
  a := a * a ;
 end;
 
 
 var n number
 exec :n  := 5;  -- initializing variable at SQL 
 exec p_square(:n);
 print  n  



 
 ---Functions
 
CREATE OR REPLACE FUNCTION Factorial(Num NUMBER)
RETURN NUMBER
IS
Fact NUMBER(4) := 1;
BEGIN
FOR MyIndex IN REVERSE 1..Num
LOOP
Fact := Fact * MyIndex;
END LOOP;
RETURN Fact;
END;
/


EXEC Factorial(5)

SELECT Factorial(5) Fact FROM DUAL;



DECLARE
V_Factorial NUMBER(4) := 0;
BEGIN
V_Factorial := Factorial(5);
DBMS_OUTPUT.PUT_LINE('The Factorial is : '||V_Factorial);
END;
/



CREATE OR REPLACE FUNCTION EmpExp(V_Empno NUMBER)
RETURN NUMBER
IS
V_HireDate Emp.HireDate%TYPE;
V_Exp NUMBER(4,2) := 1;
BEGIN
SELECT HireDate INTO V_HireDate FROM Emp where empno=v_empno;
V_Exp := MONTHS_BETWEEN(SYSDATE,V_HireDate) / 12;
RETURN V_Exp;
END;
/


SELECT Ename, HireDate, MONTHS_BETWEEN(SYSDATE, HireDate) / 12 , EmpExp(Empno) EmpExp FROM Emp;




CREATE OR REPLACE FUNCTION EmpTotSal(V_Empno NUMBER)
RETURN NUMBER
IS
V_Sal Emp.Sal%TYPE;
V_Comm Emp.Comm%TYPE;
V_TotSal NUMBER(9, 2) := 1;
BEGIN
SELECT Sal, Comm INTO V_Sal, V_Comm
FROM Emp
WHERE Empno = V_Empno;
V_TotSal := V_Sal + NVL(V_Comm, 0);
RETURN V_TotSal;
END;
/


SELECT Ename, Sal, Comm, EmpTotSal(Empno) TotSal, HireDate, EmpExp(Empno) EmpExp FROM Emp;


CREATE OR REPLACE PROCEDURE
EmpInfo1(I_Deptno IN NUMBER)
AS
CURSOR EmpInfoCursor IS
SELECT Empno, Ename, Job, Sal, Comm
FROM Emp
WHERE Deptno = I_Deptno;
EmpRecord EmpInfoCursor%ROWTYPE;
NEmployees NUMBER := 0;
TSalary NUMBER := 0;
AVGSalary NUMBER(7,2) := 0;
MAXSalary NUMBER(7,2) := 0;
V_Exp NUMBER(4,2) := 1;
BEGIN
OPEN EmpInfoCursor;
LOOP
FETCH EmpInfoCursor INTO EmpRecord;
EXIT WHEN EmpInfoCursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Employee Name :'||EmpRecord.Ename);
DBMS_OUTPUT.PUT_LINE('Employee Job : '||EmpRecord.Job);
DBMS_OUTPUT.PUT_LINE('Employee Salary :'||EmpRecord.Sal);
DBMS_OUTPUT.PUT_LINE('Employee Comission : '||EmpRecord.Comm);
V_Exp := EmpExp(EmpRecord.Empno);
DBMS_OUTPUT.PUT_LINE('Employee''s Experiance : '||V_Exp);
DBMS_OUTPUT.PUT_LINE('************************************');
TSalary := TSalary + EmpRecord.Sal;
NEmployees := NEmployees + 1;
IF EmpRecord.Sal > MAXSalary THEN
MAXSalary := EmpRecord.Sal;
END IF;
END LOOP;
AVGSalary := TSalary / NEmployees;
DBMS_OUTPUT.PUT_LINE('Number of Employees :'||NEmployees);
DBMS_OUTPUT.PUT_LINE('Total Salary :'||TSalary);
DBMS_OUTPUT.PUT_LINE('Maximum Salary :'||MAXSalary);
DBMS_OUTPUT.PUT_LINE('Average Salary :'||AVGSalary);
CLOSE EmpInfoCursor;
END EmpInfo1;
/



EXEC EmpInfo(10)


CREATE OR REPLACE FUNCTION GetDeptDetails(P_Deptno NUMBER)
RETURN Dept%ROWTYPE
IS
V_DeptRec Dept%ROWTYPE;
V_Deptno Dept.Deptno%TYPE := P_Deptno;
BEGIN
SELECT * INTO V_DeptRec
FROM Dept
WHERE Deptno = V_Deptno;
RETURN V_DeptRec;
END;
/


SELECT GetDeptDetails(10) Dept10Det FROM DUAL;

DECLARE
V_DeptRec Dept%ROWTYPE;
BEGIN
V_DeptRec.Deptno := &GDeptno;
V_DeptRec := GetDeptDetails(V_DeptRec.Deptno);
DBMS_OUTPUT.PUT_LINE(V_DeptRec.Deptno||' '||V_DeptRec.DName||''||V_DeptRec.Loc);
END;
/
