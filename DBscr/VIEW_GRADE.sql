-- DESCRIPTION: Function to return a student's grade (progress) for a specific course
-- Lectures count for 2 points and tests count for 5

-- CODE
Create or Replace Function view_grade(uname VARCHAR, c_id VARCHAR) Return NUMBER
AS 
    courseTotal int := 0;
    studentTotal int := 0;
    courseLectures int := 0;
    courseTests int := 0;
    studentLectures int := 0;
    studentTests int := 0;
	Begin
		Select Count(*) * 2 into courseLectures from TARP_LECTURE where course_id = c_id;
        
        Select Count(*) * 2 into studentLectures from TARP_WATCHES 
        where uname = username and course_id = c_id and completed = 'y';
        
        Select Count(*) * 5 into courseTests from TARP_TEST where course_id = c_id;
        Select Count(*) * 5 into studentTests from TARP_TAKEN_BY 
        
        where uname = username and course_id = c_id;
        courseTotal := courseLectures + courseTests;
        
        studentTotal := studentLectures + studentTests;
		Return  studentTotal/courseTotal * 100;
	End ;
