-- TEST view_courses_taking

-- DESCRIPTION: View the courses a student is enrolled in

-- CODE

        CREATE OR REPLACE VIEW view_courses_taking AS
        SELECT S.course_id, S.username AS studentUser, T.username
        FROM tarp_enrolls S, tarp_course T
        WHERE T.course_id = S.course_id;
        
--OUTPUT

--COURSE_ID           
----------------------
--CSCI101
--MATH101
--THEO111


