--DESCRIPTION: A view to see all grades on the tests

--CODE

CREATE OR REPLACE VIEW view_all_student_grades AS
SELECT DISTINCT username, course_id, VIEW_GRADE(TE.username, TE.course_id) AS GRADE
FROM tarp_taken_by TE;