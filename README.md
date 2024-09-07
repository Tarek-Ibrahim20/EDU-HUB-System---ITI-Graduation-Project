# EDU-HUB-System ITI-Graduation-Project

## Description:
In today's digital era, online examination systems have become a crucial component of modern education. With the rise of e-learning platforms and the increasing demand for flexibility in education, institutions are rapidly shifting from traditional paper-based examinations to automated systems. These systems offer numerous benefits, including real-time assessment, reduced administrative workload, enhanced accessibility, and secure exam environments.
This project, titled "Examination System for EDU HUB Platform" was developed as part of the graduation project at the Information Technology Institute (ITI). The primary objective of this project was to create an automated examination system to serve the EDU HUB platform, providing an efficient and scalable solution for managing online exams and evaluations.


## Project Life Cycle
![](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/3baa7784a5a5f37ff381a93c85a322f958312fe0/Project%20life%20Cycle.png)

## Key Features:

### Business Requirements Analysis: 
We initiated the project by meticulously understanding the business requirements. This step laid the foundation for all subsequent development phases.
[Requirements](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/601e6a115a1fbd43d2e164ec42ab485444b9cfaf/Project%20Requirements.pdf)<br/>
### Entity-Relationship Diagram (ERD): 
We crafted an ER diagram to represent entities, attributes, relationships, and constraints. This step ensured a clear understanding of the data structure.
[ERD](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/f922530a3038d847ff3424b10e7f7dc7430a4705/Project_ITI_ERD.drawio%20(1).png) <br/>

### Mapping: 
This involved defining tables, columns, data types, and constraints in an SQL environment. 
[Mapping](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/d0f40fb8012528f3814bed3f8cb1a44ed5bde31f/Mapping.drawio%20(3).png) <br/>

### Physical Database Implementation: 
Following the Mapping finalization, we translated it into a physical database schema on a SQL server by T-SQL. This involved creating tables, defining columns, data types, constraints, and ensuring data normalization and integrity.
[Database Creation](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/869d21744cf4fa372dc49922a90a9064354803c9/tables.sql) <br/>

### Stored Procedures Development: 
We developed stored procedures to automate core system operations such as exam creation, answer submission, exam correction, and report generation. 
[Procs](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/tree/538c94b00cb6559531987edfb460194e8cc2bd99/Exam%20Procedure) <br/>

### CRUD Operations: 
The system supports essential CRUD operations for managing student, course, instructor, and exam-related data. This functionality ensures efficient data management and manipulation.
[Procs](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/blob/538c94b00cb6559531987edfb460194e8cc2bd99/ALL%20STORED%20PROSEDURE%20QUERY.sql) <br/>

### Data Collection:
After the core system was in place, data collection became the focus. This involved gathering data from multiple sources to populate the system, including student information, course details, and exam content. The process ensured that the system was populated with real-world data, making it functional and ready for testing. Data collection was vital for:
•	Testing the system’s functionality and performance under real-world conditions.
•	Validating the stored procedures and ensuring that the system could handle the expected data load.
•	Preparing the system for generating meaningful reports and dashboards.
[Data Sources](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/tree/00639df60db3af5cfe03233b0ca95d08c2679bc5/Datasets)

## Reporting and Dashboarding:

### SSRS Reports:
we used SSRS to present the courses for each department, instructors of courses, Students for each branch, and exam generartion and answers.
[SSRS](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/tree/cf3ccd2dfe611a4f21f07eb0af69cf30525bd68b/SSRS%20Reports) <br/>

### Power BI Dashboards:
[Power BI Dashbords](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/tree/c4cb2a22fb07659a0661b1a6817d82ef3940f97b/Power%20BI%20Dashboards) <br/>

### Project Performance Tracking:
[Project Performnace Tracking](https://github.com/Tarek-Ibrahim20/EDU-HUB-System---ITI-Graduation-Project/tree/63cc56ead6a8eed88fccc62f618346f93c687d25/Project%20Performance%20Tracker) <br/>



