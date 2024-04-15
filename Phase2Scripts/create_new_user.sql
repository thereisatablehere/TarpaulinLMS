-- DESCRIPTION: This procedure creates a new user using the provided parameters

-- CODE
create or replace PROCEDURE create_new_user(uname VARCHAR, f VARCHAR, l VARCHAR, pass VARCHAR, typeUser VARCHAR)
AS
BEGIN
    IF typeUser = 'S' THEN
        INSERT INTO tarp_student (username, f_name, l_name, password, num_changed_password, num_lectures, num_tests, num_courses)
        VALUES (uname, f, l, pass, 0, 0, 0, 0);
    ELSE
        INSERT INTO tarp_instructor (username, f_name, l_name, password, num_changed_password)
        VALUES (uname, f, l, pass, 0);
    END IF;
END;

