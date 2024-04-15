-- TEST view_courses_taught

-- DESCRIPTION: View the courses an instructor is teaching

-- CODE
CREATE OR REPLACE VIEW view_courses_taught AS
SELECT course_id
FROM TARP_COURSE tp
ORDER BY COURSE_ID;

--OUTPUT

--COURSE_ID           
----------------------
--CSCI101
--CSCI331
--MATH101
--MATH231
--THEO111
