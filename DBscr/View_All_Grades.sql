--DESCRIPTION: A view to see all grades on the tests

--CODE


CREATE OR REPLACE VIEW student_grades_view AS
SELECT score
FROM tarp_taken_by;