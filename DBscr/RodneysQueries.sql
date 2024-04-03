--test 1

--SELECT * FROM TARP_COMMUNITY;
--DELETE FROM tarp_joined_by WHERE community_id = 'MN' and username = 'grove5';
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

