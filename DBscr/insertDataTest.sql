ALTER TABLE tarp_community DISABLE CONSTRAINT FK_TARP_COMMUNITY;
ALTER TABLE tarp_course DISABLE CONSTRAINT FK_TARP_COURSE;
ALTER TABLE tarp_s_comment DISABLE CONSTRAINT FK_TARP_S_COMMENT1;
ALTER TABLE tarp_s_comment DISABLE CONSTRAINT FK_TARP_S_COMMENT2;
ALTER TABLE tarp_i_comment DISABLE CONSTRAINT FK_TARP_I_COMMENT1;
ALTER TABLE tarp_i_comment DISABLE CONSTRAINT FK_TARP_I_COMMENT2;
ALTER TABLE tarp_lecture DISABLE CONSTRAINT FK_TARP_LECTURE;
ALTER TABLE tarp_test DISABLE CONSTRAINT FK_TARP_TEST;
ALTER TABLE tarp_question DISABLE CONSTRAINT FK_TARP_QUESTION1;
ALTER TABLE tarp_joined_by DISABLE CONSTRAINT FK_TARP_JOINED_BY1;
ALTER TABLE tarp_joined_by DISABLE CONSTRAINT FK_TARP_JOINED_BY2;
ALTER TABLE tarp_taken_by DISABLE CONSTRAINT FK_TARP_TAKEN_BY1;
ALTER TABLE tarp_taken_by DISABLE CONSTRAINT FK_TARP_TAKEN_BY2;
ALTER TABLE tarp_enrolls DISABLE CONSTRAINT FK_TARP_ENROLLS1;
ALTER TABLE tarp_enrolls DISABLE CONSTRAINT FK_TARP_ENROLLS2;
ALTER TABLE tarp_watches DISABLE CONSTRAINT FK_TARP_WATCHES1;
ALTER TABLE tarp_watches DISABLE CONSTRAINT FK_TARP_WATCHES2;
ALTER TABLE tarp_rates DISABLE CONSTRAINT FK_TARP_RATES1;
ALTER TABLE tarp_rates DISABLE CONSTRAINT FK_TARP_RATES2;

--data

INSERT INTO tarp_student (username, f_name, l_name, password, num_lectures, num_tests, num_courses) VALUES ('erickson25', 'Rodney', 'Erickson', 'password1', 0, 0, 0);
INSERT INTO tarp_student (username, f_name, l_name, password, num_lectures, num_tests, num_courses) VALUES ('maahs35', 'Keiley', 'Maahs', 'password2', 0, 0, 0);
INSERT INTO tarp_student (username, f_name, l_name, password, num_lectures, num_tests, num_courses) VALUES ('davis12', 'Carson', 'Davis', 'password3', 0, 0, 0);
INSERT INTO tarp_student (username, f_name, l_name, password, num_lectures, num_tests, num_courses) VALUES ('grove5', 'Carter', 'Grove', 'password4', 0, 0, 0);
INSERT INTO tarp_student (username, f_name, l_name, password, num_lectures, num_tests, num_courses) VALUES ('bartness2', 'Dylan', 'Bartness', 'password5', 0, 0, 0);


INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('imad2000', 'Imad', 'Rahal', 'password6');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('john2', 'John', 'Davidson', 'password7');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('bill34', 'Bill', 'Billy', 'password8');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('erin1234', 'Erin', 'Bert', 'password9');


INSERT INTO tarp_community (comm_id, username, date_created, c_description, num_students) VALUES ('csbsju', 'davis12',TIMESTAMP '2024-03-29 10:30:00', 'This group is for CSBSJU students!', 0);
INSERT INTO tarp_community (comm_id, username, date_created, c_description, num_students) VALUES ('MN', 'maahs35', TIMESTAMP '2024-03-29 10:30:00', 'This group is for in-state students!', 0);


INSERT INTO tarp_course (course_id, username, descrip) VALUES ('CSCI101', 'imad2000', 'Intro CSCI course');
INSERT INTO tarp_course (course_id, username, descrip) VALUES ('CSCI331', 'imad2000', 'Databases');
INSERT INTO tarp_course (course_id, username, descrip) VALUES ('MATH101', 'bill34', 'Intro math class');
INSERT INTO tarp_course (course_id, username, descrip) VALUES ('MATH231', 'bill34', 'Advanced math class');
INSERT INTO tarp_course (course_id, username, descrip) VALUES ('THEO111', 'erin1234', 'Intro theo class');


INSERT INTO tarp_s_comment (course_id, s_username, s_comment, cdate) VALUES ('CSCI101', 'grove5', 'Great course!', TIMESTAMP '2024-03-28 10:30:00');
INSERT INTO tarp_s_comment (course_id, s_username, s_comment, cdate) VALUES ('CSCI101', 'erickson25', 'Awesome course!', TIMESTAMP '2024-05-28 10:30:00');


INSERT INTO tarp_i_comment (course_id, i_username, i_comment, cdate) VALUES ('CSCI101', 'imad2000', 'Cool course!', TIMESTAMP '2024-02-28 10:30:00');
INSERT INTO tarp_i_comment (course_id, i_username, i_comment, cdate) VALUES ('MATH101', 'bill34', 'Good job everyone!!', TIMESTAMP '2024-05-28 10:30:00');


INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'CSCI101', 20.0, 'https://example.com/lecture1/CSCI101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 2', 'CSCI101', 30.0, 'https://example.com/lecture2/CSCI101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'MATH101', 25.0, 'https://example.com/lecture1/MATH101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 2', 'MATH101', 15.0, 'https://example.com/lecture2/MATH101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'THEO111', 20.0, 'https://example.com/lecture1/THEO111');


INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 1', 'CSCI101', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 2', 'CSCI101', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 3', 'CSCI101', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 1', 'THEO111', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 2', 'THEO111', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 1', 'MATH101', 0);
INSERT INTO tarp_test (test_id, course_id, num_q) VALUES ('test 2', 'MATH101', 0);


INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 + 1?', '3', '4', '5', '6', 'B', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 * 4?', '13', '14', '25', '12', 'D', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 - 3?', '3', '14', '0', '6', 'C', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 / 1?', '33', '4', '3', '6', 'C', 'test 1', 'MATH101');


INSERT INTO tarp_joined_by (community_id, username) VALUES ('csbsju', 'davis12');
INSERT INTO tarp_joined_by (community_id, username) VALUES ('csbsju', 'maahs35');
INSERT INTO tarp_joined_by (community_id, username) VALUES ('csbsju', 'grove5');
INSERT INTO tarp_joined_by (community_id, username) VALUES ('csbsju', 'bartness2');
INSERT INTO tarp_joined_by (community_id, username) VALUES ('csbsju', 'erickson25');
INSERT INTO tarp_joined_by (community_id, username) VALUES ('MN', 'davis12');


INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'grove5', 90);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 2', 'MATH101', 'grove5', 80);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'maahs35', 88);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'davis12', 65);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'bartness2', 95);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'erickson25', 80);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'THEO111', 'grove5', 100);


INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'grove5');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'maahs35');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'davis12');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'bartness2');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'erickson25');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('THEO111', 'grove5');


INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES ('Lecture 1', 'MATH101', 'bartness2');
INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES ('Lecture 2', 'MATH101', 'bartness2');
INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES ('Lecture 1', 'MATH101', 'grove5');
INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES ('Lecture 1', 'MATH101', 'maahs35');
INSERT INTO tarp_watches (lecture_id, course_id, username) VALUES ('Lecture 1', 'MATH101', 'davis12');


INSERT INTO tarp_rates (s_username, i_username, instructor_score) VALUES ('davis12', 'bill34', 4);
INSERT INTO tarp_rates (s_username, i_username, instructor_score) VALUES ('erickson25', 'bill34', 7);
INSERT INTO tarp_rates (s_username, i_username, instructor_score) VALUES ('maahs35', 'bill34', 10);



ALTER TABLE tarp_community ENABLE CONSTRAINT FK_TARP_COMMUNITY;
ALTER TABLE tarp_course ENABLE CONSTRAINT FK_TARP_COURSE;
ALTER TABLE tarp_s_comment ENABLE CONSTRAINT FK_TARP_S_COMMENT1;
ALTER TABLE tarp_s_comment ENABLE CONSTRAINT FK_TARP_S_COMMENT2;
ALTER TABLE tarp_i_comment ENABLE CONSTRAINT FK_TARP_I_COMMENT1;
ALTER TABLE tarp_i_comment ENABLE CONSTRAINT FK_TARP_I_COMMENT2;
ALTER TABLE tarp_lecture ENABLE CONSTRAINT FK_TARP_LECTURE;
ALTER TABLE tarp_test ENABLE CONSTRAINT FK_TARP_TEST;
ALTER TABLE tarp_question ENABLE CONSTRAINT FK_TARP_QUESTION1;
ALTER TABLE tarp_joined_by ENABLE CONSTRAINT FK_TARP_JOINED_BY1;
ALTER TABLE tarp_joined_by ENABLE CONSTRAINT FK_TARP_JOINED_BY2;
ALTER TABLE tarp_taken_by ENABLE CONSTRAINT FK_TARP_TAKEN_BY1;
ALTER TABLE tarp_taken_by ENABLE CONSTRAINT FK_TARP_TAKEN_BY2;
ALTER TABLE tarp_enrolls ENABLE CONSTRAINT FK_TARP_ENROLLS1;
ALTER TABLE tarp_enrolls ENABLE CONSTRAINT FK_TARP_ENROLLS2;
ALTER TABLE tarp_watches ENABLE CONSTRAINT FK_TARP_WATCHES1;
ALTER TABLE tarp_watches ENABLE CONSTRAINT FK_TARP_WATCHES2;
ALTER TABLE tarp_rates ENABLE CONSTRAINT FK_TARP_RATES1;
ALTER TABLE tarp_rates ENABLE CONSTRAINT FK_TARP_RATES2;
