--Write a program to generate the numbers using LOOP, FOR LOOP
--and WHILE LOOP up to the number inputted by user.
SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER;
    i     NUMBER;
BEGIN
    -- Accept number from user
    v_num := &Enter_Number;
    i := 1;
    WHILE i <= v_num LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;

    FOR i IN 1..v_num LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;

END;
/