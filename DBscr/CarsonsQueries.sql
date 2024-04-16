--TEST 1 VIEW_COURSES_TAKING

SELECT * FROM view_courses_taking;

INSERT INTO tarp_enrolls (course_id, username) VALUES ('CSCI101', 'davis12');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('THEO111', 'davis12');

SELECT * FROM view_courses_taking;

--COURSE_ID           
----------------------
--MATH101
--
--
--1 row inserted.
--
--
--1 row inserted.
--
--
--COURSE_ID           
----------------------
--CSCI101
--MATH101
--THEO111


--TEST 2 MODIFY_USER

--STUDENT

--SELECT num_changed_password
--FROM tarp_student
--WHERE username = 'davis12';
--
--
--UPDATE tarp_student
--SET password = 'new_password121'
--WHERE username = 'davis12';
--
--SELECT num_changed_password
--FROM tarp_student
--WHERE username = 'davis12';

--NUM_CHANGED_PASSWORD
----------------------
--                   0
--
--
--1 row updated.
--
--
--NUM_CHANGED_PASSWORD
----------------------
--                   1

--INSTRUCTOR

--SELECT num_changed_password
--FROM tarp_instructor
--WHERE username = 'imad2000';
--
--
--UPDATE tarp_instructor
--SET password = 'new_password232'
--WHERE username = 'imad2000';
--
--SELECT num_changed_password
--FROM tarp_instructor
--WHERE username = 'imad2000';

--NUM_CHANGED_PASSWORD
----------------------
--                   0
--
--
--1 row updated.
--
--
--NUM_CHANGED_PASSWORD
----------------------
--                   1
