/* Write a PL/SQL block that uses a cursor attribute 
%ROWCOUNT to display the name, department and basic salary 
of first 5 employees getting the highest basic salary. (Use 
Explicit Cursor)*/
SET SERVEROUTPUT ON 
DECLARE
    CURSOR emp_cur IS
        SELECT ENAME, DEPTNO, SAL
        FROM EMP
        ORDER BY SAL DESC;

    v_ename  EMP.ENAME%TYPE;
    v_deptno EMP.DEPTNO%TYPE;
    v_sal    EMP.SAL%TYPE;
BEGIN
    OPEN emp_cur;

    LOOP
        FETCH emp_cur INTO v_ename, v_deptno, v_sal;

        -- Exit after 5 records using %ROWCOUNT
        EXIT WHEN emp_cur%NOTFOUND OR emp_cur%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(emp_cur%ROWCOUNT || '. ' || 'Name: ' || v_ename || ' | Dept: ' || v_deptno ||' | Salary: ' || v_sal);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('----------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Records Displayed: ' || emp_cur%ROWCOUNT);

    CLOSE emp_cur;
END;
/