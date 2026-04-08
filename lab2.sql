--Write a PL/SQL block to accept student name from a user if it is
--exist display his/her result from RESULT table otherwise display
--appropriate message using exception handling.  


CREATE TABLE RESULT
(
student_id NUMBER PRIMARY KEY,
student_name VARCHAR2(50),
subject1 NUMBER,
subject2 NUMBER,
subject3 NUMBER,
total_marks NUMBER,
percentage NUMBER, grade VARCHAR2(5)
);
INSERT INTO RESULT VALUES (1, 'RAHUL', 85, 90, 78, 253, 84.33, 'A');
INSERT INTO RESULT VALUES (2, 'PRIYA', 92, 88, 95, 275, 91.67, 'A+'); INSERT
INTO RESULT VALUES (3, 'AMIT', 60, 55, 70, 185, 61.67, 'C');
INSERT INTO RESULT VALUES (4, 'SNEHA', 75, 80, 72, 227, 75.67, 'B'); INSERT
INTO RESULT VALUES (5, 'VIKRAM', 45, 50, 40, 135, 45.00, 'F');
COMMIT;
SET SERVEROUTPUT ON
DECLARE v_name VARCHAR2(50) := '&Enter_Student_Name'; v_total NUMBER;
v_grade VARCHAR2(5);
BEGIN SELECT total_marks, grade INTO v_total, v_grade FROM RESULT WHERE
UPPER(student_name) = UPPER(v_name);
DBMS_OUTPUT.PUT_LINE('Student Name : ' || UPPER(v_name));
DBMS_OUTPUT.PUT_LINE('Total Marks : ' || v_total);
DBMS_OUTPUT.PUT_LINE('Grade : ' || v_grade);
EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Student "'
|| UPPER(v_name) || '" not found!');
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END; /