Create or Replace Function sum_student_tests(uname VARCHAR) Return int
AS 
	totalPoints int := 0;
	Begin
		Select SUM(T.score) into totalPoints from TARP_TAKEN_BY T where uname = T.username;
		Return  totalPoints;
	End ;
