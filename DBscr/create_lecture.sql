CREATE OR REPLACE PROCEDURE create_lecture(p_lecture_id VARCHAR, p_course_id VARCHAR, p_length DECIMAL, p_url VARCHAR)
AS
BEGIN
    INSERT INTO tarp_lecture (lecture_id, course_id, length, url)
    VALUES (p_lecture_id, p_course_id, p_length, p_url);
END;