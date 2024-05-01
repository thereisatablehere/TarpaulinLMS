-- TEST view_courses_taught

-- DESCRIPTION: View the courses an instructor is teaching

-- CODE
CREATE OR REPLACE VIEW view_courses_taught AS
SELECT course_id, username
FROM TARP_COURSE tp
ORDER BY COURSE_ID;

--OUTPUT

--COURSE_ID            USERNAME
---------------------- --------
--CSCI101              imad2000
--CSCI331              imad2000
--MATH101                bill34
--MATH231                bill34
--THEO111              erin1234
