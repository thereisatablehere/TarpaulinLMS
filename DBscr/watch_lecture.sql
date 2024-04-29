-- DESCRIPTION: This procedure changes the completion to 'y'

-- CODE
CREATE OR REPLACE PROCEDURE watch_lecture(
    p_lecture_id VARCHAR,
    p_course_id VARCHAR,
    p_username VARCHAR
)
AS
BEGIN
    INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES (p_lecture_id, p_course_id, p_username);

END;

