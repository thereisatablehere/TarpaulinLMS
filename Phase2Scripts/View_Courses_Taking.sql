-- TEST view_courses_taking

-- DESCRIPTION: View the courses a student is enrolled in

-- CODE

SELECT course_id 
FROM tarp_enrolls 
WHERE username = 'erickson25';

--OUTPUT

--COURSE_ID           
----------------------
--MATH101


