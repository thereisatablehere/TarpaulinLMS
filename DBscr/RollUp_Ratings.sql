SELECT 
    coalesce(community_id, 'all_communities') as community_id, 
    coalesce(i_username, 'all_instructors') as instructor_name, 
    AVG(instructor_score) AS average_rating
FROM 
    TARP_RATES R, TARP_JOINED_BY J
WHERE 
    R.s_username = J.username
GROUP BY ROLLUP (community_id, i_username);