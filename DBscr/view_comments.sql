CREATE OR REPLACE VIEW view_comments AS
SELECT course_id, s_username, s_comment, cdate
FROM tarp_s_comment
UNION 
SELECT course_id, i_username AS s_username, i_comment AS s_comment, cdate
FROM tarp_i_comment
ORDER BY cdate;
