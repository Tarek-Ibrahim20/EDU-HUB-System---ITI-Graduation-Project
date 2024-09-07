USE Edu_Hub

-----Generate EXAM-------
Alter PROC Generate_EXAM @crsname nvarchar(50)
AS
BEGIN
SELECT Crs_name, Exam_code, Question, type, 
       STRING_AGG(choice, '  ') AS choices
FROM Course C 
JOIN Question Q
    ON C.Crs_ID = Q.CID
JOIN Exam_Question EQ
    ON EQ.Q_num = Q.Quest_num
JOIN Choice cc
    ON cc.quest_num = Q.Quest_num
WHERE Crs_name =  @crsname
GROUP BY Crs_name, Exam_code, Question, type;
END;

EXEC Generate_EXAM 'SQL'
EXEC Generate_EXAM 'Data Structure'
EXEC Generate_EXAM 'Illustrator'
EXEC Generate_EXAM 'HTML/CSS'

