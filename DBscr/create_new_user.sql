CREATE OR REPLACE PROCEDURE create_new_user(uname VARCHAR, f VARCHAR, l VARCHAR, pass VARCHAR, typeUser VARCHAR)
AS
BEGIN
    IF typeUser = 'S' THEN
        INSERT INTO tarp_student (username, f_name, l_name, password)
        VALUES (uname, f, l, pass);
    ELSE
        INSERT INTO tarp_instructor (username, f_name, l_name, password)
        VALUES (uname, f, l, pass);
    END IF;
END;