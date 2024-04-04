CREATE OR REPLACE VIEW student_grades_view AS
SELECT e.username AS student_username,
       e.course_id,
       (SELECT username FROM tarp_course WHERE course_id = e.course_id) AS instructor_username,
       (SELECT score FROM tarp_taken_by WHERE course_id = e.course_id AND username = e.username) AS score
FROM tarp_enrolls e;
