-- Procedures "Certificates"
----> 1. SELECT

CREATE PROC P_Get_Certificate
AS
	BEGIN
	SELECT *
	FROM Certificates
	END;
	Go
---> 2. INSERT

CREATE PROC P_ins_Certificate
	(@cerid nvarchar(50)
	,@code nvarchar(50)
	,@type nvarchar(50)
	,@Title nvarchar(200) 
	,@sdate datetime
	,@expdate datetime
	,@duration decimal(18, 0)
	,@platform nvarchar(100))
AS
BEGIN
	INSERT INTO Certificates (Certf_ID,Code,type,Title,Startdate,expiration,Duration,Platform)
	VALUES(@cerid ,@code,@type,@Title,@sdate,@expdate,@duration,@platform)
END;
Go
----> 3. UPDATE

CREATE PROC P_upd_Certificate 	
	(@cerid nvarchar(50)
	,@code nvarchar(50)
	,@type nvarchar(50)
	,@Title nvarchar(200) 
	,@sdate datetime
	,@expdate datetime
	,@duration decimal(18, 0)
	,@platform nvarchar(100))
AS
BEGIN
	UPDATE Certificates
	SET 
	Code = @code,
	type =@type, 
	Title =@Title,
	Startdate =@sdate,
	expiration=@expdate, 
	Duration=@duration, 
	Platform =@platform
	WHERE Certf_ID= @cerid
END;
Go
---> 4. DELETE

CREATE PROC P_del_Certificate @cerid nvarchar(50)
AS
BEGIN
	DELETE FROM Certificates
	WHERE Certf_ID= @cerid
END;
GO
--==============================================================
-- Procedures "std-Certificates"
----> 1. SELECT

CREATE PROC P_Get_stdcertificate
AS
	BEGIN
	SELECT *
	FROM St_certf
	END;
	Go
---> 2. INSERT

CREATE PROC P_ins_stdcertificate
	(@sid decimal(18, 0),
	 @cerid nvarchar(50))
AS
BEGIN
	INSERT INTO St_certf (St_ID,crt_ID)
	VALUES(@sid,@cerid )
END;
Go
----> 3. UPDATE

CREATE PROC P_upd_stdcertificate 	
	(@sid decimal(18, 0),
	@cerid nvarchar(50))
AS
BEGIN
	UPDATE St_certf
	SET 
	St_ID =@sid,crt_ID=@cerid
	WHERE crt_ID= @cerid
END;
Go
---> 4. DELETE

CREATE PROC P_del_stdcertificate @sid decimal(18, 0)
AS
BEGIN
	DELETE FROM St_certf
	WHERE St_ID= @sid
END;
GO
--==============================================================
-- Procedures "std_social"
----> 1. SELECT

CREATE PROC P_Get_stdsocial
AS
BEGIN
	SELECT [St_ID],[URL],[Platform]
	FROM St_Social
END;
Go
---> 2. INSERT

CREATE PROC P_ins_stdsocial (@ID decimal(18, 0),@Url nvarchar(200),@platform nvarchar(50))
AS
BEGIN
	INSERT INTO St_Social (St_ID,URL,Platform)
	VALUES(@ID ,@Url,@platform)
END;
Go
----> 3. UPDATE

CREATE PROC P_upd_stdsocial (@ID decimal(18, 0),@Url nvarchar(200),@platform nvarchar(50))
AS
BEGIN
	UPDATE St_Social
	SET URL=@Url
	WHERE St_ID=@ID and Platform=@platform
END;
Go
---> 4. DELETE

CREATE PROC P_del_stdsocial @ID decimal(18, 0), @platform nvarchar(50)
AS
BEGIN
	DELETE FROM St_Social
	WHERE St_ID = @ID and Platform = @platform
END;
GO
--==============================================================
-- Procedures "Subscription"
----> 1. SELECT

CREATE PROC P_Get_Subscription
AS
BEGIN
	SELECT [St_ID],[ID],[Type],[cost],[Start_date],[End_date]
	FROM Subscription
END;
Go
---> 2. INSERT

CREATE PROC P_ins_Subscription
	(@sid decimal(18, 0),
	@id decimal(18, 0),
	@type nvarchar(100),
	@cost decimal(18, 0), 
	@sdate datetime,
	@edate datetime)
AS
BEGIN
	INSERT INTO Subscription (St_ID,ID,Type,cost,Start_date,End_date)
	VALUES(@sid,@id,@type,@cost,@sdate,@edate)
END;
Go
----> 3. UPDATE

CREATE PROC P_upd_Subscription
	(@sid decimal(18, 0),
	@id decimal(18, 0),
	@type nvarchar(100),
	@cost decimal(18, 0), 
	@sdate datetime,
	@edate datetime)
AS
BEGIN
	UPDATE Subscription
	SET Type = @type 
	WHERE St_ID =@sid and ID =@id
END;
Go
---> 4. DELETE

CREATE PROC P_del_Subscription 
	@sid decimal(18, 0),
	@id decimal(18, 0)
AS
BEGIN
	DELETE FROM Subscription
	WHERE St_ID=@sid and @id=ID
END;
GO
--==============================================================
-- Procedures "freelancing job"
---> 1. SELECT
CREATE PROC P_CALL_Freelancing                    
AS               
BEGIN 
SELECT * FROM Freelancing_job
END; 
Go
--EXEC  P_CALL_Freelancing  

---> 2. INSERT
CREATE PROC P_addto_Freelancing  
	    @Fr_ID decimal(18,0) ,
		@Job_name nvarchar(200),
		@Job_type nvarchar(50),
		@Job_Budget decimal(18,0),
		@Website nvarchar(100),
		@Client_name nvarchar(100) ,
		@client_phone nvarchar (100),
		@st_ID decimal(18,0)
AS
BEGIN
INSERT INTO Freelancing_job(Fr_ID,Job_name,Job_type,Job_Budget,Website,Client_name,client_phone)
VALUES (@Fr_ID,@Job_name,@Job_type,@Job_Budget,@Website,@Client_name,@client_phone)
END;
Go

--> 3. UPDATE 
CREATE PROCEDURE p_upd_freelancing
		 @Fr_ID decimal(18,0) ,
		@Job_name nvarchar(200)=null,
		@Job_type nvarchar(50)=null,
		@Job_Budget decimal(18,0) = null,
		@Website nvarchar(100) = null,
		@Client_name nvarchar(100) = null ,
		@client_phone nvarchar (100) = null,
		@st_ID decimal(18,0) = null
AS
BEGIN
    -- Update statement for the Freelancing_Job table
    UPDATE Freelancing_job
    SET
        Fr_ID = COALESCE(@Fr_ID, Fr_ID),
        Job_name = COALESCE(@Job_name,Job_name),
        Job_type= COALESCE(@Job_type,Job_type),
        Job_Budget = COALESCE(@Job_Budget,Job_Budget),
        Website = COALESCE(@Website,Website),
        Client_name = COALESCE(@Client_name,Client_name),
        client_phone = COALESCE(@client_phone,client_phone)
    WHERE
       Fr_ID = @Fr_ID;
END;
Go
--exec p_upd_freelancing
--@Fr_ID=1,
--@Job_Budget=600;

--> 4. DELETE 
CREATE PROC P_DEL_freelancing
	@Fr_ID decimal(18,0)
AS
BEGIN
DELETE FROM Freelancing_job
WHERE Fr_ID = @Fr_ID
END;
GO
--==============================================================
--procedure "question" 
--> 1. SELECT 
CREATE PROC P_call_question
AS
BEGIN                                                 
SELECT * FROM Question
END;
Go

-->2. INSERT
CREATE PROC P_addto_question
	@Quest_num nvarchar(50),
	@Question nvarchar(300),
	@type nvarchar(50)
AS
BEGIN
INSERT INTO Question(Quest_num,Question,type)
VALUES (@Quest_num,@Question,@type)
END;
Go

--> 3. UPDATE 
CREATE PROC P_upd_question
	@Quest_num nvarchar(50),
	@Question nvarchar(300)= NULL,
	@type nvarchar(50)= NULL
AS
BEGIN
	UPDATE Question
	SET
	Question= COALESCE(@question,question),
	type = COALESCE (@type,type)
	WHERE
	Quest_num=@Quest_num
END;
Go
--> 4.DELETE
CREATE PROC P_del_question
	@quest_num nvarchar(50)
AS
BEGIN 
DELETE FROM Question
WHERE Quest_num=@Quest_num
END;
GO
--==============================================================
--Procedure "Course"
---> 1. SELECT
CREATE PROC P_CALL_course                 
AS 
BEGIN 
SELECT * FROM Course                 
END; 
Go
--EXEC P_CALL_course

---> 2.INSERT
CREATE PROC P_addto_course
	@Crs_ID nvarchar(50),
	@Crs_name nvarchar(50),
	@Duraion decimal(18,0),
	@Dept_ID decimal(18,0)
AS
BEGIN
INSERT INTO Course (Crs_ID,Crs_name,Duraion,Dept_ID)
VALUES (@Crs_ID,@Crs_name,@Duraion,@Dept_ID)
END;
Go

--> 3.UPDATE 
CREATE PROCEDURE p_upd_Course
   @Crs_ID nvarchar(50) ,
	@Crs_name nvarchar(50)= null,
	@Duraion decimal(18,0)= null,
	@Dept_ID decimal(18,0) = null
AS
BEGIN
    -- Update statement for the Student table
    UPDATE Course
    SET
       Crs_name = COALESCE(@Crs_name,Crs_name),
        Duraion = COALESCE(@Duraion,Duraion),
       Dept_ID = COALESCE(@Dept_ID,Dept_ID)   
    WHERE
        Crs_ID = @Crs_ID;
END;
Go

--> 4.DELETE 
CREATE PROC P_DEL_Course
	@Crs_ID nvarchar(50)
AS
BEGIN
DELETE FROM Course
WHERE Crs_ID=@Crs_ID
END;
GO
--==============================================================
-- procedure "exam" 
--> 1.SELECT 
CREATE PROC P_call_exam
AS
BEGIN
SELECT * FROM Exam
END;
Go

-->2.INSERT
CREATE PROC P_addto_exam
	@exam_code nvarchar(50),
	@duration decimal(18,2),
	@crs_id nvarchar(50)
AS
BEGIN
INSERT INTO Exam (exam_code,duration,crs_id)
VALUES (@exam_code,@duration,@crs_id)
END;
Go

--> 3.UPDATE 
CREATE PROC P_upd_exam
	@exam_code nvarchar(50),
	@duration decimal(18,2)=NULL,
	@crs_id nvarchar(50)=NULL
AS
BEGIN
	UPDATE Exam
	SET
	duration= COALESCE(@duration,duration),
	crs_id = COALESCE (@crs_id,crs_id)
	WHERE
	exam_code=@exam_code
END;
Go

--4.DELETE
CREATE PROC P_del_exam
	@exam_code nvarchar(50)
AS
BEGIN 
DELETE FROM Exam
WHERE exam_code=@exam_code
END;

GO
--==============================================================
--Procedure "Students"
---> 1.SELECT
CREATE PROC P_CALL_STUDENT
AS 
BEGIN 
SELECT * FROM Student
END;
Go
--EXEC P_CALL_STUDENT

---> 2.INSERT
CREATE PROC P_addto_STUDENT
	@St_ID decimal (18,0),  
	@name nvarchar(255), 
	@Age decimal(18,0),
	@Email nvarchar(255), 
	@Country nvarchar(255),
	@City nvarchar(255),
	@Nat_ID bigint ,
	@Gender nvarchar(255),
	@B_ID decimal (18,0)
AS
BEGIN
INSERT INTO student (St_id,Name,Age,Email,[Country ],City,Nat_ID,Gender,B_ID)
VALUES (@St_id,@Name,@Age,@Email,@Country,@City,@Nat_ID,@Gender,@B_ID)
END;
Go

--> 3.UPDATE 
--ALTER TABLE Student
--ALTER COLUMN Nat_ID BIGINT;

CREATE PROCEDURE p_upd_student
    @St_ID decimal (18,0),  
	@name nvarchar(255)= NULL, 
	@Age decimal(18,0)=NULL,
	@Email nvarchar(255) = NULL, 
	@Country nvarchar(255)= NULL,
	@City nvarchar(255)= NULL,
	@Nat_ID bigint = NULL ,
	@Gender nvarchar(255) = NULL,
	@B_ID decimal (18,0) = NULL
AS
BEGIN
    -- Update statement for the Student table
    UPDATE Student
    SET
        name = COALESCE(@name, name),
        Age = COALESCE(@Age, Age),
        Email = COALESCE(@Email, Email),
        Country = COALESCE(@Country, Country),
        City = COALESCE(@City, City),
        Nat_ID = COALESCE(@Nat_ID, Nat_ID),
        Gender = COALESCE(@Gender, Gender),
		B_ID = COALESCE (@B_ID,b_id)
    WHERE
        St_ID = @St_ID;
END;
Go
--exec p_upd_student
--@St_ID=1000,
--@Age=23;

--> 4.DELETE 
CREATE PROC P_DEL_STUDENT
	@St_ID decimal(18,0)
AS
BEGIN
DELETE FROM Student
WHERE St_ID=@St_ID
END;

GO
--==============================================================
-- Procedure "Course Feedback"

-- 1. Select Procedure
CREATE PROCEDURE P_Get_CourseFeedback
AS
BEGIN
    SELECT * FROM Course_Feedback;
END;
GO

-- 2. Insert Procedure
CREATE PROCEDURE P_Ins_CourseFeedback 
    @FB_ID VARCHAR(10), 
    @Total_Rate DECIMAL(2,1), 
    @Lab_Rate DECIMAL(2,1), 
    @Content_Rate DECIMAL(2,1), 
    @St_ID INT, 
    @C_ID VARCHAR(5)
AS
BEGIN TRY
    INSERT INTO Course_Feedback (FB_ID, Total_Rate, Lab_Rate, Content_Rate, St_ID, C_ID)
    VALUES (@FB_ID, @Total_Rate, @Lab_Rate, @Content_Rate, @St_ID, @C_ID);
END TRY
BEGIN CATCH
    SELECT 'There is an error.';
END CATCH;
GO

-- 3. Update Procedure
CREATE PROCEDURE P_Upd_CourseFeedback 
    @FB_ID VARCHAR(5), 
    @Total_Rate DECIMAL(2,1), 
    @Lab_Rate DECIMAL(2,1), 
    @Content_Rate DECIMAL(2,1)
AS
BEGIN
    UPDATE Course_Feedback
    SET Total_Rate = @Total_Rate, 
        Lab_Rate = @Lab_Rate, 
        Content_Rate = @Content_Rate
    WHERE FB_ID = @FB_ID;
END;
GO

-- 4. Delete Procedure
CREATE PROCEDURE P_Del_CourseFeedback 
    @FB_ID VARCHAR(10)
AS
BEGIN
    DELETE FROM Course_Feedback
    WHERE FB_ID = @FB_ID;
END;
GO

--==============================================================
-- Procedure: "Branch"

-- 1. Select Procedure
CREATE PROCEDURE P_Get_Branches
AS
BEGIN
    SELECT * FROM Branch;
END;
GO

-- 2. Update Procedure
CREATE PROCEDURE P_Upd_Branch 
    @Branch_ID INT, 
    @Capacity INT
AS
BEGIN
    UPDATE Branch
    SET Capacity = @Capacity
    WHERE Branch_ID = @Branch_ID;
END;
GO

-- 3. Delete Procedure
CREATE PROCEDURE P_Del_Branch 
    @Branch_ID INT
AS
BEGIN
    DELETE FROM Branch
    WHERE Branch_ID = @Branch_ID;
END;
GO

-- 4. Insert Procedure
CREATE PROCEDURE P_Ins_Branch 
    @Branch_ID INT, 
    @Location VARCHAR(30), 
    @Name VARCHAR(30), 
    @Capacity INT
AS
BEGIN
    INSERT INTO Branch (Branch_ID, Location, Name, Capacity)
    VALUES (@Branch_ID, @Location, @Name, @Capacity);
END;
GO

--==============================================================

--Procedure: "Instructor"

-- 1. Select Procedure
CREATE PROCEDURE P_Get_Instructors
AS
BEGIN
    SELECT * FROM Instructor;
END;
GO

-- 2. Insert Procedure
CREATE PROCEDURE P_Ins_Instructor 
    @Instructor_ID DECIMAL(10,0), 
    @FirstName VARCHAR(30), 
    @LastName VARCHAR(30), 
    @Nationality VARCHAR(30), 
    @Experience DECIMAL(3,1), 
    @Gender VARCHAR(20), 
    @Email VARCHAR(50), 
    @Phone VARCHAR(20), 
    @Salary DECIMAL(10,0), 
    @Address VARCHAR(30), 
    @Branch_ID DECIMAL(2,0), 
    @Course_ID VARCHAR(10), 
    @Department_ID DECIMAL(4,0)
AS
BEGIN
    INSERT INTO Instructor (Instructor_ID, FirstName, LastName, Nationality, Experience, Gender, Email, Phone, Salary, Address, Branch_ID, Course_ID, Department_ID)
    VALUES (@Instructor_ID, @FirstName, @LastName, @Nationality, @Experience, @Gender, @Email, @Phone, @Salary, @Address, @Branch_ID, @Course_ID, @Department_ID);
END;
GO

-- 3. Update Procedure
CREATE PROCEDURE P_Upd_Instructor 
    @Instructor_ID INT, 
    @Experience INT, 
    @Salary INT, 
    @Branch_ID VARCHAR(30), 
    @Course_ID VARCHAR(5)
AS
BEGIN
    UPDATE Instructor
    SET Experience = @Experience, 
        Salary = @Salary, 
        Branch_ID = @Branch_ID, 
        Course_ID = @Course_ID
    WHERE Instructor_ID = @Instructor_ID;
END;
GO

-- 4. Delete Procedure
CREATE PROCEDURE P_Del_Instructor 
    @Instructor_ID INT
AS
BEGIN
    DELETE FROM Instructor
    WHERE Instructor_ID = @Instructor_ID;
END;
GO
--==============================================================

-- Procedure "Instructors Feedback"

-- 1. Select Procedure
CREATE PROCEDURE P_Get_InstructorsFeedback
AS
BEGIN
    SELECT * FROM Ins_Feed;
END;
GO

-- 2. Insert Procedure
CREATE PROCEDURE P_Ins_InstructorsFeedback 
    @Feedback_ID VARCHAR(10), 
    @Time_Rate DECIMAL(2,1), 
    @Question_Rate DECIMAL(2,1), 
    @Explanation_Rate DECIMAL(2,1), 
    @Total_Rate INT, 
    @Instructor_ID INT, 
    @Student_ID INT
AS
BEGIN TRY
    INSERT INTO Ins_Feed (Feedback_ID, Time_Rate, Question_Rate, Explanation_Rate, Total_Rate, Instructor_ID, Student_ID)
    VALUES (@Feedback_ID, @Time_Rate, @Question_Rate, @Explanation_Rate, @Total_Rate, @Instructor_ID, @Student_ID);
END TRY
BEGIN CATCH
    SELECT 'There is an error.';
END CATCH;
GO

-- 3. Update Procedure
CREATE PROCEDURE P_Upd_InstructorsFeedback 
    @Feedback_ID VARCHAR(5), 
    @Time_Rate DECIMAL(2,1), 
    @Question_Rate DECIMAL(2,1), 
    @Explanation_Rate DECIMAL(2,1), 
    @Total_Rate DECIMAL(2,1)
AS
BEGIN
    UPDATE Ins_Feed
    SET Total_Rate = @Total_Rate, 
        Question_Rate = @Question_Rate, 
        Explanation_Rate = @Explanation_Rate
    WHERE Feedback_ID = @Feedback_ID;
END;
GO

-- 4. Delete Procedure
CREATE PROCEDURE P_Del_InstructorsFeedback 
    @Feedback_ID INT
AS
BEGIN
    DELETE FROM Ins_Feed
    WHERE Feedback_ID = @Feedback_ID;
END;
GO

--==============================================================

-- Procedure "Department"

-- 1. Select Procedure
CREATE PROCEDURE P_Get_Department
AS
BEGIN
    SELECT * FROM Department;
END;
GO

-- 2. Insert Procedure
CREATE PROCEDURE P_Ins_Department 
    @Dept_ID INT, 
    @Dept_Name VARCHAR(10), 
    @Dept_Mgr INT
AS
BEGIN
    INSERT INTO Department (Dept_ID, Dept_Name, Dept_Mgr)
    VALUES (@Dept_ID, @Dept_Name, @Dept_Mgr);
END;
GO

-- 3. Delete Procedure
CREATE PROCEDURE P_Del_Department 
    @Dept_ID INT
AS
BEGIN
    DELETE FROM Department
    WHERE Dept_ID = @Dept_ID;
END;
GO

--==============================================================