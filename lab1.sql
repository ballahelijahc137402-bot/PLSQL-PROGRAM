--Write a PL/SQL block that explains the use of ZERO_DIVIDE Exception



SET SERVEROUTPUT ON
DECLARE v_numerator NUMBER := 100; v_denominator NUMBER := 0; v_result
NUMBER;
BEGIN DBMS_OUTPUT.PUT_LINE('--- ZERO_DIVIDE Exception Demo ---');
DBMS_OUTPUT.PUT_LINE('Numerator : ' || v_numerator);
DBMS_OUTPUT.PUT_LINE('Denominator : ' || v_denominator);
v_result := v_numerator / v_denominator;
DBMS_OUTPUT.PUT_LINE('Result : ' || v_result);
EXCEPTION WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE('EXCEPTION CAUGHT: ZERO_DIVIDE');
DBMS_OUTPUT.PUT_LINE('Cannot divide ' || v_numerator || ' by zero!');
DBMS_OUTPUT.PUT_LINE('Please provide a non-zero denominator.');
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END; /