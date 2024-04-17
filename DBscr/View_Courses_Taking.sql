-- TEST view_courses_taking

-- DESCRIPTION: View the courses a student is enrolled in

-- CODE

DECLARE
    v_username VARCHAR2(100) := ?; -- Set the username here
BEGIN
    EXECUTE IMMEDIATE '
        CREATE OR REPLACE VIEW view_courses_taking AS
        SELECT S.course_id, T.username
        FROM tarp_enrolls S, tarp_course T
        WHERE S.username = ''' || v_username || ''' AND T.course_id = S.course_id';
END;
/


--OUTPUT

--COURSE_ID           
----------------------
--CSCI101
--MATH101
--THEO111


