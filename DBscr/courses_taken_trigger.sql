-- DESCRIPTION: Trigger to update the number of courses a student 
-- is taking in TARP_STUDENT after an insertion/deletion
-- from TARP_TAKEN_BY

-- CODE
CREATE or REPLACE TRIGGER COURSES_TAKEN_TRIGGER
    AFTER INSERT OR DELETE ON TARP_ENROLLS
    For Each Row
	Begin 
        IF INSERTING THEN --Add one to courses_taken if insertion
            UPDATE  TARP_STUDENT 
            SET     NUM_COURSES = NUM_COURSES + 1
            WHERE   USERNAME =:NEW.USERNAME;    
        ELSE --Subtract one from courses_taken if deletion
            UPDATE  TARP_STUDENT 
            SET     NUM_COURSES = NUM_COURSES - 1
            WHERE   USERNAME=:OLD.USERNAME; 
        END IF;
    End ;
    