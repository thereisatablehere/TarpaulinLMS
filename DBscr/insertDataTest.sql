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

INSERT INTO tarp_student (username, f_name, l_name, password) VALUES ('erickson25', 'Rodney', 'Erickson', 'password1');
INSERT INTO tarp_student (username, f_name, l_name, password) VALUES ('maahs35', 'Keiley', 'Maahs', 'password2');
INSERT INTO tarp_student (username, f_name, l_name, password) VALUES ('davis12', 'Carson', 'Davis', 'password3');
INSERT INTO tarp_student (username, f_name, l_name, password) VALUES ('grove5', 'Carter', 'Grove', 'password4');
INSERT INTO tarp_student (username, f_name, l_name, password) VALUES ('bartness2', 'Dylan', 'Bartness', 'password5');


INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('imad2000', 'Imad', 'Rahal', 'password6');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('john2', 'John', 'Davidson', 'password7');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('bill34', 'Bill', 'Billy', 'password8');
INSERT INTO tarp_instructor (username, f_name, l_name, password) VALUES('erin1234', 'Erin', 'Bert', 'password9');


INSERT INTO tarp_community (community_id, username) VALUES ('csbsju', 'davis12');
INSERT INTO tarp_community (community_id, username) VALUES ('MN', 'maahs35');


INSERT INTO tarp_course (course_id, username) VALUES ('CSCI101', 'imad2000');
INSERT INTO tarp_course (course_id, username) VALUES ('CSCI331', 'imad2000');
INSERT INTO tarp_course (course_id, username) VALUES ('MATH101', 'bill34');
INSERT INTO tarp_course (course_id, username) VALUES ('MATH231', 'bill34');
INSERT INTO tarp_course (course_id, username) VALUES ('THEO111', 'erin1234');


INSERT INTO tarp_s_comment (course_id, s_username, s_comment, cdate) VALUES ('CSCI101', 'grove5', 'Great course!', TIMESTAMP '2024-03-28 10:30:00');
INSERT INTO tarp_s_comment (course_id, s_username, s_comment, cdate) VALUES ('CSCI101', 'erickson25', 'Awesome course!', TIMESTAMP '2024-05-28 10:30:00');


INSERT INTO tarp_i_comment (course_id, i_username, i_comment, cdate) VALUES ('CSCI101', 'imad2000', 'Cool course!', TIMESTAMP '2024-02-28 10:30:00');
INSERT INTO tarp_i_comment (course_id, i_username, i_comment, cdate) VALUES ('MATH101', 'bill34', 'Good job everyone!!', TIMESTAMP '2024-05-28 10:30:00');


INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'CSCI101', 20.0, 'https://example.com/lecture1/CSCI101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 2', 'CSCI101', 30.0, 'https://example.com/lecture2/CSCI101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'MATH101', 25.0, 'https://example.com/lecture1/MATH101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 2', 'MATH101', 15.0, 'https://example.com/lecture2/MATH101');
INSERT INTO tarp_lecture (lecture_id, course_id, length, url) VALUES ('Lecture 1', 'THEO111', 20.0, 'https://example.com/lecture1/THEO111');


INSERT INTO tarp_test (test_id, course_id) VALUES ('test 1', 'CSCI101');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 2', 'CSCI101');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 3', 'CSCI101');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 1', 'THEO111');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 2', 'THEO111');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 1', 'MATH101');
INSERT INTO tarp_test (test_id, course_id) VALUES ('test 2', 'MATH101');


INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 + 1?', '3', '4', '5', '6', 'B', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 * 4?', '13', '14', '25', '12', 'D', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 - 3?', '3', '14', '0', '6', 'C', 'test 1', 'MATH101');
INSERT INTO tarp_question (t_prompt, a, b, c, d, answer, test_id, course_id) VALUES ('What is 3 / 1?', '33', '4', '3', '6', 'C', 'test 1', 'MATH101');


INSERT INTO tarp_joined_by (community_id, username, c_rank) VALUES ('csbsju', 'davis12', 1);
INSERT INTO tarp_joined_by (community_id, username, c_rank) VALUES ('csbsju', 'maahs35', 2);
INSERT INTO tarp_joined_by (community_id, username, c_rank) VALUES ('csbsju', 'grove5', 3);
INSERT INTO tarp_joined_by (community_id, username, c_rank) VALUES ('csbsju', 'bartness2', 4);
INSERT INTO tarp_joined_by (community_id, username, c_rank) VALUES ('csbsju', 'erickson25', 5);


INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'grove5', 90);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'maahs35', 88);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'davis12', 65);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'bartness2', 95);
INSERT INTO tarp_taken_by (test_id, course_id, username, score) VALUES ('test 1', 'MATH101', 'erickson25', 80);


INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'grove5');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'maahs35');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'davis12');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'bartness2');
INSERT INTO tarp_enrolls (course_id, username) VALUES ('MATH101', 'erickson25');


INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 1', 'MATH101', 'bartness2', 'y');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 2', 'MATH101', 'bartness2', 'y');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 1', 'MATH101', 'grove5', 'y');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 2', 'MATH101', 'grove5', 'n');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 1', 'MATH101', 'maahs35', 'y');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 2', 'MATH101', 'maahs35', 'n');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 1', 'MATH101', 'davis12', 'y');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 2', 'MATH101', 'davis12', 'n');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 1', 'MATH101', 'erickson25', 'n');
INSERT INTO tarp_watches (lecture_id, course_id, username, completed) VALUES ('Lecture 2', 'MATH101', 'erickson25', 'n');


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
