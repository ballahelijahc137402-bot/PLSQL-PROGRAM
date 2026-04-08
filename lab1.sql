
INSERT INTO EMP (EMPNO, ENAME, DEPTNO, SAL)
VALUES (9001, 'JOHN', 10, 3000);


CREATE OR REPLACE TRIGGER restrict_weekend_access
BEFORE INSERT OR UPDATE OR DELETE
ON EMP
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'ERROR: Access to EMP table is restricted on Weekends!');
    END IF;
END restrict_weekend_access;
/