-- EXAM Answers
CREATE PROC ST_Answer_EXAM @examid nvarchar(50),@stid decimal(18,0),@Qnum nvarchar(50), @answer nvarchar(100)
AS
BEGIN
	INSERT INTO std_exam_quest (exam_code,std_id,Quest_num,Stud_Answers)
	VALUES(@examid,@stid,@Qnum,@answer)
END;
SELECT *
FROM std_exam_quest

EXEC ST_Answer_EXAM 'DS02',1002,'Q25','a) O(1)'
EXEC ST_Answer_EXAM 'DS02',1002,'Q31','2) False'
EXEC ST_Answer_EXAM 'DS02',1002,'Q32','1) True'

