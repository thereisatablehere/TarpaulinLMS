CREATE OR REPLACE FUNCTION custom_sum(a varchar2, b varchar2) RETURN varchar2 AS
    BEGIN
        RETURN a || b;
    END;
    

CREATE operator add (
    left varchar2,
    right varchar 2,
    return varchar2,
    pragma restrict_references(none),
    function custom_sum
);
