SET SERVEROUTPUT ON;
SET VERIFY OFF;
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEE';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE EMPLOYEE (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER,
    dept VARCHAR2(50)
);
INSERT INTO EMPLOYEE VALUES (1, 'John', 30000, 'HR');
INSERT INTO EMPLOYEE VALUES (2, 'Alice', 45000, 'IT');
INSERT INTO EMPLOYEE VALUES (3, 'Bob', 25000, 'Finance');
INSERT INTO EMPLOYEE VALUES (4, 'David', 50000, 'IT');

COMMIT;
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary, dept FROM EMPLOYEE;

    v_id EMPLOYEE.emp_id%TYPE;
    v_name EMPLOYEE.emp_name%TYPE;
    v_salary EMPLOYEE.salary%TYPE;
    v_dept EMPLOYEE.dept%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary, v_dept;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ', Name: ' || v_name ||
            ', Salary: ' || v_salary ||
            ', Dept: ' || v_dept
        );
    END LOOP;
    CLOSE emp_cursor;
END;
/

