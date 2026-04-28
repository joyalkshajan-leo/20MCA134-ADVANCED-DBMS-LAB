
SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE find_sum(a IN NUMBER, b IN NUMBER, result OUT NUMBER)
IS
BEGIN
    result := a + b;
END;
/
DECLARE
    num1 NUMBER := &num1;
    num2 NUMBER := &num2;
    total NUMBER;
BEGIN
    find_sum(num1, num2, total);
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || total);
END;
/
