CREATE OR REPLACE PROCEDURE rate_instructor(
    p_course_id VARCHAR,
    p_student_username VARCHAR,
    p_rating INT
)
AS
    v_instructor_username VARCHAR(20);
BEGIN
    SELECT username INTO v_instructor_username
    FROM tarp_course
    WHERE course_id = p_course_id;

    INSERT INTO tarp_rates (s_username, i_username, instructor_score)
    VALUES (p_student_username, v_instructor_username, p_rating);

   
END RATE_INSTRUCTOR;



