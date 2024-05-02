SELECT 
    coalesce(course_id, 'all_courses') as course_id, 
    coalesce(test_id, 'all_tests') as test_id, 
    SUM(num_q) AS total_q
FROM 
    TARP_TEST
GROUP BY ROLLUP (course_id, test_id);
