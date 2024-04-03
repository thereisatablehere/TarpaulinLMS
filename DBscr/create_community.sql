CREATE OR REPLACE PROCEDURE create_community(p_comm_id VARCHAR, p_username VARCHAR, p_date_created TIMESTAMP, p_c_description VARCHAR, p_num_students INT)
AS
BEGIN
    INSERT INTO tarp_community (comm_id, username, date_created, c_description, num_students)
    VALUES (p_comm_id, p_username, p_date_created, p_c_description, p_num_students);
END;