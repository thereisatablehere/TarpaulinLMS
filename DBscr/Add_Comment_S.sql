CREATE OR REPLACE PROCEDURE Add_Comment_S(p_course_id VARCHAR, p_username VARCHAR, p_comment VARCHAR)
AS
BEGIN
    INSERT INTO tarp_s_comment (course_id, s_username, s_comment, cdate)
    VALUES (p_course_id, p_username, p_comment, SYSDATE);
END;
