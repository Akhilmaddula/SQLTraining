-------------------------------------------------- CONTROL STRUCTURES PART-1  ---------------------------------------------------
1) SIMPLE IF
2) IF-THEN-ELSE
3) NESTED IF
4) ELSIF
5) CASE 
6) GOTO

----------------------------------------------------   SIMPLE IF   -----------------------------------------------------------

--SYNTAX

IF <condition> THEN
  STATEMENT1;
  STATEMENT2;
END IF;



--EXAMPLE 1:-EVEN NUMBER
DECLARE 
  V_Num NUMBER := &EnterNumber;
BEGIN
  IF MOD(V_Num,2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(V_Num||' is an even number.');
  END IF;
END;
/

--EXAMPLE 2:-Swapping Two Numbers

DECLARE

V_NUMBER1 NUMBER:=&NUMBER1;
V_NUMBER2 NUMBER:=&NUMBER2;
V_TEMP    NUMBER;

BEGIN
DBMS_OUTPUT.PUT_LINE('ORIGINAL V_NUMBER1='||V_NUMBER1);
DBMS_OUTPUT.PUT_LINE('ORIGINAL V_NUMBER2='||V_NUMBER2);


	IF V_NUMBER1>V_NUMBER2 THEN
	V_TEMP:=V_NUMBER1;
	V_NUMBER1:=V_NUMBER2;
	V_NUMBER2:=V_TEMP;
	END IF;
	
DBMS_OUTPUT.PUT_LINE('SWAPPED V_NUMBER1='||V_NUMBER1);
DBMS_OUTPUT.PUT_LINE('SWAPPED  V_NUMBER2='||V_NUMBER2);	

END;



--------------------------------------------------------  IF -- ELSE  ------------------------------------------------------------------

--SYNTAX

IF <condition> THEN
  STATEMENT1;
  STATEMENT2;
ELSE
  STATEMENT1;
  STATEMENT2;
END IF;


--EXAMPLE 1:-EVEN OR ODD NUMBER

DECLARE 
  V_Num NUMBER := &EnterNumber;
BEGIN
  IF MOD(V_Num,2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(V_Num||' is an even number.');
	ELSE 
	DBMS_OUTPUT.PUT_LINE(V_Num||' is an odd number.');
  END IF;
END;
/


--EXAMPLE 2: FINDING  GREATEST
DECLARE

V_NUMBER1 NUMBER:=&NUMBER1;
V_NUMBER2 NUMBER:=&NUMBER2;

BEGIN
	IF V_NUMBER1>V_NUMBER2 THEN
	DBMS_OUTPUT.PUT_LINE('THE GREATEST NUMBER IS:'||V_NUMBER1);
	ELSE
		IF V_NUMBER2>V_NUMBER1 THEN
		DBMS_OUTPUT.PUT_LINE('THE GREATEST NUMBER IS:'||V_NUMBER2);
		ELSE
		DBMS_OUTPUT.PUT_LINE('THE NUMBERS '||V_NUMBER1||' AND  '||V_NUMBER2||' ARE EQUAL');
		END IF;
	END IF;
	END;
	
	
	
--BEHAVIOUR OF NULLS



--EXAMPLE 1

DECLARE
 V_NUMBER1 NUMBER:=&NUMBER1;
 V_NUMBER2 NUMBER:=&NUMBER2;
BEGIN
	IF V_NUMBER1=V_NUMBER2 THEN
	DBMS_OUTPUT.PUT_LINE('GIVEN NUMBERS ARE EQUAL');
	END IF;
DBMS_OUTPUT.PUT_LINE('WATCH THE NULL EFFECT');
END;


--EXAMPLE 2:-

DECLARE 
  V_Num NUMBER := &EnterNumber;
BEGIN
  IF MOD(V_Num,2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(V_Num||' is an even number.');
	ELSE 
	DBMS_OUTPUT.PUT_LINE(V_Num||' is an odd number.');
  END IF;
DBMS_OUTPUT.PUT_LINE('WATCH THE NULL EFFECT');
END;
/


------------------------------------------------------------- NESTED IF --------------------------------------------------------------------

    IF <condition> THEN
    	IF <condition> THEN
    		IF <condition> THEN
    		STATEMENT1;
    		STATEMENT2;
    		ELSE
    		STATEMENT1;
    		STATEMENT2;
    		END IF;
    	ELSE
    	STATEMENT1;
    	STATEMENT2;
    	END IF;
    ELSE
    STATEMENT1;
    STATEMENT2;
    END IF;
	
--EXAMPLE 1:- LEAP YEAR

DECLARE
V_YEAR NUMBER:=&ENTER_YEAR;
BEGIN
IF MOD(V_YEAR,4)=0 THEN
	IF MOD(V_YEAR,100)<>0 THEN
	DBMS_OUTPUT.PUT_LINE(V_YEAR||' IS A LEAP YEAR');
	ELSE
		IF MOD(V_YEAR,400)=0 THEN
		DBMS_OUTPUT.PUT_LINE(V_YEAR||' IS A LEAP YEAR');
		ELSE
		DBMS_OUTPUT.PUT_LINE(V_YEAR||' IS NOT A LEAP YEAR');
		END IF;
	END IF;
ELSE
DBMS_OUTPUT.PUT_LINE(V_YEAR||' IS NOT A LEAP YEAR');
END IF;
END;


--EXAMPLE 2:- Arthamatic Operations

DECLARE
 V_Operator VARCHAR2(2) := '&Operator';
 V_Number1  NUMBER      := &Operand1;
 V_Number2  NUMBER      := &Operand2;
BEGIN
  IF  V_Operator = '+' THEN
   DBMS_OUTPUT.PUT_LINE('The sum of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 + V_Number2));
  ELSE 
	   IF V_Operator = '-' THEN
		DBMS_OUTPUT.PUT_LINE('The difference of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 - V_Number2));  
	   ELSE 
	       IF V_Operator = '*' THEN
	       	DBMS_OUTPUT.PUT_LINE('The product of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 * V_Number2));   
	       ELSE 
	           IF V_Operator = '/' THEN
	               DBMS_OUTPUT.PUT_LINE('The quotient of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 / V_Number2));    
	           ELSE 
	               DBMS_OUTPUT.PUT_LINE('Invalid Operator provided.. Please check!!!');
	           END IF;
		   END IF;
	   END IF;
  END IF;  
END;
/  



----------------------------------------------------------- ELSIF..IF LADDER -------------------------------------------------------------------

--SYNTAX
IF <condition> THEN
  <code here>
ELSIF <condition> THEN
  <code here>
ELSIF <condition> THEN
  <code here>
ELSE
  <code here>
END IF;




--EXAMPLE:- Arthamatic Operations

DECLARE
 V_Operator VARCHAR2(2) := '&Operator';
 V_Number1  NUMBER      := &Operand1;
 V_Number2  NUMBER      := &Operand2;
BEGIN
  IF  V_Operator = '+' THEN
   DBMS_OUTPUT.PUT_LINE('The sum of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 + V_Number2));
  ELSIF V_Operator = '-' THEN
   DBMS_OUTPUT.PUT_LINE('The difference of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 - V_Number2));  
  ELSIF V_Operator = '*' THEN
   DBMS_OUTPUT.PUT_LINE('The product of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 * V_Number2));   
  ELSIF V_Operator = '/' THEN
   DBMS_OUTPUT.PUT_LINE('The quotient of '|| V_Number1 ||' and '|| V_Number2|| ' is :'||TO_NUMBER(V_Number1 / V_Number2));    
  ELSE 
   DBMS_OUTPUT.PUT_LINE('Invalid Operator provided.. Please check!!!');
  END IF;  
END;
/  



----------------------------------------------------- CASE -------------------------------------------------------------------------------

--SIMPLE CASE

DECLARE
 V_Grade CHAR := UPPER('&EnterGrade');
BEGIN
  CASE V_Grade
    WHEN 'A' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with excellent Grade.');
    WHEN 'B' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with very good Grade.');  
    WHEN 'C' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with good Grade.');  
    WHEN 'D' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with fair Grade.');    
    WHEN 'E' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with poor Grade.');  
   ELSE 
      DBMS_OUTPUT.PUT_LINE('Sorry!... No such grade is existing');
   END CASE;
END;
/



--SERCHED CASEDECLARE

DECLARE
 V_Grade CHAR := UPPER('&EnterGrade');
BEGIN
  CASE 
    WHEN V_Grade = 'A' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with excellent Grade.');
    WHEN V_Grade = 'B' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with very good Grade.');  
    WHEN V_Grade = 'C' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with good Grade.');  
    WHEN V_Grade = 'D' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with fair Grade.');    
    WHEN V_Grade = 'E' THEN
      DBMS_OUTPUT.PUT_LINE('You are awarded with poor Grade.');  
   ELSE 
      DBMS_OUTPUT.PUT_LINE('Sorry!... No such grade is existing');
   END CASE;
END;
/




--------------------------------------------  GOTO --------------------------------------------------------------------------


DECLARE 
  V_MyNumber NUMBER := &GiveNumber;
BEGIN 
  IF MOD(V_MyNumber,2) = 0 THEN
    GOTO L_EVEN;
   ELSE 
     GOTO L_ODD;
   END IF;
 <<L_EVEN>>
   DBMS_OUTPUT.PUT_LINE('Given number is EVEN Number');
   RETURN;
  <<L_ODD>>
   DBMS_OUTPUT.PUT_LINE('Given number is ODD Number');
   RETURN;
END;
/ 