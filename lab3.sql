CREATE TABLE NEWEMP AS
SELECT * FROM EMP WHERE 1=2;

CREATE OR REPLACE TRIGGER copy_to_newemp
AFTER INSERT
ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP
    (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    (
        :NEW.EMPNO,
        :NEW.ENAME,
        :NEW.JOB,
        :NEW.MGR,
        :NEW.HIREDATE,
        :NEW.SAL,
        :NEW.COMM,
        :NEW.DEPTNO
    );

    
    DBMS_OUTPUT.PUT_LINE('Record Copied to NEWEMP Table!');
    DBMS_OUTPUT.PUT_LINE('EmpNo : ' || :NEW.EMPNO);
    DBMS_OUTPUT.PUT_LINE('Name  : ' || :NEW.ENAME);
    DBMS_OUTPUT.PUT_LINE('Job   : ' || :NEW.JOB);
    DBMS_OUTPUT.PUT_LINE('Sal   : ' || :NEW.SAL);
    DBMS_OUTPUT.PUT_LINE('Dept  : ' || :NEW.DEPTNO);
   

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Record already exists in NEWEMP Table!');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);

END copy_to_newemp;
/