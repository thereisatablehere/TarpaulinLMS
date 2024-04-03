CREATE OR REPLACE PROCEDURE modify_instructor_profile(p_username VARCHAR, p_new_password VARCHAR)
AS
BEGIN
    UPDATE tarp_instructor
    SET password = p_new_password
    WHERE username = p_username;
END;