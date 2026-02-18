--Write a PL/SQL block which accepts measurement in feet and
--displays it in cm, inch and meter.

SET SERVEROUTPUT ON
DECLARE
    feet      NUMBER;
    inches    NUMBER;
    cm        NUMBER;
    meter     NUMBER;
BEGIN
   
    feet := &Enter_Feet;

    inches := feet * 12;         
    cm   := feet * 30.48;       
    meter  := feet * 0.3048;     

    DBMS_OUTPUT.PUT_LINE('Measurement in Feet   : ' || feet);
    DBMS_OUTPUT.PUT_LINE('Measurement in Inches : ' || inches);
    DBMS_OUTPUT.PUT_LINE('Measurement in CM     : ' || cm);
    DBMS_OUTPUT.PUT_LINE('Measurement in Meter  : ' || meter);
END;
/