SET SERVEROUTPUT ON;
SET VERIFY OFF;
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE INSTRUCTOR';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE INSTRUCTOR (
    id NUMBER,
    name VARCHAR2(50),
    dept_name VARCHAR2(50)
);
INSERT INTO INSTRUCTOR VALUES (1, 'John', 'Computer Science');
INSERT INTO INSTRUCTOR VALUES (2, 'Alice', 'Computer Science');
INSERT INTO INSTRUCTOR VALUES (3, 'Bob', 'Mathematics');
INSERT INTO INSTRUCTOR VALUES (4, 'David', 'Physics');

COMMIT;
CREATE OR REPLACE PROCEDURE get_instructor_count(
    dname IN VARCHAR2,
    total OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM INSTRUCTOR
    WHERE dept_name = dname;
END;
/
DECLARE
    dept VARCHAR2(50) := '&department';
    count_instructors NUMBER;
BEGIN
    get_instructor_count(dept, count_instructors);
    DBMS_OUTPUT.PUT_LINE('Number of instructors in ' || dept || ' is: ' || count_instructors);
END;
/
