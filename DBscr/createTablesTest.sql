-- tarp_student
DROP TABLE tarp_student CASCADE CONSTRAINTS;
CREATE TABLE tarp_student (
  username  varchar(20),
  f_name    varchar(20),
  l_name    varchar(20), 
  password  varchar(20),
  num_changed_password decimal(5, 0) DEFAULT 0,
  num_courses int,
  primary key (username)
);

-- tarp_instructor
DROP TABLE tarp_instructor CASCADE CONSTRAINTS;
CREATE TABLE tarp_instructor (
  username  varchar(20),
  f_name    varchar(20),
  l_name    varchar(20), 
  password  varchar(20),
  num_changed_password decimal(5, 0) DEFAULT 0,
  primary key (username)
);

-- tarp_community
DROP TABLE tarp_community CASCADE CONSTRAINTS;
CREATE TABLE tarp_community (
  comm_id  varchar(20),
  username    varchar(20),
  date_created  date,
  c_description varchar(50),
  num_students int,
  primary key (comm_id),
  Constraint FK_TARP_COMMUNITY foreign key (username) references tarp_student(username)
);

-- tarp_course
DROP TABLE tarp_course CASCADE CONSTRAINTS;
CREATE TABLE tarp_course (
  course_id  varchar(20),
  username    varchar(20),
  primary key (course_id),
  Constraint FK_TARP_COURSE foreign key (username) references tarp_instructor(username)
);

-- tarp_s_comment
DROP TABLE tarp_s_comment CASCADE CONSTRAINTS;
CREATE TABLE tarp_s_comment (
  course_id  varchar(20),
  s_username    varchar(20),
  s_comment varchar(200),
  cdate date,
  primary key (course_id, s_username, cdate),
  Constraint FK_TARP_S_COMMENT1 foreign key (course_id) references tarp_course(course_id),
  Constraint FK_TARP_S_COMMENT2 foreign key (s_username) references tarp_student(username)
);

-- tarp_i_comment
DROP TABLE tarp_i_comment CASCADE CONSTRAINTS;
CREATE TABLE tarp_i_comment (
  course_id  varchar(20),
  i_username    varchar(20),
  i_comment varchar(200),
  cdate date,
  primary key (course_id, i_username, cdate),
  Constraint FK_TARP_I_COMMENT1 foreign key (course_id) references tarp_course(course_id),
  Constraint FK_TARP_I_COMMENT2 foreign key (i_username) references tarp_instructor(username)
);

-- tarp_lecture
DROP TABLE tarp_lecture CASCADE CONSTRAINTS;
CREATE TABLE tarp_lecture (
  lecture_id varchar(20),
  course_id  varchar(20),
  length    decimal(3,1),
  url   varchar(100),
  primary key (lecture_id, course_id),
  Constraint FK_TARP_LECTURE foreign key (course_id) references tarp_course(course_id)
);

-- tarp_test
DROP TABLE tarp_test CASCADE CONSTRAINTS;
CREATE TABLE tarp_test (
  test_id varchar(20),
  course_id  varchar(20),
  primary key (test_id, course_id),
  Constraint FK_TARP_TEST foreign key (course_id) references tarp_course(course_id)
);

-- tarp_question
DROP TABLE tarp_question CASCADE CONSTRAINTS;
CREATE TABLE tarp_question (
  t_prompt  varchar(60),
  a varchar(30),
  b varchar(30),
  c varchar(30),
  d varchar(30),
  answer varchar(30),
  test_id varchar(20),
  course_id  varchar(20),
  primary key (t_prompt, test_id, course_id),
  Constraint FK_TARP_QUESTION1 foreign key (test_id,course_id) references tarp_test(test_id,course_id)
);

-- tarp_joined_by
DROP TABLE tarp_joined_by CASCADE CONSTRAINTS;
CREATE TABLE tarp_joined_by (
  community_id  varchar(20),
  username varchar(20),
  primary key (community_id, username),
  Constraint FK_TARP_JOINED_BY1 foreign key (community_id) references tarp_community(comm_id),
  Constraint FK_TARP_JOINED_BY2 foreign key (username) references tarp_student(username)
);

-- tarp_taken_by
DROP TABLE tarp_taken_by CASCADE CONSTRAINTS;
CREATE TABLE tarp_taken_by (
  test_id varchar(20),
  course_id  varchar(20),
  username varchar(20),
  score int,
  primary key (test_id, course_id, username),
  Constraint FK_TARP_TAKEN_BY1 foreign key (course_id) references tarp_course(course_id),
  Constraint FK_TARP_TAKEN_BY2 foreign key (username) references tarp_student(username)
);

-- tarp_enrolls
DROP TABLE tarp_enrolls CASCADE CONSTRAINTS;
CREATE TABLE tarp_enrolls (
  course_id  varchar(20),
  username    varchar(20),
  primary key (course_id, username),
  Constraint FK_TARP_ENROLLS1 foreign key (course_id) references tarp_course(course_id),
  Constraint FK_TARP_ENROLLS2 foreign key (username) references tarp_student(username)
);

-- tarp_watches
DROP TABLE tarp_watches CASCADE CONSTRAINTS;
CREATE TABLE tarp_watches (
  lecture_id varchar(20),
  course_id  varchar(20),
  username varchar(20),
  completed CHAR(1),
  primary key (lecture_id, course_id, username),
  Constraint FK_TARP_WATCHES1 foreign key (course_id, lecture_id) references tarp_lecture(course_id, lecture_id),
  Constraint FK_TARP_WATCHES2 foreign key (username) references tarp_student(username)
);

-- tarp_rates
DROP TABLE tarp_rates CASCADE CONSTRAINTS;
CREATE TABLE tarp_rates (
  s_username varchar(20),
  i_username varchar(20),
  instructor_score int,
  primary key (s_username, i_username),
  Constraint FK_TARP_RATES1 foreign key (s_username) references tarp_student(username),
  Constraint FK_TARP_RATES2 foreign key (i_username) references tarp_instructor(username)
);

