--View_courses_taught by instructor bill34

SELECT course_id
FROM TARP_COURSE tp
WHERE tp.username = 'bill34';

--test create_new_user (student)
SELECT * FROM tarp_student;
EXEC create_new_user('kerry8','Kerry', 'Maahs', 'kerryPass', 'S');
SELECT * FROM tarp_student;

--test create_new_user (instructor)
SELECT * FROM tarp_instructor;
EXEC create_new_user('chuck21','Chuck', 'Maahs', 'chuckPass', 'I');
SELECT * FROM tarp_instructor;

--test count_student_completed_lectures
Select Count(*) from TARP_WATCHES T where 'grove5' = T.username and T.completed = 'y';

SELECT count_student_completed_lectures('grove5')  from DUal;

Select Count(*) from TARP_WATCHES T where 'bartness2' = T.username and T.completed = 'y';

SELECT count_student_completed_lectures('bartness2')  from DUal;

--test sum_student_tests

Select SUM(T.score) from TARP_TAKEN_BY T where 'grove5' = T.username;

SELECT sum_student_tests('grove5')  from DUal;
