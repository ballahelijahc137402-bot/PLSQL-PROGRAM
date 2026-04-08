/* Write a PL/SQL block using a parameterized cursor that displays
the department wise basic salary of each employee and
department wise total gross salary. (Parameterized Cursor and
Use Cursor For Loop)*/
SET SERVEROUTPUT ON
DECLARE
    CURSOR emp_cur IS SELECT ENAME, DEPTNO, SAL FROM EMP ORDER BY SAL DESC;
    v_ename  EMP.ENAME%TYPE;
    v_deptno EMP.DEPTNO%TYPE;
    v_sal    EMP.SAL%TYPE;
BEGIN
    OPEN emp_cur;

    LOOP
        FETCH emp_cur INTO v_ename, v_deptno, v_sal;

        EXIT WHEN emp_cur%NOTFOUND OR emp_cur%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(emp_cur%ROWCOUNT || '. ' ||
                             'Name: '   || v_ename  ||
                             ' | Dept: '   || v_deptno ||
                             ' | Salary: ' || v_sal);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Records Displayed: ' || emp_cur%ROWCOUNT);

    CLOSE emp_cur;
END;