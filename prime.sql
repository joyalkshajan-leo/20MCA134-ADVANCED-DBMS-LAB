SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := &num; 
    i   NUMBER;
    is_prime BOOLEAN := TRUE;
BEGIN
    IF num <= 1 THEN
        is_prime := FALSE;
    ELSE
        FOR i IN 2 .. FLOOR(SQRT(num)) LOOP
            IF MOD(num, i) = 0 THEN
                is_prime := FALSE;
                EXIT;
            END IF;
        END LOOP;
    END IF;

    IF is_prime THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is a prime number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is not a prime number');
    END IF;
END;
/
