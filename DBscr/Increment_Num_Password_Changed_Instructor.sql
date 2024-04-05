--DESCRIPTION: Trigger to modify the number of times an instructor has changed their password

--CODE
CREATE OR REPLACE TRIGGER modify_instructor_profile_trigger
BEFORE UPDATE ON tarp_instructor
FOR EACH ROW
BEGIN
    IF :NEW.password <> :OLD.password THEN
        :NEW.password := :NEW.password;
        :NEW.num_changed_password := :OLD.num_changed_password + 1;
    END IF;
END;
