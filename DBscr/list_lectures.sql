-- TEST list_lectures

-- DESCRIPTION: View the lectures for a student based on a course

-- CODE


SELECT lecture_id, length, url
FROM tarp_lecture
WHERE course_id IN (
    SELECT course_id
    FROM tarp_enrolls
    WHERE username = 'erickson25' and course_id = 'MATH101'
);

--OUTPUT

--LECTURE_ID               LENGTH URL                                                                                                 
---------------------- ---------- ----------------------------------------------------------------------------------------------------
--Lecture 1                    25 https://example.com/lecture1/MATH101                                                                
--Lecture 2                    15 https://example.com/lecture2/MATH101                                                                





