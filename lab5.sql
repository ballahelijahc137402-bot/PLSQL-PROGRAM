--Write a PL/SQL block using a cursor to insert the records of
--employee in EMP_BACKUP table for given department number,
--also raise a user defined exception NO_DEPT_FOUND when no
--records are found for entered DEPT_NO. (Use User Defined
--Exception)

SET SERVEROUTPUT ON
DECLARE v_deptno NUMBER := &Enter_Department_No; v_count NUMBER := 0;
NO_DEPT_FOUND EXCEPTION;
CURSOR emp_cur IS
 SELECT emp_id, emp_name, basic_salary, age
 FROM EMPLOYEE
 WHERE dept_no = v_deptno;
BEGIN FOR rec IN emp_cur LOOP INSERT INTO EMP_BACKUP (emp_id,
emp_name, basic_salary, age, dept_no) VALUES (rec.emp_id, rec.emp_name,
rec.basic_salary, rec.age, v_deptno);
 v_count := v_count + 1;
END LOOP;
IF v_count = 0 THEN
 RAISE NO_DEPT_FOUND;
END IF;
COMMIT;
DBMS_OUTPUT.PUT_LINE('Total ' || v_count || ' record(s) inserted into
EMP_BACKUP successfully!');
EXCEPTION WHEN NO_DEPT_FOUND THEN DBMS_OUTPUT.PUT_LINE('ERROR:
No employees found for Department No ' || v_deptno || '!');
WHEN OTHERS THEN
 ROLLBACK;
 DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
Marwadi University
Faculty of Computer Applications
END; /