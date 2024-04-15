--DESCRIPTION: Function returning 1 if correct answer and 0 if incorrect given the test prompt, 
--the test_id, course_id, and the submitted answer

--CODE
Create or Replace Function CORRECT_ANSWER(f_prompt varchar, 
f_test_id varchar, f_course_id varchar, submission varchar) Return int
    AS
    c_answer varchar(30);
    toReturn int := 0;
    Begin
        Select answer into c_answer from TARP_QUESTION 
        where f_prompt = t_prompt and f_test_id = test_id and f_course_id = course_id;
        If (c_answer = submission) Then
            toReturn := 1;
        End If;
        Return toReturn;
    End ;