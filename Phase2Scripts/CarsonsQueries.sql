
STUDENT_USERNAME     COURSE_ID            INSTRUCTOR_USERNAME       SCORE
-------------------- -------------------- -------------------- ----------
davis12              MATH101              bill34                       65


1 row inserted.


1 row inserted.


STUDENT_USERNAME     COURSE_ID            INSTRUCTOR_USERNAME       SCORE
-------------------- -------------------- -------------------- ----------
davis12              CSCI101              imad2000                       
davis12              MATH101              bill34                       65
davis12              THEO111              erin1234                       


Error starting at line : 3 in command -
INSERT INTO tarp_enrolls (course_id, username) VALUES ('CSCI101', 'davis12')
Error report -
ORA-00001: unique constraint (CDAVIS002.SYS_C0065195) violated


Error starting at line : 4 in command -
INSERT INTO tarp_enrolls (course_id, username) VALUES ('THEO111', 'davis12')
Error report -
ORA-00001: unique constraint (CDAVIS002.SYS_C0065195) violated


1 row inserted.


1 row inserted.


STUDENT_USERNAME     COURSE_ID            INSTRUCTOR_USERNAME       SCORE
-------------------- -------------------- -------------------- ----------
davis12              CSCI101              imad2000                     80
davis12              MATH101              bill34                       65
davis12              THEO111              erin1234                     45


PL/SQL procedure successfully completed.


PL/SQL procedure successfully completed.


Error starting at line : 13 in command -
BEGIN
    student_courses('erickson25');
END;
Error report -
ORA-06550: line 2, column 5:
PLS-00905: object CDAVIS002.STUDENT_COURSES is invalid
ORA-06550: line 2, column 5:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

PL/SQL procedure successfully completed.

MATH101


PL/SQL procedure successfully completed.

CSCI101
MATH101
THEO111


PL/SQL procedure successfully completed.

