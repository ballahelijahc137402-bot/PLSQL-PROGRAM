--Write a PL/SQL block to display the salary of that employee
--whose age is 50 years otherwise display appropriate message
--using exception handling.

SET SERVEROUTPUT ON
DECLARE
 v_name VARCHAR2(50);
 v_salary NUMBER;
 v_age NUMBER;
BEGIN
 SELECT emp_name, basic_salary, age
 INTO v_name, v_salary, v_age
 FROM EMPLOYEE
 WHERE age = 50;
 DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_name);
 DBMS_OUTPUT.PUT_LINE('Age : ' || v_age);
 DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || v_salary);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('No employee found with age 50!');
 WHEN TOO_MANY_ROWS THEN
 DBMS_OUTPUT.PUT_LINE('Multiple employees found with age 50!');
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/