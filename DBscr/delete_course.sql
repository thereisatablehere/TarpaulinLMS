CREATE OR REPLACE PROCEDURE delete_course(p_course_id VARCHAR)
AS
BEGIN
    DELETE FROM tarp_course
    WHERE course_id = p_course_id;
END;