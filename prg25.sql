SET SERVEROUTPUT ON;
SET VERIFY OFF;
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE STUDENT';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE STUDENT (
    roll_no NUMBER,
    name VARCHAR2(50)
);
CREATE OR REPLACE PROCEDURE insert_student(
    rno IN NUMBER,
    sname IN VARCHAR2
)
IS
BEGIN
    INSERT INTO STUDENT (roll_no, name)
    VALUES (rno, sname);

    DBMS_OUTPUT.PUT_LINE('Record inserted successfully');
END;
/
DECLARE
    r NUMBER := &roll_no;
    n VARCHAR2(50) := '&name';
BEGIN
    insert_student(r, n);
END;
/
SELECT * FROM STUDENT;
