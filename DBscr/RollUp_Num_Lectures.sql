SELECT 
    coalesce(community_id, 'all_communities') as community_id, 
    coalesce(f_name, 'all_students') as first_name, 
    SUM(num_lectures) AS total_lectures
FROM 
    TARP_student S, TARP_JOINED_BY J
WHERE 
    S.username = J.username
GROUP BY ROLLUP (community_id, f_name);
