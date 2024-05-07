--SELECT 
--    coalesce(C.course_id, 'all_courses') as course_ids, 
--    coalesce(E.username, 'all_students') as usernames, 
--    SUM(usernames) AS total_students
--FROM 
--    TARP_Course C left outer TARP_Enrolls E
--WHERE 
--    C.course_id = E.course_id
--GROUP BY ROLLUP (course_ids, usernames);

SELECT 
    COALESCE(C.course_id, 'all_courses') AS course_ids, 
    COALESCE(E.username, 'all_students') AS usernames, 
    COUNT(E.username) AS total_students
FROM 
    TARP_Course C 
LEFT OUTER JOIN 
    TARP_Enrolls E ON C.course_id = E.course_id
GROUP BY 
    ROLLUP (C.course_id, E.username);
