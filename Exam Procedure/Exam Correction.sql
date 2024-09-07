-- Exam Coorection

CREATE PROC EXAM_Correct @exam_code NVARCHAR(20), @std_id decimal(18,0)
AS
BEGIN
UPDATE std_exam_quest
SET Grade =
	case 
	when Right_Answer=1 then 10
	Else 0 end
FROM std_exam_quest sq join Question Q
	ON sq.Quest_num = Q.Quest_num
JOIN Choice C
	ON C.quest_num = Q.Quest_num
WHERE exam_code = @exam_code  and std_id = @std_id  and sq.Stud_Answers=C.Choice
END;



--==================TEST====================
--DELETE FROM std_exam_quest 
--where exam_code='SQ01'and std_id=1003

EXEC ST_Answer_EXAM 'SQ01',1003,'Q1','b) SELECT'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q12','2) False'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q13','2) False'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q14','1) True'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q15','1) True'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q2','c)  To update rows in a table'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q3','b)  DISTINCT'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q4','c)  Deletes duplicate records'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q5','c)  AVG()'
EXEC ST_Answer_EXAM 'SQ01',1003,'Q6','a)  Ascending'

[dbo].[p_Qs_WithStudent_Answers] 'SQ01',1003

EXEC EXAM_Correct 'SQ01',1003

EXEC get_std_grade 1003




