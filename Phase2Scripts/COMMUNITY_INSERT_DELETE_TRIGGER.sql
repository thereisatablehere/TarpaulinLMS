-- DESCRIPTION: Trigger to update the number of students in a 
-- commmunity after an insertion/deletion from TARP_JOINED_BY

-- CODE
CREATE or REPLACE TRIGGER COMMUNITY_INSERT_DELETE_TRIGGER
    AFTER INSERT OR DELETE ON TARP_JOINED_BY
    For Each Row
	Begin 
        IF INSERTING THEN --Add one to students if insertion
            UPDATE  TARP_COMMUNITY 
            SET     NUM_STUDENTS = NUM_STUDENTS + 1
            WHERE   COMM_ID=:NEW.COMMUNITY_ID;    
        ELSE --Subtract one from students if deletion
            UPDATE  TARP_COMMUNITY 
            SET     NUM_STUDENTS = NUM_STUDENTS - 1
            WHERE   COMM_ID=:OLD.COMMUNITY_ID; 
        END IF;
    End ;
    