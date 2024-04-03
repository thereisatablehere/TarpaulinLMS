
SELECT * FROM TARP_COMMUNITY;
DELETE FROM tarp_joined_by WHERE community_id = 'MN' and username = 'grove5';
SELECT * FROM TARP_COMMUNITY;



--CREATE OR REPLACE PROCEDURE modify_profile(
--    p_username VARCHAR,
--    p_new_password VARCHAR
--)
--AS
--BEGIN
--    UPDATE tarp_student
--    SET password = p_new_password
--    WHERE username = p_username;
--
--    UPDATE tarp_instructor
--    SET password = p_new_password
--    WHERE username = p_username;
--END;



--CREATE OR REPLACE PROCEDURE delete_course(
--    p_course_id VARCHAR
--)
--AS
--BEGIN
--    DELETE FROM tarp_course
--    WHERE course_id = p_course_id;
--END;



--CREATE OR REPLACE PROCEDURE create_lecture(
--    p_lecture_id VARCHAR,
--    p_course_id VARCHAR,
--    p_length DECIMAL,
--    p_url VARCHAR
--)
--AS
--BEGIN
--    INSERT INTO tarp_lecture (lecture_id, course_id, length, url)
--    VALUES (p_lecture_id, p_course_id, p_length, p_url);
--END;


--CREATE OR REPLACE PROCEDURE enroll_in_course(
--    p_course_id VARCHAR,
--    p_username VARCHAR
--)
--AS
--BEGIN
--    INSERT INTO tarp_enrolls (course_id, username)
--    VALUES (p_course_id, p_username);
--END;



--CREATE OR REPLACE PROCEDURE create_community(
--    p_community_id VARCHAR,
--    p_username VARCHAR,
--    p_date_created TIMESTAMP,
--    p_c_description VARCHAR,
--    p_num_students INT
--)
--AS
--BEGIN
--    INSERT INTO tarp_community (community_id, username, date_created, c_description, num_students)
--    VALUES (p_community_id, p_username, p_date_created, p_c_description, p_num_students);
--END;



--CREATE OR REPLACE PROCEDURE delete_community(
--    p_community_id VARCHAR
--)
--AS
--BEGIN
--    DELETE FROM tarp_community
--    WHERE community_id = p_community_id;
--END;


--CREATE OR REPLACE PROCEDURE join_community(
--    p_community_id VARCHAR,
--    p_username VARCHAR
--)
--AS
--BEGIN
--    INSERT INTO tarp_joined_by (community_id, username)
--    VALUES (p_community_id, p_username);
--END;
