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