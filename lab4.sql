CREATE TABLE NEWEMP AS
SELECT * FROM EMP WHERE 1=2;

CREATE OR REPLACE TRIGGER backup_on_update
AFTER UPDATE
ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP
    (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    (
        :OLD.EMPNO,
        :OLD.ENAME,
        :OLD.JOB,
        :OLD.MGR,
        :OLD.HIREDATE,
        :OLD.SAL,
        :OLD.COMM,
        :OLD.DEPTNO
    );

    DBMS_OUTPUT.PUT_LINE('Old Record Backed Up in NEWEMP Table!');
    DBMS_OUTPUT.PUT_LINE('EmpNo    : ' || :OLD.EMPNO);
    DBMS_OUTPUT.PUT_LINE('Name     : ' || :OLD.ENAME);
    DBMS_OUTPUT.PUT_LINE('Job      : ' || :OLD.JOB);
    DBMS_OUTPUT.PUT_LINE('Old Sal  : ' || :OLD.SAL);
    DBMS_OUTPUT.PUT_LINE('New Sal  : ' || :NEW.SAL);
    DBMS_OUTPUT.PUT_LINE('Dept     : ' || :OLD.DEPTNO);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Record already exists in NEWEMP Table!');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);

END backup_on_update;
/