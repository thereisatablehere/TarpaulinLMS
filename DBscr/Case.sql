SELECT comm_id, num_students,
    CASE
        WHEN num_students < 2 THEN 'Low Level Community'
        WHEN num_students BETWEEN 2 AND 10 THEN 'Mid Level Community'
        WHEN num_students > 10 THEN 'Senior Level Community'
        ELSE 'Unspecified'
    END AS community_level
FROM TARP_COMMUNITY;
