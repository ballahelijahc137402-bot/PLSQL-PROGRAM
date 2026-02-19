--Write a PL/SQL block to calculate the total, percentage and grade
--of student based on his/her Rollno from RESULT table. (Create
--RESULT table with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5,
--Total, Per, Grade attributes with appropriate data type).

CREATE TABLE RESULT (
    RollNo   NUMBER PRIMARY KEY,
    Name     VARCHAR2(50),
    Sub1     NUMBER(5,2),
    Sub2     NUMBER(5,2),
    Sub3     NUMBER(5,2),
    Sub4     NUMBER(5,2),
    Sub5     NUMBER(5,2),
    Total    NUMBER(6,2),
    Per      NUMBER(5,2),
    Grade    VARCHAR2(2)
);

INSERT INTO RESULT (RollNo, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (1, 'Rahul', 78, 85, 69, 90, 88);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_roll   NUMBER;
    v_sub1   NUMBER;
    v_sub2   NUMBER;
    v_sub3   NUMBER;
    v_sub4   NUMBER;
    v_sub5   NUMBER;
    v_total  NUMBER;
    v_per    NUMBER;
    v_grade  VARCHAR2(2);
BEGIN

    v_roll := &Enter_RollNo;

    SELECT Sub1, Sub2, Sub3, Sub4, Sub5
    INTO v_sub1, v_sub2, v_sub3, v_sub4, v_sub5
    FROM RESULT
    WHERE RollNo = v_roll;

    v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5;
    v_per := v_total / 5;


    IF v_per >= 75 THEN
        v_grade := 'A';
    ELSIF v_per >= 60 THEN
        v_grade := 'B';
    ELSIF v_per >= 50 THEN
        v_grade := 'C';
    ELSIF v_per >= 40 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;

    
    UPDATE RESULT
    SET Total = v_total,
        Per   = v_per,
        Grade = v_grade
    WHERE RollNo = v_roll;

    COMMIT;

    
    DBMS_OUTPUT.PUT_LINE('Total Marks  : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || v_per);
    DBMS_OUTPUT.PUT_LINE('Grade        : ' || v_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Roll Number not found.');
END;
/