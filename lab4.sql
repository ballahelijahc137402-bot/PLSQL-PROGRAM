CREATE OR REPLACE FUNCTION get_square 

( 

    p_number IN NUMBER 

) 

RETURN NUMBER 

AS 

    v_square NUMBER; 

BEGIN 

    -- Calculate square of the number 

    v_square := p_number * p_number; 

  

    -- Return the result 

    RETURN v_square; 

  

EXCEPTION 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error Occurred: ' || SQLERRM); 

        RETURN NULL; 

  

END get_square; 

/ 

 