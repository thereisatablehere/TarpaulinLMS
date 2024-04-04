CREATE OR REPLACE PROCEDURE student_courses(student_username VARCHAR)
IS
BEGIN
    FOR course_row IN (SELECT course_id FROM tarp_enrolls WHERE username = student_username) LOOP
            DBMS_OUTPUT.PUT_LINE(course_row.course_id);
    END LOOP;
END;
