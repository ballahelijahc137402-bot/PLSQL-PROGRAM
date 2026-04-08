/* Write a PL/SQL block using a cursor FOR loop to display name 
and the basic salary of top 3 highest paid employees. (Use 
Cursor For Loop)*/
SET SERVEROUTPUT ON
DECLARE CURSOR emp_cur IS SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;  

BEGIN  

FOR emp_rec IN emp_cur  

LOOP  
EXIT WHEN emp_cur%ROWCOUNT > 3;  

DBMS_OUTPUT.PUT_LINE(emp_cur%ROWCOUNT || '. ' || 'Name: ' || emp_rec.ENAME || ' | Salary: ' || emp_rec.SAL); END LOOP; DBMS_OUTPUT.PUT_LINE('---------------------'); DBMS_OUTPUT.PUT_LINE('Top 3 Employees Displayed.'); 

 END; /