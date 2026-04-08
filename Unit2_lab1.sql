/*1) Write a PL/SQL block that uses a cursor attribute
SQL%ROWCOUNT to raise the basic salary of employees by 10%
that are working in department number 10 and also display the
appropriate message based on the existence to the record in the
EMP table. (Use Implicit Cursor)*/

SET SERVEROUTPUT ON 
DECLARE
    v_dept_no  EMP.DEPTNO%TYPE := 10;
    v_raise    NUMBER := 1.10;
BEGIN
    -- Update salary for employees in department 10
    UPDATE EMP
    SET    SAL = SAL * v_raise
    WHERE  DEPTNO = v_dept_no;

    -- Check SQL%ROWCOUNT after the DML statement
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department ' || v_dept_no || '. No records updated.');

    ELSIF SQL%ROWCOUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('1 employee in Department ' || v_dept_no || ' received a 10% salary raise.');

    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employees in Department ' || v_dept_no || ' received a 10% salary raise.');

    END IF;

    COMMIT;

END;
/