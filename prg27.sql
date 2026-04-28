SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SAILORS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE SAILORS (
    sid NUMBER,
    sname VARCHAR2(50),
    rating NUMBER,
    age NUMBER
);

INSERT INTO SAILORS VALUES (1, 'John', 5, 25);
INSERT INTO SAILORS VALUES (2, 'Alice', 7, 30);
INSERT INTO SAILORS VALUES (3, 'Bob', 3, 22);
INSERT INTO SAILORS VALUES (4, 'David', 8, 28);

COMMIT;

DECLARE
    CURSOR sailor_cursor IS
        SELECT sid, rating FROM SAILORS;

    v_sid SAILORS.sid%TYPE;
    v_rating SAILORS.rating%TYPE;
BEGIN
    OPEN sailor_cursor;
    LOOP
        FETCH sailor_cursor INTO v_sid, v_rating;
        EXIT WHEN sailor_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('SID: ' || v_sid || '  Rating: ' || v_rating);
    END LOOP;
    CLOSE sailor_cursor;
END;
/
