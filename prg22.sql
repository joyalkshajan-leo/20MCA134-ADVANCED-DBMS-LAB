SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION is_palindrome(str VARCHAR2)
RETURN VARCHAR2
IS
    rev_str VARCHAR2(100) := '';
BEGIN
    FOR i IN REVERSE 1 .. LENGTH(str) LOOP
        rev_str := rev_str || SUBSTR(str, i, 1);
    END LOOP;
    IF str = rev_str THEN
        RETURN 'Palindrome';
    ELSE
        RETURN 'Not Palindrome';
    END IF;
END;
/

DECLARE
    input_str VARCHAR2(100) := '&input';
    result VARCHAR2(20);
BEGIN
    result := is_palindrome(input_str);
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
END;
/
