--EXCEPTIONS

1) pre defined
2) non pre defined
3) user defined 




DECLARE
V_Empno Emp.Empno%TYPE := &Empno;
V_Ename Emp.Ename%TYPE;
V_Sal Emp.Sal%TYPE;
BEGIN
SELECT Ename, Sal INTO V_Ename, V_Sal
FROM Emp
WHERE Empno = V_Empno;
DBMS_OUTPUT.PUT_LINE('Name : '||V_Ename||' Salary : '||V_Sal);
END;
/


DECLARE
V_Empno Emp.Empno%TYPE := &Empno;
V_Ename Emp.Ename%TYPE;
V_Sal Emp.Sal%TYPE;
BEGIN
SELECT Ename, Sal INTO V_Ename, V_Sal
FROM Emp
WHERE Empno = V_Empno;
DBMS_OUTPUT.PUT_LINE('Name : '||V_Ename||' Salary : '||V_Sal);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Sorry, Data is Not Found.');
END;
/


DECLARE
V_Emp Emp%ROWTYPE;
V_Sal Emp.Sal%TYPE := &Sal;
BEGIN
SELECT * INTO V_Emp
FROM Emp
WHERE Sal = V_Sal;
DBMS_OUTPUT.PUT_LINE('Name : '||V_Emp.Ename||' Salary : '||V_Emp.Sal);
END ;
/


DECLARE
V_Emp Emp%ROWTYPE;
V_Sal Emp.Sal%TYPE := &Sal;
BEGIN
SELECT * INTO V_Emp
FROM Emp
WHERE Sal = V_Sal;
DBMS_OUTPUT.PUT_LINE('Name : '||V_Emp.Ename||' Salary : '||V_Emp.Sal);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('More Than One Employee Having Same Salary');
END ;
/



DECLARE
V_Emp Emp%ROWTYPE;
V_Sal Emp.Sal%TYPE := &Sal;
BEGIN
SELECT * INTO V_Emp
FROM Emp
WHERE Sal = V_Sal;
DBMS_OUTPUT.PUT_LINE('Name : '||V_Emp.Ename||' Salary : '||V_Emp.Sal);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('More Than One Employee Having Same Salary');
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Sorry, Data is Not Found.');
END ;
/


DECLARE
V_Empno VARCHAR2(4):='&Empno';
V_Ename VARCHAR2(20):='&Ename';
V_Deptno VARCHAR2(2):='&Deptno';
BEGIN
INSERT INTO Emp(Empno,Ename,Deptno)
VALUES (V_Empno,V_Ename,V_Deptno);
EXCEPTION
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE('Given Employee Number or Department Number is Invalid');
END ;
/


DECLARE
V_Num1 NUMBER;
BEGIN
V_Num1 := '&GiveNumber1' + '&GiveNumber2';
DBMS_OUTPUT.PUT_LINE ('The Result of the Operation is: ' || V_Num1);
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('Please Check - There is a Source of Invalid Values in your input (OR) Operations.');
END ;


CREATE TABLE Messages
(
Results VARCHAR2(200)
)


SELECT * FROM Messages;


DECLARE
V_Ename Emp.Ename%TYPE;
V_Sal Emp.Sal%TYPE := &Sal;
BEGIN
SELECT Ename INTO V_Ename
FROM Emp
WHERE Sal = V_Sal;
INSERT INTO Messages(Results)
VALUES(USER||' Queried for Salary of '||V_Sal||' and '||V_Ename||' was
Found.');
EXCEPTION
WHEN NO_DATA_FOUND THEN
INSERT INTO Messages(Results)
VALUES(USER||' Queried For '||V_Sal||' Salary on '||TO_CHAR(SYSDATE,'DD,
Month YYYY, HH24:MI:SS')||' And The Requested Salary Was Not Found.');
WHEN TOO_MANY_ROWS THEN
INSERT INTO Messages(Results)
VALUES(USER||' Queried For '||V_Sal||' Salary on
'||TO_CHAR(SYSDATE,'FMDD, Month YYYY, HH24:MI:SS')||' And Many Records Were
Matching Upon That Salary Hence Query Failed To Retrieve The Data.');
WHEN OTHERS THEN
INSERT INTO Messages(Results)
VALUES(USER||' Executed For Some Data '||TO_CHAR(SYSDATE,'FMDD, Month
YYYY, HH24:MI:SS')||' And Administrators Attention is Expected.');
END ;
/


------ Non pre-defined

DECLARE
E_EmpRemaining EXCEPTION;
PRAGMA EXCEPTION_INIT(E_EmpRemaining, -2292);
V_Deptno Emp.Deptno%TYPE := &GiveDeptno;
BEGIN
DELETE FROM Dept
WHERE Deptno = V_Deptno;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('The Given Information is Missing in the Database,
Check for Proper Values.');
END IF;
ROLLBACK;
END;
/



DECLARE
E_EmpRemaining EXCEPTION;
PRAGMA EXCEPTION_INIT(E_EmpRemaining, -2292);
V_Deptno Emp.Deptno%TYPE := &GiveDeptno;
BEGIN
DELETE FROM Dept
WHERE Deptno = V_Deptno;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('The Given Information is Missing in the Database,
Check for Proper Values.');
END IF;
ROLLBACK;
EXCEPTION
WHEN E_EmpRemaining THEN
DBMS_OUTPUT.PUT_LINE('Unable to Delete the Department Number '||V_Deptno||'
as the Employees are Existing. Validate Your Relations and then Try Once
Again.');
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('The Given Information is Missing in the Database,
Check for Proper Values.');
END;
/



 
ALTER TABLE emp MODIFY(deptno CONSTRAINT emp_deptno_nn NOT NULL);

 
DECLARE
E_NotNULLViolation EXCEPTION;
PRAGMA EXCEPTION_INIT(E_NotNULLViolation, -1400);
BEGIN
INSERT INTO Emp(Empno, Ename, Job, Sal, Comm, Deptno)
VALUES(&Empno, 'SATISH', 'ANALYST', 25000, NULL, &Deptno);
COMMIT;
EXCEPTION
WHEN E_NotNULLViolation THEN
DBMS_OUTPUT.PUT_LINE('A Field which Cannot be NULL, is not attended, Please
Check Properly...');
END;
/



--SQLCODE, SQLERRM

-1  = DUP_VAL_ON_INDEX
+1  = User Defined Exception
100 = NO_DATA_FOUND

DECLARE
V_ErrorCode NUMBER(6);
V_ErrorMessage VARCHAR2(200);
BEGIN
INSERT INTO Dept
VALUES(&DeptNumber, '&DeptName', '&DeptLocation');
--EXCEPTION
--WHEN OTHERS THEN
--V_ErrorCode := SQLCODE;
--V_ErrorMessage := SUBSTR(SQLERRM, 1, 200);
--DBMS_OUTPUT.PUT_LINE('The Error Code Traced is : '||V_ErrorCode);
--DBMS_OUTPUT.PUT_LINE('The Error Message Traced is : '||V_ErrorMessage);
END;
/


DECLARE
V_ErrorCode NUMBER(6);
V_ErrorMessage VARCHAR2(200);
BEGIN
INSERT INTO Dept
VALUES(&DeptNumber, '&DeptName', '&DeptLocation');
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('Sorry Department Number Cannot Be Duplicated');
WHEN OTHERS THEN
V_ErrorCode := SQLCODE;
V_ErrorMessage := SUBSTR(SQLERRM, 1, 200);
DBMS_OUTPUT.PUT_LINE('The Error Code Traced is : '||V_ErrorCode);
DBMS_OUTPUT.PUT_LINE('The Error Message Traced is : '||V_ErrorMessage);
END;



CREATE TABLE MyAudit
(
UserName VARCHAR2(15),
ModDate DATE,
Message VARCHAR2(100)
);


CREATE TABLE TrappedMessages
(
ErrorNum NUMBER(6),
ErrorMsg VARCHAR2(250),
TrapDate DATE
);




BEGIN
INSERT INTO Dept
VALUES(&DeptNumber, '&DeptName', '&DeptLocation');
COMMIT;
INSERT INTO MyAudit(UserName,ModDate)
VALUES(USER, SYSDATE);
COMMIT;
EXCEPTION
WHEN OTHERS THEN
      DECLARE
      V_ErrorCode NUMBER(6);
      V_ErrorMessage VARCHAR2(200);
      BEGIN
      V_ErrorCode := SQLCODE;
      V_ErrorMessage := SUBSTR(SQLERRM, 1, 200);
      DBMS_OUTPUT.PUT_LINE('The Error Code Traced is : '||V_ErrorCode);
      DBMS_OUTPUT.PUT_LINE('The Error Message Traced is : '||V_ErrorMessage);
      INSERT INTO TrappedMessages(ErrorNum, ErrorMsg, TrapDate)
      VALUES(V_ErrorCode, V_ErrorMessage, SYSDATE);
      COMMIT;
      END;
END;
/



--user defined exceptions

DECLARE
V_DeptNo Dept.Deptno%TYPE := &DeptNumber;
V_DeptName Dept.Dname%TYPE := '&DeptName';
V_DeptLoc Dept.Loc%TYPE := '&DeptLocation';
E_InvalidDept EXCEPTION;
BEGIN
UPDATE Dept
SET Dname = V_DeptName,
Loc = V_DeptLoc
WHERE Deptno = V_DeptNo;
END;
/





DECLARE
V_DeptNo Dept.Deptno%TYPE := &DeptNumber;
V_DeptName Dept.Dname%TYPE := '&DeptName';
V_DeptLoc Dept.Loc%TYPE := '&DeptLocation';
E_InvalidDept EXCEPTION;
BEGIN
UPDATE Dept
SET Dname = V_DeptName,
Loc = V_DeptLoc
WHERE Deptno = V_DeptNo;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('The Specific Department Number '||V_DeptNo||' you wanted to Update is not Found. Please Confirm the Data.');
ENd IF;
END;
/



DECLARE
V_DeptNo Dept.Deptno%TYPE := &DeptNumber;
V_DeptName Dept.Dname%TYPE := '&DeptName';
V_DeptLoc Dept.Loc%TYPE := '&DeptLocation';
E_InvalidDept EXCEPTION;
BEGIN
UPDATE Dept
SET Dname = V_DeptName,
Loc = V_DeptLoc
WHERE Deptno = V_DeptNo;
IF SQL%NOTFOUND THEN
RAISE E_InvalidDept;
ENd IF;
COMMIT;
EXCEPTION
WHEN E_InvalidDept THEN
DBMS_OUTPUT.PUT_LINE('The Specific Department Number '||V_DeptNo||' you wanted to Update is not Found. Please Confirm the Data.');
INSERT INTO MyAudit(UserName, ModDate, Message)
VALUES(USER, SYSDATE, 'Tried Illegal Update.');
END;
/


DECLARE
V_Ename Emp.Ename%TYPE;
V_Job Emp.Job%TYPE;
E_ManyEmployees EXCEPTION;
CURSOR EmpCursor IS SELECT MGR, COUNT(*) Tot_Emp FROM Emp WHERE MGR IS NOT NULL GROUP BY MGR;
BEGIN
FOR MgrRecord IN EmpCursor
LOOP
BEGIN
SELECT Ename, Job INTO
V_Ename, V_Job
FROM Emp WHERE Empno = MgrRecord.Mgr;
IF MgrRecord.Tot_Emp > 3 THEN
RAISE E_ManyEmployees;
ELSE
DBMS_OUTPUT.PUT_LINE('Employee, '||V_Ename||' Manages'||MgrRecord.Tot_Emp||' Employees.');
END IF;
EXCEPTION
WHEN E_ManyEmployees THEN
DBMS_OUTPUT.PUT_LINE('Employee, '||V_EName||' Manages Many Employees, Chance of decreasing his Performance, Recommend for Extra Allowances or Emoluments.');
END;
END LOOP;
END;
/



--RAISE_APPLICATION_ERROR PACKAGE = For changing error messages of predefined Exceptions.

DECLARE
V_Empno Emp.Empno%TYPE := &GEmpno;
V_Ename Emp.Ename%TYPE;
BEGIN
SELECT Ename INTo V_Ename
FROM Emp
WHERE Empno = V_Empno;
--EXCEPTION
--WHEN NO_DATA_FOUND THEN
--DBMS_OUTPUT.PUT_LINE('Sorry Data Not Found');
END;
/



DECLARE
V_Empno Emp.Empno%TYPE := &GEmpno;
V_Ename Emp.Ename%TYPE;
BEGIN
SELECT Ename INTo V_Ename
FROM Emp
WHERE Empno = V_Empno;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20220, 'Sorry Data Not Found');
END;
/


DECLARE
V_Deptno Dept.Deptno%TYPE := &Deptno;
V_TotEmp NUMBER;
E_InvalidDept EXCEPTION;
BEGIN
IF V_Deptno NOT IN (10, 20, 30, 40) THEN
RAISE E_InvalidDept;
ELSE
SELECT COUNT(*) INTO
V_TotEmp FROM Emp
WHERE Deptno = V_Deptno;
DBMS_OUTPUT.PUT_LINE('The Total Employees in '||V_Deptno||' are'||V_TotEmp||'.');
END IF;
DBMS_OUTPUT.PUT_LINE('No Exception was Raised...');
EXCEPTION
WHEN E_InvalidDept THEN
RAISE_APPLICATION_ERROR(-20220, 'Sorry There is no Such Department...as You requested.');
END;
/



