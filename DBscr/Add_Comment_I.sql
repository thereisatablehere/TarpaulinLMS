CREATE OR REPLACE PROCEDURE Add_Comment_I(p_course_id VARCHAR, p_username VARCHAR, p_comment VARCHAR)
AS
BEGIN
    INSERT INTO tarp_i_comment (course_id, i_username, i_comment, cdate)
    VALUES (p_course_id, p_username, p_comment, SYSDATE);
END;
