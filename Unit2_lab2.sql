/* Write a PL/SQL block that uses a cursor attribute 
%ISOPEN and %NOTFOUND to raise the basic salary of 
employees of department number 20 by 5% and also display the 
appropriate message based on the existence to the record in the 
EMP table. Whenever any such raise is given to the employees, a 
record for the same is maintained in the emp_update table. 
(Perform using both Implicit and Explicit Cursor). */
SET SERVEROUTPUT ON 
DECLARE
    CURSOR emp_cur IS SELECT EMPNO, SAL FROM EMP1 WHERE DEPTNO = 20;
    v_empno  EMP1.EMPNO%TYPE;
    v_sal  EMP.SAL%TYPE;
BEGIN
    IF NOT emp_cur%ISOPEN THEN
        OPEN emp_cur;
        DBMS_OUTPUT.PUT_LINE('Cursor Opened.');
    END IF;

    LOOP
        FETCH emp_cur INTO v_empno, v_sal;
        EXIT WHEN emp_cur%NOTFOUND;
        UPDATE EMP1
        SET SAL = SAL * 1.05
        WHERE EMPNO = v_empno;

        INSERT INTO EMP1_UPDATE (EMPNO, DEPTNO, OLD_SAL, NEW_SAL, UPDATE_DATE)
        VALUES (v_empno, 20, v_sal, v_sal * 1.05, SYSDATE);

        DBMS_OUTPUT.PUT_LINE('Employee ' || v_empno || 
                             ' salary updated from ' || v_sal || 
                             ' to ' || v_sal * 1.05);
    END LOOP;

    IF emp_cur%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 20.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(emp_cur%ROWCOUNT || ' employee(s) updated successfully.');
    END IF;

    CLOSE emp_cur;
    DBMS_OUTPUT.PUT_LINE('Cursor Closed.');

    COMMIT;
END;
/