--test 1

--SELECT * FROM TARP_COMMUNITY;
--INSERT INTO tarp_joined_by (community_id, username) VALUES('MN','grove5');
--SELECT * FROM TARP_COMMUNITY;


--test 2
--SELECT * FROM tarp_student where username = 'erickson25';
--EXEC modify_student_profile('erickson25','passwordChanged');
--SELECT * FROM tarp_student where username = 'erickson25';


--test 3
--SELECT * FROM tarp_course;
--INSERT INTO tarp_course (course_id, username) VALUES ('CSCI222', 'imad2000');
--SELECT * FROM tarp_course;
--EXEC delete_course('CSCI222');
--SELECT * FROM tarp_course;



--test 4
--SELECT * FROM tarp_lecture WHERE course_id = 'CSCI101';
--EXEC create_lecture('SQL Queries', 'CSCI101', 25.0, 'https://example.com/SQLQueries/CSCI101');
--SELECT * FROM tarp_lecture WHERE course_id = 'CSCI101';


--Test 5 
--SELECT username FROM tarp_enrolls WHERE course_id = 'CSCI101';
--EXEC enroll_in_course('CSCI101', 'erickson25');
--SELECT username FROM tarp_enrolls WHERE course_id = 'CSCI101';




--test 6
--SELECT * FROM tarp_community;
--EXEC create_community('USA', 'erickson25', TIMESTAMP '2024-01-29 10:30:00', 'This group is for USA students!', 0);
--SELECT * FROM tarp_community;



--test 7
--SELECT * FROM tarp_community;
--EXEC delete_community('USA');
--SELECT * FROM tarp_community;



--test 8
--SELECT * FROM tarp_community WHERE comm_id = 'MN';
--EXEC join_community('MN', 'grove5');
--SELECT * FROM tarp_community WHERE comm_id = 'MN';








--test 9
--SELECT *
--FROM view_comments
--WHERE course_id = 'CSCI101';


--test 10
SELECT course_id 
FROM tarp_enrolls 
WHERE username = 'erickson25';





--CREATE OR REPLACE VIEW view_courses AS
--SELECT course_id
--FROM tarp_course
--WHERE username = 'username_here';
--
--
--
--
--CREATE OR REPLACE VIEW list_lectures AS
--SELECT lecture_id
--FROM tarp_lecture
--WHERE course_id IN (SELECT course_id FROM tarp_enrolls WHERE username = 'username_here');
--
--
--
--
--CREATE OR REPLACE VIEW view_all_grades AS
--SELECT course_id, score
--FROM tarp_taken_by
--WHERE username = 'username_here';

