-- TEST view_score (7)

-- DESCRIPTION: View the score for a student

-- CODE

SELECT 
    e.username,
    (count_student_completed_lectures(e.username) * 10) 
    + sum_student_tests(e.username) AS total_score
FROM 
    tarp_enrolls e
INNER JOIN 
    tarp_course c ON e.course_id = c.course_id
WHERE 
    e.username = 'grove5';
    
    
--OUTPUT

--USERNAME             TOTAL_SCORE
---------------------- -----------
--grove5                       180

--******************************************************************************************************************************************************************

-- TEST view_courses_taking (8)

-- DESCRIPTION: View the courses a student is enrolled in

-- CODE

SELECT course_id 
FROM tarp_enrolls 
WHERE username = 'erickson25';

--OUTPUT

--COURSE_ID           
----------------------
--MATH101

--******************************************************************************************************************************************************************

-- TEST VIEW_COMMENTS (10)

SELECT *
FROM view_comments
WHERE course_id = 'CSCI101';

--OUTPUT
--COURSE_ID            S_USERNAME           S_COMMENT                                                                                                                                                                                                CDATE    
---------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
--CSCI101              imad2000             Cool course!                                                                                                                                                                                             28-FEB-24
--CSCI101              grove5               Great course!                                                                                                                                                                                            28-MAR-24
--CSCI101              erickson25           Awesome course! 

--******************************************************************************************************************************************************************

-- TEST VIEW_COURSES TAUGHT (15)

-- DESCRIPTION: View courses that an instructor teaches

-- CODE

SELECT course_id
FROM TARP_COURSE tp
WHERE tp.username = 'bill34';

-- OUTPUT
--COURSE_ID           
----------------------
--MATH101
--MATH231

--******************************************************************************************************************************************************************

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

--******************************************************************************************************************************************************************


-- TEST VIEW_ALL_GRADES (18)

-- DESCRIPTION: View the grades (progress percentage) 
-- for each course a specific student is taking.

-- CODE

SELECT COURSE_ID, VIEW_GRADE('grove5', TE.course_id) AS GRADE
FROM TARP_ENROLLS TE
WHERE username = 'grove5';

--COURSE_ID                 GRADE
---------------------- ----------
--MATH101              85.7142857
--THEO111              41.6666667







