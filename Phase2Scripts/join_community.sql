CREATE OR REPLACE PROCEDURE join_community(p_community_id VARCHAR, p_username VARCHAR
)
AS
BEGIN
    INSERT INTO tarp_joined_by (community_id, username)
    VALUES (p_community_id, p_username);
END;