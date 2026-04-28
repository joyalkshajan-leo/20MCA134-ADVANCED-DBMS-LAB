SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION factorial(n IN NUMBER)
RETURN NUMBER IS
    fact NUMBER := 1;
BEGIN
IF n < 0 THEN
RETURN NULL;
END IF;

FOR i IN 1..n LOOP
fact := fact * i;
END LOOP;

RETURN fact;
END factorial;
/

DECLARE
num NUMBER := &n;
result NUMBER;
BEGIN
result := factorial(num);

IF result IS NULL THEN
DBMS_OUTPUT.PUT_LINE('Factorial not defined for negative numbers');
ELSE
DBMS_OUTPUT.PUT_LINE('Factorial = ' || result);
END IF;
END;
/
