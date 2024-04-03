create or replace Function Create_New_User(p_username varchar, p_password varchar, p_first varchar, p_last varchar, u_type char) Return int 
    AS
    i_exists int := 0;
    s_exists int := 0;
    toReturn int := 0;
    Begin
        Select Count(*) into i_exists from TARP_INSTRUCTOR T where T.username = p_username;
        Select Count(*) into s_exists from TARP_STUDENT T where T.username = p_username;
        If (i_exists = 1 OR s_exists = 1) Then
            toReturn := 0;
        ELSIF (u_type = 's') Then
            toReturn := 1;
            INSERT INTO tarp_student (username, f_name, l_name, password)
            VALUES (p_username, p_first, p_last, p_password);
        ELSIF (u_type = 'i') Then
            toReturn := 1;
            INSERT INTO tarp_instructor (username, f_name, l_name, password)
            VALUES (p_username, p_first, p_last, p_password);
        End If;
        Return toReturn;
    End ;