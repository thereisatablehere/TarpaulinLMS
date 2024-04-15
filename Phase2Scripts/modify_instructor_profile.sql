--DESCRIPTION: Procedure to modify an instructor's password 
--given the username and their new password

--CODE
CREATE OR REPLACE PROCEDURE modify_instructor_profile(p_username VARCHAR, p_new_password VARCHAR)
AS
BEGIN
    UPDATE tarp_instructor
    SET password = p_new_password
    WHERE username = p_username;
END;