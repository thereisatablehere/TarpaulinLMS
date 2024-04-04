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

-- TEST VIEW_COURSES TAUGHT (15)

-- DESCRIPTION: View courses that an instructor teaches

-- CODE

--SELECT course_id
--FROM TARP_COURSE tp
--WHERE tp.username = 'bill34';

-- OUTPUT
--COURSE_ID           
----------------------
--MATH101
--MATH231

--******************************************************************************************************************************************************************


-- TEST VIEW_ALL_GRADES (18)

-- DESCRIPTION: View the grades (progress percentage) 
-- for each course a specific student is taking.

-- CODE

--SELECT COURSE_ID, VIEW_GRADE('grove5', TE.course_id) AS GRADE
--FROM TARP_ENROLLS TE
--WHERE username = 'grove5';

--COURSE_ID                 GRADE
---------------------- ----------
--MATH101              85.7142857
--THEO111              41.6666667







