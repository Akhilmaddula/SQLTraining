-- Iterations in PL/SQL:
=> Loops facilitates to repeat a statement or sequence of statements multiple times.

-- Different types of loops are...:
=> BASIC OR SIMPLE LOOP
=> WHILE LOOP
=> FOR LOOP

---------------------------------------- BASIC OR SIMPLE LOOP ---------------------------------------------------------------

LOOP 
  Statements
   EXIT[When Conditional];
END LOOP;
  
EXIT Statement: Used to terminate loop. 



--EXAMPLE 1:

DECLARE
   V_Num NUMBER := 1;
BEGIN
  LOOP 
    DBMS_OUTPUT.PUT_LINE(' The Line '|| V_Num ||' Output is '||V_Num);
      V_Num := V_Num + 1;
        IF V_Num > 10 THEN
	     EXIT;
        END IF;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE(' The Total lines of outputs are '||(V_NUM -1));
END;
/



--EXAMPLE 2:-

DECLARE
   V_Num NUMBER := 1;
BEGIN
  LOOP 
      V_Num := V_Num + 1;
      DBMS_OUTPUT.PUT_LINE(' The Line '|| V_Num ||' Output is '||V_Num);
		IF V_Num > 10 THEN
			EXIT;
		END IF;
    END LOOP;
   DBMS_OUTPUT.PUT_LINE(' The Total lines of outputs are '||(V_NUM -1));
END;
/


--EXAMPLE 3:


DECLARE
   V_Num NUMBER := 1;
BEGIN
  LOOP 
    DBMS_OUTPUT.PUT_LINE(' The Line '|| V_Num ||' Output is '||V_Num);
      V_Num := V_Num + 1;
      EXIT WHEN V_Num > 10;
  END LOOP;
   DBMS_OUTPUT.PUT_LINE(' The Total lines of outputs are '||(V_NUM -1));
END;
/



-------------------------------------------------- Nested loops -------------------------------------------------------------

DECLARE
   V_Num NUMBER := 1;
BEGIN
  LOOP 
    EXIT WHEN V_Num > 10;
			LOOP
				EXIT WHEN V_Num > 5;
				DBMS_OUTPUT.PUT_LINE(' The Inner loop: '||V_Num);
				V_Num := V_Num + 1;
			END LOOP;
   DBMS_OUTPUT.PUT_LINE(' The Outer loop: '||V_NUM);
   V_Num:=V_Num+1;
   END LOOP;
END;
/



-------------------------------------------------- WHILE Loop ---------------------------------------------------------------  

--SYNTAX

WHILE <<condition>>
LOOP
	Statement 1;
	Statement 2;
END LOOP;


--EXAMPLE 1:


DECLARE 
  V_Number NUMBER(2) :=1;
  V_Output VARCHAR2(100);
BEGIN 
  WHILE V_Number <=5
   LOOP 
     V_Output := V_Output||''||V_Number;
     V_Number := V_Number + 1;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE(V_Output);
END;
/ 


--EXAMPLE 2: REVERSE NUMBER

DECLARE
	V_NUM NUMBER;
	V_POSITION NUMBER;
	V_RESULT NUMBER:=0;
BEGIN
V_NUM:=&NumberToRevers;
	WHILE V_NUM>0
	LOOP
		V_POSITION:=MOD(V_NUM,10);
		V_RESULT:=(V_RESULT*10)+V_POSITION;
		V_NUM:=TRUNC(V_NUM/10);
	END LOOP;
DBMS_OUTPUT.PUT_LINE('THE REVERSE OF ENTERED NUMBER IS :'||V_RESULT);
END;
/


-------------------------------------------------- FOR LOOP -----------------------------------------------------------------

--SYNTAX

FOR COUNTER IN [REVERSE] LowerBound..UpperBound
LOOP
	Statement 1;
	Statement 2;
END LOOP;


--EXAMPLE 1:

BEGIN
FOR I IN 1.. 5 
 LOOP
   DBMS_OUTPUT.PUT_LINE('The Index is :'||I);
 END LOOP;
END;
/


--EXAMPLE 2:

BEGIN
FOR I IN REVERSE 1.. 5 
 LOOP
   DBMS_OUTPUT.PUT_LINE('The Index is :'||I);
 END LOOP;
END;
/

--EXAMPLE 3:-

DECLARE  
  V_StartRange NUMBER := &StartRange;
  V_EndRange   NUMBER := &EndRange;
  V_Result VARCHAR2(500) := NULL;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Illulstration of FOR LOOP...!!!');
  FOR MyIndx IN V_StartRange.. V_EndRange
  LOOP
    V_Result := V_Result||' '||V_StartRange;
	V_StartRange := V_StartRange + 1;
  END LOOP;
DBMS_OUTPUT.PUT_LINE(V_Result);
END;
/

--EXAMPLE 4:

DECLARE
	V_NUMFACT NUMBER:=&Num;
	V_FACTORIAL NUMBER :=1;
BEGIN 
	FOR I IN 1..V_NUMFACT
	LOOP
		V_FACTORIAL:=V_FACTORIAL*I;
	END LOOP;
DBMS_OUTPUT.PUT_LINE('THE FACTORIAL OF '||V_NUMFACT||' IS :'||V_FACTORIAL);
END;
/
		


--EXAMPLE 5: REVERSE STRING

DECLARE
	V_NAME VARCHAR2(30);
	V_POSITION VARCHAR(100):=NULL;
BEGIN
V_NAME:='&REVERSE_STRING';
	FOR I IN 1..LENGTH(V_NAME)
	LOOP
	V_POSITION:=V_POSITION||' '||SUBSTR(V_NAME,-I,1);
	END LOOP;
DBMS_OUTPUT.PUT_LINE(V_POSITION);
END;
/
