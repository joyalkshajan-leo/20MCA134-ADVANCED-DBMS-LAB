SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION week(n IN NUMBER)
RETURN VARCHAR2 IS
   name VARCHAR2(20);
BEGIN
   CASE n
     WHEN 1 THEN
        name := 'SUNDAY';
     WHEN 2 THEN
        name := 'MONDAY';
     WHEN 3 THEN
        name := 'TUESDAY';
     WHEN 4 THEN
        name := 'WEDNESDAY';
     WHEN 5 THEN
        name := 'THURSDAY';
     WHEN 6 THEN
        name := 'FRIDAY';
     WHEN 7 THEN
        name := 'SATURDAY';
     ELSE
        name := 'INVALID DAY';
    END CASE;
RETURN name;
END;
/
DECLARE
a NUMBER := &week;
result VARCHAR(20);
BEGIN
result := week(a);
DBMS_OUTPUT.PUT_LINE('Day is: ' || result);
END;
/     
   
