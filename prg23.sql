SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION find_max(a NUMBER, b NUMBER)
RETURN NUMBER
IS
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END;
/
DECLARE
    num1 NUMBER := &num1;
    num2 NUMBER := &num2;
    result NUMBER;
BEGIN
    result := find_max(num1, num2);
    DBMS_OUTPUT.PUT_LINE('Maximum value is: ' || result);
END;
/
