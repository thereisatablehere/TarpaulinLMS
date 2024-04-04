-- DESCRIPTION: This procedure changes the completion to 'y'

-- CODE
CREATE OR REPLACE PROCEDURE watch_lecture(
    p_lecture_id VARCHAR,
    p_course_id VARCHAR,
    p_username VARCHAR
)
AS
BEGIN
    UPDATE tarp_watches
    SET completed = 'y'
    WHERE lecture_id = p_lecture_id
      AND course_id = p_course_id
      AND username = p_username;

END;

