--Write a PL/SQL block to accept employee name from a user if it
--exists display his/her basic salary otherwise display
--appropriate message using exception handling.

DECLARE
 v_name VARCHAR2(50) := '&Enter_Employee_Name';
 v_salary NUMBER;
BEGIN
 SELECT basic_salary
 INTO v_salary
 FROM EMPLOYEE
 WHERE UPPER(emp_name) = UPPER(v_name);
 DBMS_OUTPUT.PUT_LINE('Employee Name : ' || UPPER(v_name));
 DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || v_salary);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('Employee "' || UPPER(v_name) || '" not
found!');
 WHEN TOO_MANY_ROWS THEN
 DBMS_OUTPUT.PUT_LINE('Multiple employees found with name "' ||
UPPER(v_name) || '"!');
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/