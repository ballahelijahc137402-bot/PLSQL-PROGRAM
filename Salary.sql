--Write a PL/SQL block which displays gross salary of employees as
--per user input EID. (Consider EMP table with EID, EName,
--Deptno, Deptname Gender, Age, BasicSal) with appropriate data
--types.) Gross_Salary: BASICSAL + (DA + HRA + Medical) – PF.
--Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs.
--500, PF = 10% of basic.
CREATE TABLE EMP (
    EID        NUMBER PRIMARY KEY,
    EName      VARCHAR2(50),
    DeptNo     NUMBER,
    DeptName   VARCHAR2(50),
    Gender     VARCHAR2(10),
    Age        NUMBER,
    BasicSal   NUMBER(10,2)
); 

INSERT INTO EMP VALUES (101, 'Amit', 10, 'HR', 'Male', 30, 25000);
COMMIT;





SET SERVEROUTPUT ON;

DECLARE
    v_eid      NUMBER;
    v_basic    NUMBER;
    v_da       NUMBER;
    v_hra      NUMBER;
    v_medical  NUMBER := 500;
    v_pf       NUMBER;
    v_gross    NUMBER;
BEGIN
    -- Accept Employee ID
    v_eid := &Enter_EID;

    -- Fetch Basic Salary
    SELECT BasicSal
    INTO v_basic
    FROM EMP
    WHERE EID = v_eid;

    -- Calculate Allowances and Deductions
    v_da  := v_basic * 0.50;   -- 50% of Basic
    v_hra := v_basic * 0.15;   -- 15% of Basic
    v_pf  := v_basic * 0.10;   -- 10% of Basic

    -- Calculate Gross Salary
    v_gross := v_basic + (v_da + v_hra + v_medical) - v_pf;

    -- Display Details
    DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('DA           : ' || v_da);
    DBMS_OUTPUT.PUT_LINE('HRA          : ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('Medical      : ' || v_medical);
    DBMS_OUTPUT.PUT_LINE('PF           : ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary : ' || v_gross);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID not found.');
END;
/