-- TEST view_courses_taking

-- DESCRIPTION: View the courses a student is enrolled in

-- CODE
CREATE OR REPLACE VIEW view_courses_taking AS
SELECT course_id 
FROM tarp_enrolls 
WHERE username = 'davis12';

--OUTPUT

--COURSE_ID           
----------------------
--CSCI101
--MATH101
--THEO111


