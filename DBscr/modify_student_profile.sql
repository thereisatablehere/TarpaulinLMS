--DESCRIPTION: Procedure to modify a student's password 
--given the username and their new password

--CODE
CREATE OR REPLACE PROCEDURE modify_student_profile(p_username VARCHAR, p_new_password VARCHAR)
AS
BEGIN
    UPDATE tarp_student
    SET password = p_new_password
    WHERE username = p_username;
END;