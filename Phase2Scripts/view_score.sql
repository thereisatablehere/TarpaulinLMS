-- TEST view_score

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


