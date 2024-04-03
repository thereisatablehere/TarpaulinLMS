CREATE OR REPLACE PROCEDURE enroll_in_course(p_course_id VARCHAR, p_username VARCHAR)
AS
BEGIN
    INSERT INTO tarp_enrolls (course_id, username)
    VALUES (p_course_id, p_username);
END;