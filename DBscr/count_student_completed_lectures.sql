Create or Replace Function count_student_completed_lectures(uname VARCHAR) Return int
AS 
	numLectures int := 0;
	Begin
		Select Count(*) into numLectures from TARP_WATCHES T where uname = T.username and T.completed = 'y';
		Return  numLectures;
	End ;
