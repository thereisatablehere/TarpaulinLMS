-- DESCRIPTION: Trigger to update the number of questions in a 
-- test after an insertion/deletion from TARP_QUESTION

-- CODE
CREATE or REPLACE TRIGGER QUESTION_INSERT_DELETE_TRIGGER
    AFTER INSERT OR DELETE ON TARP_QUESTION
    For Each Row
	Begin 
        IF INSERTING THEN --Add one to students if insertion
            UPDATE  TARP_TEST
            SET     NUM_Q = NUM_Q + 1
            WHERE   TEST_ID=:NEW.TEST_ID and COURSE_ID = :NEW.COURSE_ID;    
        ELSE --Subtract one from students if deletion
            UPDATE  TARP_TEST
            SET     NUM_Q = NUM_Q - 1
            WHERE   TEST_ID=:OLD.TEST_ID and COURSE_ID = :OLD.COURSE_ID;
        END IF;
    End ;
    