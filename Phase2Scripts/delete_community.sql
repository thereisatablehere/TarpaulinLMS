CREATE OR REPLACE PROCEDURE delete_community(p_comm_id VARCHAR)
AS
BEGIN
    DELETE FROM tarp_community
    WHERE comm_id = p_comm_id;
END;


