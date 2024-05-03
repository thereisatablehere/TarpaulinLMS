CREATE OR REPLACE FUNCTION custom_sum(a varchar2, b varchar2) RETURN varchar2 AS
    BEGIN
        RETURN add(a, b);
    END;  
