        

CREATE OR REPLACE PROCEDURE search_employee 

( 

    p_empno   IN  EMP.EMPNO%TYPE, 

    p_ename   OUT EMP.ENAME%TYPE, 

    p_status  OUT VARCHAR2 

) 

AS 

BEGIN 

    -- Search for employee by ID 

    SELECT ENAME INTO p_ename 

    FROM EMP 

    WHERE EMPNO = p_empno; 

  

    -- If found 

    p_status := 'SUCCESS: Employee Found!'; 

  

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        p_ename  := NULL; 

        p_status := 'ERROR: Employee ID ' || p_empno || ' does not exist in the table!'; 

  

    WHEN OTHERS THEN 

        p_ename  := NULL; 

        p_status := 'ERROR: ' || SQLERRM; 

  

END search_employee; 

/ 