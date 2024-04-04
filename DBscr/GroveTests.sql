--13 Correct_Answer test
--Select CORRECT_ANSWER('What is 3 + 1?', 'test 1', 'MATH101', 'B') from dual;
--Select CORRECT_ANSWER('What is 3 + 1?', 'test 1', 'MATH101', 'C') from dual;

--12 Add Comment
--SELECT * FROM tarp_s_comment;
--EXEC add_comment_s('CSCI101', 'bartness2', '10/10!');
--SELECT * FROM tarp_s_comment;
--
--SELECT * FROM tarp_i_comment;
--EXEC add_comment_i('CSCI101', 'imad2000', 'Keep up the good work!');
--SELECT * FROM tarp_i_comment;

--15 Login
--Select Login('grove5', 'password4') from dual;
--Select Login('groove5', 'password4') from dual;
--Select Login('grove5', 'password3') from dual;


--21 Create new user
--Select * from Tarp_Student;
--set serveroutput on;
--declare x int;
--begin
--    x := Create_New_User('alec0', 'password6', 'aleco', 'great', 's');
--    DBMS_OUTPUT.PUT_LINE(x);
--end;
--/
--Select * from Tarp_Student;
--
--
--Select * from Tarp_Instructor;
--set serveroutput on;
--declare x int;
--begin
--    x := Create_New_User('heather01', 'password7', 'heather', 'ampthour', 'i');
--    DBMS_OUTPUT.PUT_LINE(x);
--end;
--/
--Select * from Tarp_Instructor;
--
--Select * from Tarp_Student;
--set serveroutput on;
--declare x int;
--begin
--    x := Create_New_User('grove5', 'password8', 'Carter', 'Grove', 's');
--    DBMS_OUTPUT.PUT_LINE(x);
--end;
--/
--Select * from Tarp_Student;


