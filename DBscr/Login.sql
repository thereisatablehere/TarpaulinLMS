--DESCRIPTION: A function to determine if a user successfully logged in given username 
--and password. Returns 1 if successful, 0 otherwise.

--CODE
create or replace Function Login(p_username varchar, p_password varchar) Return int
    AS
    toReturn int := 0;
    i_exists int := 0;
    s_exists int := 0;
    Begin
        Select Count(*) into i_exists from TARP_INSTRUCTOR T 
        where T.username = p_username and T.password = p_password;

        Select Count(*) into s_exists from TARP_STUDENT T 
        where T.username = p_username and T.password = p_password;

        IF(i_exists = 1) THEN
            toReturn := 1;
        END IF;
        
        IF(s_exists = 1) THEN
            toReturn := 2;
        END IF;

        Return toReturn;
    End;
