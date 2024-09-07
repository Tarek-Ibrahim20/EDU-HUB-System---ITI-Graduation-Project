use Edu_Hub

-- Student Table	
Create Table Student (
	St_ID int primary key identity(1,1), --Auto-incrementing primary key
	st_name nvarchar(100) not null,
	Age int,
	Email nvarchar(360), --64 characters for local part + @ + 255 for domain name.
	Country nvarchar(50),
	City nvarchar(50),
	Nat_ID int Not null,
	Gender nvarchar(10),
	Branch_ID int, --Foreign key
	constraint UQ_Student_Nat_ID unique (Nat_ID),-- Unique constraint on Nat_ID
	Constraint FK_Student_Branch foreign key (Branch_ID) References Branch(Branch_ID)
	);

-- Department Table
create table Department
(
dept_id int primary key,
dept_name varchar(20) not null,
dept_mgr int not null
Constraint FK_Department_manager foreign key (dept_mgr) references student(st_id)
)

-- course Table 
Create table Course (
	Crs_ID int primary key identity,
	Crs_name nvarchar(50) not null,
	Duraion time,
	Dept_ID int,  --Foreign key
	constraint FK_Course_department foreign key (Dept_ID) references Department(Dept_ID)
	);

-- St_Course Table 
Create Table St_Course (
	St_ID int,
	Crs_ID int,
	Constraint FK_Student foreign key (St_ID) References Student(St_ID),
	Constraint FK_Course  foreign key (Crs_ID) References Course(Crs_ID),
	Constraint PK_st_crs  Primary key (St_ID,Crs_ID) --Composite primary key
	);

--Freelancing_Job Table 
Create Table Freelancing_job(
		job_ID int primary key,
		Job_name nvarchar(100),
		Job_type nvarchar(100),
		Job_Budget int,
		Website nvarchar(100),
		Client_name nvarchar(100) not null,
		client_phone int,
		St_ID int,  --Foreign key
		Constraint FK_Student_freelancing foreign key (St_ID) References Student(St_ID)
		);

--Certificates Table 
Create Table Certificates (
	Certf_ID int primary key,
	Code int,
	type nvarchar(50),
	Title nvarchar(100),
	Startdate date,
	expiration date,
	Duration time,
	Platform nvarchar(100),
	);

	-- St_certificate Table 
Create Table St_certf (
	St_ID int not null,
	crt_ID int not null,
	Constraint FK_Student_cert foreign key (St_ID) References Student(St_ID),
	Constraint FK_Certificate_std foreign key (crt_ID) References certificates (certf_ID),
	Constraint PK_student_certificate Primary key (St_ID,crt_ID) --Composite primary key
	);


	-- Subscricption Table 
create table Subscription(
	St_ID int,
	scrip_ID int,
	scrip_Type nvarchar(100),
	cost int,
	Star_tdate datetime,
	End_date datetime,
	Constraint FK_Student_subscription foreign key (St_ID) References Student(St_ID),
	Constraint PK_Subscription Primary key (St_ID,scrip_ID) --Composite primary key
	); 

-- St_Social Table
Create Table St_Social (
	St_ID int,
	URL nvarchar(100),
	Platform nvarchar(100),
	Constraint FK_Student_stdsocial foreign key (St_ID) References Student(St_ID),
	Primary key (St_ID,platform) --Composite primary key
	);

-- Exam Table
Create table Exam
(
exam_code int primary key,
exam_date date null,
duration time not null ,
crs_id int not null,
Constraint FK_Exam_Course Foreign key (crs_id) references course(crs_id)
)

create table Question
(
Quest_num int primary key,
Question nvarchar(300) not null ,
type varchar(20) check( type in ('MCQ' ,'TF') )
)

Create table Choice
(
Ch_id int primary key,
choice nvarchar(100) not null ,
right_answer nvarchar(20) not null , --note (possible answers)
quest_num int not null ,
Constraint FK_Choice_question Foreign key (quest_num) references Question(quest_num)
)

create table std_exam_quest 
(
exam_code int not null,
std_id int not null,
Quest_num int not null,
date datetime default getdate() ,
grade decimal(5,2) not null ,
std_answer nvarchar(20)  --> note
constraint PK_std_exam_quest primary key(exam_code , std_id , quest_num),
Constraint FK_Exam_quest_std Foreign key (exam_code) references Exam(Exam_code),
Constraint FK_Qestion_Exam_std Foreign key (quest_num) references question(quest_num),
Constraint FK_std_exam_quest Foreign key (std_id) references student(st_id)
)

create table crs_feedback
(
feed_id int primary key ,
lab_rate decimal(2,1) check ( lab_rate <= 5),
content_rate decimal(2,1) check ( content_rate <= 5),
total_rate decimal(2,1) check ( total_rate <= 5),
std_id int null,
crs_id int not null,
Constraint FK_std_feedback Foreign key (std_id) references student(st_id),
Constraint FK_crs_feedback Foreign key (crs_id) references course(crs_id)
)

create table Branch
(
branch_id int primary key , 
location nvarchar(50) not null ,
name nvarchar(50) not null ,
Capacity int null
)

create table instructor
(
ins_id int primary key,
ins_name nvarchar(100) not null ,
nat_id int ,
year_of_exper decimal(3,1) ,
gender varchar check( gender in ('male' , 'female')) ,
Email varchar(50)  ,
Phone varchar(20) ,
Salary smallmoney ,
address nvarchar(100) ,
Branch_id int ,
crs_id int ,
dept_id int ,
Constraint FK_ins_branch Foreign key (branch_id) references branch(branch_id),
Constraint FK_ins_crs Foreign key (crs_id) references course(crs_id),
Constraint FK_ins_dept Foreign key (dept_id) references department(dept_id)
)

create table ins_feed
(
feed_id int primary key ,
time_management_rate decimal(2,1) check ( time_management_rate <= 5),
Quest_Respose_rate decimal(2,1) check ( Quest_Respose_rate <= 5),
Explanation_rate decimal(2,1) check ( Explanation_rate <= 5),
total_rate decimal(2,1) check ( total_rate <= 5),
ins_id int not null,
std_id int
Constraint FK_ins_feed Foreign key (ins_id) references instructor(ins_id),
Constraint FK_std_ins_feed Foreign key (std_id) references student(st_id)
)


-------------------
--==================
USE Edu_Hub;

-- Student Table
CREATE TABLE Student (
    St_ID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing primary key
    st_name NVARCHAR(100) NOT NULL,
    Age INT,
    Email NVARCHAR(360), -- 64 characters for local part + @ + 255 for domain name
    Country NVARCHAR(50),
    City NVARCHAR(50),
    Nat_ID INT NOT NULL,
    Gender NVARCHAR(10),
    Branch_ID INT, -- Foreign key
    CONSTRAINT UQ_Student_Nat_ID UNIQUE (Nat_ID), -- Unique constraint on Nat_ID
    CONSTRAINT FK_Student_Branch FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

-- Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL,
    dept_mgr INT NOT NULL,
    CONSTRAINT FK_Department_Manager FOREIGN KEY (dept_mgr) REFERENCES Student(St_ID)
);

-- Course Table
CREATE TABLE Course (
    Crs_ID INT PRIMARY KEY IDENTITY,
    Crs_name NVARCHAR(50) NOT NULL,
    Duration TIME,
    Dept_ID INT, -- Foreign key
    CONSTRAINT FK_Course_Department FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- St_Course Table
CREATE TABLE St_Course (
    St_ID INT,
    Crs_ID INT,
    CONSTRAINT FK_Student FOREIGN KEY (St_ID) REFERENCES Student(St_ID),
    CONSTRAINT FK_Course FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID),
    CONSTRAINT PK_St_Crs PRIMARY KEY (St_ID, Crs_ID) -- Composite primary key
);

-- Freelancing_Job Table
CREATE TABLE Freelancing_Job (
    Job_ID INT PRIMARY KEY,
    Job_name NVARCHAR(100),
    Job_type NVARCHAR(100),
    Job_Budget INT,
    Website NVARCHAR(100),
    Client_name NVARCHAR(100) NOT NULL,
    Client_phone INT,
    St_ID INT, -- Foreign key
    CONSTRAINT FK_Student_Freelancing FOREIGN KEY (St_ID) REFERENCES Student(St_ID)
);

-- Certificates Table
CREATE TABLE Certificates (
    Certf_ID INT PRIMARY KEY,
    Code INT,
    Type NVARCHAR(50),
    Title NVARCHAR(100),
    StartDate DATE,
    Expiration DATE,
    Duration TIME,
    Platform NVARCHAR(100)
);

-- St_Certf Table
CREATE TABLE St_Certf (
    St_ID INT NOT NULL,
    Crt_ID INT NOT NULL,
    CONSTRAINT FK_Student_Cert FOREIGN KEY (St_ID) REFERENCES Student(St_ID),
    CONSTRAINT FK_Certificate_Std FOREIGN KEY (Crt_ID) REFERENCES Certificates(Certf_ID),
    CONSTRAINT PK_Student_Certificate PRIMARY KEY (St_ID, Crt_ID) -- Composite primary key
);

-- Subscription Table
CREATE TABLE Subscription (
    St_ID INT,
    Scrip_ID INT,
    Scrip_Type NVARCHAR(100),
    Cost INT,
    Start_Date DATETIME,
    End_Date DATETIME,
    CONSTRAINT FK_Student_Subscription FOREIGN KEY (St_ID) REFERENCES Student(St_ID),
    CONSTRAINT PK_Subscription PRIMARY KEY (St_ID, Scrip_ID) -- Composite primary key
);

-- St_Social Table
CREATE TABLE St_Social (
    St_ID INT,
    URL NVARCHAR(100),
    Platform NVARCHAR(100),
    CONSTRAINT FK_Student_StdSocial FOREIGN KEY (St_ID) REFERENCES Student(St_ID),
    PRIMARY KEY (St_ID, Platform) -- Composite primary key
);

-- Exam Table
CREATE TABLE Exam (
    Exam_Code INT PRIMARY KEY,
    Exam_Date DATE NULL,
    Duration TIME NOT NULL,
    Crs_ID INT NOT NULL,
    CONSTRAINT FK_Exam_Course FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
);

-- Question Table
CREATE TABLE Question (
    Quest_Num INT PRIMARY KEY,
    Question NVARCHAR(300) NOT NULL,
    Type VARCHAR(20) CHECK (Type IN ('MCQ', 'TF'))
);

-- Choice Table
CREATE TABLE Choice (
    Ch_ID INT PRIMARY KEY,
    Choice NVARCHAR(100) NOT NULL,
    Right_Answer NVARCHAR(20) NOT NULL, -- Note (possible answers)
    Quest_Num INT NOT NULL,
    CONSTRAINT FK_Choice_Question FOREIGN KEY (Quest_Num) REFERENCES Question(Quest_Num)
);

-- Std_Exam_Quest Table
CREATE TABLE Std_Exam_Quest (
    Exam_Code INT NOT NULL,
    Std_ID INT NOT NULL,
    Quest_Num INT NOT NULL,
    Date DATETIME DEFAULT GETDATE(),
    Grade DECIMAL(5, 2) NOT NULL,
    Std_Answer NVARCHAR(20), -- Note
    CONSTRAINT PK_Std_Exam_Quest PRIMARY KEY (Exam_Code, Std_ID, Quest_Num),
    CONSTRAINT FK_Exam_Quest_Std FOREIGN KEY (Exam_Code) REFERENCES Exam(Exam_Code),
    CONSTRAINT FK_Question_Exam_Std FOREIGN KEY (Quest_Num) REFERENCES Question(Quest_Num),
    CONSTRAINT FK_Std_Exam_Quest FOREIGN KEY (Std_ID) REFERENCES Student(St_ID)
);

-- Crs_Feedback Table
CREATE TABLE Crs_Feedback (
    Feed_ID INT PRIMARY KEY,
    Lab_Rate DECIMAL(2, 1) CHECK (Lab_Rate <= 5),
    Content_Rate DECIMAL(2, 1) CHECK (Content_Rate <= 5),
    Total_Rate DECIMAL(2, 1) CHECK (Total_Rate <= 5),
    Std_ID INT NULL,
    Crs_ID INT NOT NULL,
    CONSTRAINT FK_Std_Feedback FOREIGN KEY (Std_ID) REFERENCES Student(St_ID),
    CONSTRAINT FK_Crs_Feedback FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
);

-- Branch Table
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Location NVARCHAR(50) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Capacity INT NULL
);

-- Instructor Table
CREATE TABLE Instructor (
    Ins_ID INT PRIMARY KEY,
    Ins_Name NVARCHAR(100) NOT NULL,
    Nat_ID INT,
    Year_of_Exper DECIMAL(3, 1),
    Gender VARCHAR CHECK (Gender IN ('male', 'female')),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Salary SMALLMONEY,
    Address NVARCHAR(100),
    Branch_ID INT,
    Crs_ID INT,
    Dept_ID INT,
    CONSTRAINT FK_Ins_Branch FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
    CONSTRAINT FK_Ins_Crs FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID),
    CONSTRAINT FK_Ins_Dept FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Ins_Feed Table
CREATE TABLE Ins_Feed (
    Feed_ID INT PRIMARY KEY,
    Time_Management_Rate DECIMAL(2, 1) CHECK (Time_Management_Rate <= 5),
    Quest_Response_Rate DECIMAL(2, 1) CHECK (Quest_Response_Rate <= 5),
    Explanation_Rate DECIMAL(2, 1) CHECK (Explanation_Rate <= 5),
    Total_Rate DECIMAL(2, 1) CHECK (Total_Rate <= 5),
    Ins_ID INT NOT NULL,
    Std_ID INT,
    CONSTRAINT FK_Ins_Feed FOREIGN KEY (Ins_ID) REFERENCES Instructor(Ins_ID),
    CONSTRAINT FK_Std_Ins_Feed FOREIGN KEY (Std_ID) REFERENCES Student(St_ID)
);
