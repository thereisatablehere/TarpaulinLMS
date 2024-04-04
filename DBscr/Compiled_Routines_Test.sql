-- TEST COMMUNITY_INSERT_DELETE_TRIGGER (1)

--SELECT * FROM TARP_COMMUNITY;
--INSERT INTO tarp_joined_by (community_id, username) VALUES('MN','grove5');
--SELECT * FROM TARP_COMMUNITY;

-- OUTPUT
--COMM_ID              USERNAME             DATE_CREA C_DESCRIPTION                                      NUM_STUDENTS
---------------------- -------------------- --------- -------------------------------------------------- ------------
--csbsju               davis12              29-MAR-24 This group is for CSBSJU students!                            5
--MN                   maahs35              29-MAR-24 This group is for in-state students!                          1
--
--
--1 row inserted.
--
--
--COMM_ID              USERNAME             DATE_CREA C_DESCRIPTION                                      NUM_STUDENTS
---------------------- -------------------- --------- -------------------------------------------------- ------------
--csbsju               davis12              29-MAR-24 This group is for CSBSJU students!                            5
--MN                   maahs35              29-MAR-24 This group is for in-state students!                          2

--******************************************************************************************************************************************************************

-- TEST CREATE_LECTURE (2)

--SELECT * FROM tarp_lecture WHERE course_id = 'CSCI101';
--EXEC create_lecture('SQL Queries', 'CSCI101', 25.0, 'https://example.com/SQLQueries/CSCI101');
--SELECT * FROM tarp_lecture WHERE course_id = 'CSCI101';

--OUTPUT
--LECTURE_ID           COURSE_ID                LENGTH URL                                                                                                 
---------------------- -------------------- ---------- ----------------------------------------------------------------------------------------------------
--Lecture 1            CSCI101                      20 https://example.com/lecture1/CSCI101                                                                
--Lecture 2            CSCI101                      30 https://example.com/lecture2/CSCI101                                                                
--
--
--PL/SQL procedure successfully completed.
--
--
--LECTURE_ID           COURSE_ID                LENGTH URL                                                                                                 
---------------------- -------------------- ---------- ----------------------------------------------------------------------------------------------------
--Lecture 1            CSCI101                      20 https://example.com/lecture1/CSCI101                                                                
--Lecture 2            CSCI101                      30 https://example.com/lecture2/CSCI101                                                                
--SQL Queries          CSCI101                      25 https://example.com/SQLQueries/CSCI101 

--******************************************************************************************************************************************************************

-- TEST DELETE_COURSE (3)

--SELECT * FROM tarp_course;
--INSERT INTO tarp_course (course_id, username) VALUES ('CSCI222', 'imad2000');
--SELECT * FROM tarp_course;
--EXEC delete_course('CSCI222');
--SELECT * FROM tarp_course;

-- OUTPUT
--COURSE_ID            USERNAME            
---------------------- --------------------
--CSCI101              imad2000            
--CSCI331              imad2000            
--MATH101              bill34              
--MATH231              bill34              
--THEO111              erin1234            
--CSCI222              imad2000            
--
--6 rows selected. 
--
--
--PL/SQL procedure successfully completed.
--
--
--COURSE_ID            USERNAME            
---------------------- --------------------
--CSCI101              imad2000            
--CSCI331              imad2000            
--MATH101              bill34              
--MATH231              bill34              
--THEO111              erin1234  

--******************************************************************************************************************************************************************

-- TEST ENROLL_IN_COURSE (4)

--SELECT username FROM tarp_enrolls WHERE course_id = 'CSCI101';
--EXEC enroll_in_course('CSCI101', 'erickson25');
--SELECT username FROM tarp_enrolls WHERE course_id = 'CSCI101';

-- OUTPUT
--no rows selected
--
--PL/SQL procedure successfully completed.
--
--
--USERNAME            
----------------------
--erickson25

--******************************************************************************************************************************************************************

-- TEST MODIFY_STUDENT_PROFILE (5)

--SELECT * FROM tarp_student where username = 'erickson25';
--EXEC modify_student_profile('erickson25','passwordChanged');
--SELECT * FROM tarp_student where username = 'erickson25';

-- OUTPUT
--USERNAME             F_NAME               L_NAME               PASSWORD            
---------------------- -------------------- -------------------- --------------------
--erickson25           Rodney               Erickson             password1           
--
--
--PL/SQL procedure successfully completed.
--
--
--USERNAME             F_NAME               L_NAME               PASSWORD            
---------------------- -------------------- -------------------- --------------------
--erickson25           Rodney               Erickson             passwordChanged     

--******************************************************************************************************************************************************************

-- TEST CREATE_COMMUNITY (6)

--SELECT * FROM tarp_community;
--EXEC create_community('USA', 'erickson25', TIMESTAMP '2024-01-29 10:30:00', 'This group is for USA students!', 0);
--SELECT * FROM tarp_community;

-- OUTPUT
--COMM_ID              USERNAME             DATE_CREA C_DESCRIPTION                                      NUM_STUDENTS
---------------------- -------------------- --------- -------------------------------------------------- ------------
--csbsju               davis12              29-MAR-24 This group is for CSBSJU students!                            5
--MN                   maahs35              29-MAR-24 This group is for in-state students!                          2
--
--
--PL/SQL procedure successfully completed.
--
--
--COMM_ID              USERNAME             DATE_CREA C_DESCRIPTION                                      NUM_STUDENTS
---------------------- -------------------- --------- -------------------------------------------------- ------------
--csbsju               davis12              29-MAR-24 This group is for CSBSJU students!                            5
--MN                   maahs35              29-MAR-24 This group is for in-state students!                          2
--USA                  erickson25           29-JAN-24 This group is for USA students!                               0


--******************************************************************************************************************************************************************

-- TEST VIEW_COMMENTS (10)

--SELECT *
--FROM view_comments
--WHERE course_id = 'CSCI101';

--OUTPUT
--COURSE_ID            S_USERNAME           S_COMMENT                                                                                                                                                                                                CDATE    
---------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
--CSCI101              imad2000             Cool course!                                                                                                                                                                                             28-FEB-24
--CSCI101              grove5               Great course!                                                                                                                                                                                            28-MAR-24
--CSCI101              erickson25           Awesome course! 

--******************************************************************************************************************************************************************

-- TEST ADD_COMMENT_I (12)

--SELECT * FROM tarp_i_comment;
--EXEC add_comment_i('CSCI101', 'imad2000', 'Keep up the good work!');
--SELECT * FROM tarp_i_comment;

-- OUTPUT
--COURSE_ID            I_USERNAME           I_COMMENT                                                                                                                                                                                                CDATE    
---------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
--CSCI101              imad2000             Cool course!                                                                                                                                                                                             28-FEB-24
--MATH101              bill34               Good job everyone!!                                                                                                                                                                                      28-MAY-24
--
--
--PL/SQL procedure successfully completed.
--
--
--COURSE_ID            I_USERNAME           I_COMMENT                                                                                                                                                                                                CDATE    
---------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------
--CSCI101              imad2000             Cool course!                                                                                                                                                                                             28-FEB-24
--MATH101              bill34               Good job everyone!!                                                                                                                                                                                      28-MAY-24
--CSCI101              imad2000             Keep up the good work! 

--******************************************************************************************************************************************************************

-- TEST CORRECT_ANSWER (13)

--Select CORRECT_ANSWER('What is 3 + 1?', 'test 1', 'MATH101', 'B') from dual;
--Select CORRECT_ANSWER('What is 3 + 1?', 'test 1', 'MATH101', 'C') from dual;

--OUTPUT
--CORRECT_ANSWER('WHATIS3+1?','TEST1','MATH101','B')
----------------------------------------------------
--                                                 1
--
--
--CORRECT_ANSWER('WHATIS3+1?','TEST1','MATH101','C')
----------------------------------------------------
--                                                 0

--******************************************************************************************************************************************************************

-- TEST LOGIN (14)

--Select Login('grove5', 'password4') from dual;
--Select Login('groove5', 'password4') from dual;
--Select Login('grove5', 'password3') from dual;

-- OUTPUT
--LOGIN('GROVE5','PASSWORD4')
-----------------------------
--                          1
--
--
--LOGIN('GROOVE5','PASSWORD4')
------------------------------
--                           0
--
--
--LOGIN('GROVE5','PASSWORD3')
-----------------------------
--                          0
