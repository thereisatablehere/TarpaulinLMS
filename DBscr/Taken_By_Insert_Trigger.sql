-- DESCRIPTION: Trigger to update the number of tests  a 
-- student has taken

-- CODE
CREATE or REPLACE TRIGGER TAKEN_BY_INSERT_TRIGGER
    AFTER INSERT OR DELETE ON TARP_TAKEN_BY
    For Each Row
	Begin 
        IF INSERTING THEN --Add one to students if insertion
            UPDATE  TARP_STUDENT
            SET     NUM_TESTS = NUM_TESTS + 1
            WHERE   USERNAME=:NEW.USERNAME;    
        ELSE --Subtract one from students if deletion
            UPDATE  TARP_STUDENT
            SET     NUM_TESTS = NUM_TESTS - 1
            WHERE   USERNAME=:OLD.USERNAME;
        END IF;
    End ;