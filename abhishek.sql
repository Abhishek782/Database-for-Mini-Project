SHOW DATABASES;
CREATE DATABASE abhishek_61;
USE abhishek_61;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS  Projects(
	Project_ID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(45) NOT NULL UNIQUE,
    year_made INT ,
    Semester INT,
    Member_Count INT NOT NULL,
    PRIMARY KEY(Project_ID)
);

SHOW tables;

CREATE TABLE IF NOT EXISTS  Team_Members(
	PRN varchar(14) NOT NULL UNIQUE ,
    Name VARCHAR(255) NOT NULL UNIQUE,
    Group_NO INT NOT NULL,
    Batch INT,
    Gender VARCHAR(15) ,
    PRIMARY KEY(PRN)
);

CREATE TABLE IF NOT EXISTS INFO (
	Project_name VARCHAR(255) NOT NULL,
    Domain VARCHAR(45) NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY(Project_name)
);

CREATE TABLE IF NOT EXISTS Grades (
	PRN VARCHAR(14) NOT NULL UNIQUE,
    First_name VARCHAR(45) NOT NULL,
    Attendance INT,
    Marks INT,
    Remarks VARCHAR(255),
    PRIMARY KEY(PRN,First_name),
    foreign key (PRN) references Team_Members(PRN)
);

CREATE TABLE IF NOT EXISTS Projects_has_Team_members (
   Project_ID INT  UNIQUE NOT NULL,
   PRN VARCHAR (14) UNIQUE NOT NULL,
   PRIMARY KEY (Project_ID, PRN)
   );
   

CREATE TABLE IF NOT EXISTS Team_members_has_Grades (
   PRN VARCHAR(14) NOT NULL,
   First_name VARCHAR(45)  NOT NULL,
   PRIMARY KEY (PRN, First_name)
);

CREATE TABLE IF NOT EXISTS Projects_has_Info(
    Project_ID INT NOT NULL,
    Project_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Project_ID, Project_name)
);

CREATE Table IF NOT EXISTS Guide(
	GID INT NOT NULL,
    Guide_name VARCHAR(255) NOT NULL,
    Group_NO INT NOT NULL,
    PRIMARY KEY (GID, Guide_name)
    
);  


SHOW TABLES;
SELECT * FROM grades;
SELECT * FROM projects;
SELECT * FROM info;
SELECT * FROM projects_has_info;  

INSERT INTO Team_Members(PRN,Name,Group_NO,Batch,Gender) VALUES
					('2020BTEIT00061', 'Abhishek Deokar',15,4,'Male'),
                    ('2020BTEIT00021', 'Adwait Samak', 15, 4 , 'Male'),
                    ('2020BTEIT00015', 'Mayuresh Shedmekhe', 15, 4 , 'Male'),
					('2020BTEIT00060', 'Sarthak Deshmukh', 20, 5 , 'Male'),
					('2020BTEIT00038', 'Mohit Khairnar', 20, 5 , 'Male'),
					('2020BTEIT00018', 'Ayush Wadalkar', 20, 5 , 'Male'),
					('21600008', 'Anand Kadale', 20, 5 , 'Male');
SELECT * FROM Team_Members;

INSERT INTO Projects(Project_ID ,Title ,year_made ,Semester ,Member_Count) VALUES
					(1, 'Personal Manager',2021,4,7),
                    (2, 'Alzheimers detection using 2D imaging', 2022, 5 , 3),
                    (3, 'Alzheimers detection using 3D imaging', 2022, 5 , 4),
					(4, 'Medical Store Database' ,2023 ,6,3),
					(5, 'Restaurant Database' ,2023 ,6,4);
                    
SELECT * FROM Projects;

INSERT INTO INFO(Project_Name, Domain, Description) VALUES
				('Personal Manager','Android Development','Project made in Flutter and Firebase'),
                ('Alzheimers detection using 2D imaging','Deep Learning','Project made using concepts of CNN'),
                ('Alzheimers detection using 3D imaging','Deep Learning','Project made using concepts of CNN and taken help of ADNI Dataset'),
                ('Medical Store Database','Database/Backend','Project made using MySQL'),
                ('Restaurant Database','Database/Backend','Project made using NodeJS');
                
SELECT * FROM INFO;


-- Grades
-- 		PRN VARCHAR(14) NOT NULL UNIQUE,
-- 		First_name VARCHAR(45) NOT NULL,
-- 		Attendance INT,
-- 		Marks INT,
-- 		Remarks VARCHAR(255), 

INSERT INTO Grades(PRN ,First_name ,Attendance ,Marks ,Remarks) VALUES 
				   ('2020BTEIT00061','Abhishek',30,20,'Need to work with more efforts'),
				   ('2020BTEIT00021','Adwait',95,90,'Shown good practical knowledge'),
				   ('2020BTEIT00015','Mayuresh',96,95,'Good Leadership qualities'),
				   ('2020BTEIT00060','Sarthak',98,940,'Is obedient'),
				   ('2020BTEIT00038','Mohit',92,97,'Hard working'),
				   ('2020BTEIT00018','Ayush',93,98,'Great Creativity'),
                   ('21600008','Anand',97,91,'Very calm');
                   
-- Projects_has_Team_members 
--    Project_ID INT  UNIQUE NOT NULL,
--    PRN VARCHAR (14) UNIQUE NOT NULL,

INSERT INTO Projects_has_Team_members(Project_ID, PRN) VALUES
				  (1,'2020BTEIT00061'),
                  (2,'2020BTEIT00015'),
                  (3,'2020BTEIT00021'),
                  (4,'2020BTEIT00038'),
                  (5,'2020BTEIT00060'),
                  (6,'2020BTEIT00018'),
                  (7,'21600008');
                  
-- Team_members_has_Grades 
--    PRN VARCHAR(14) NOT NULL,
--    First_name VARCHAR(45)  NOT NULL,
--    PRIMARY KEY (PRN, First_name)   

INSERT INTO Team_members_has_Grades(PRN,First_name) VALUES
				  ('2020BTEIT00061','Abhishek'),
                  ('2020BTEIT00015','Mayuresh'),
                  ('2020BTEIT00021','Adwait'),
                  ('2020BTEIT00038','Mohit'),
                  ('2020BTEIT00060','Sarthak'),
                  ('2020BTEIT00018','Ayush'),
                  ('21600008','Anand');    
                  
                  
-- Guide(
-- 	GID INT NOT NULL,
--     Guide_name VARCHAR(255) NOT NULL,
--     Group_NO INT NOT NULL,
--     foreign key (Group_NO) references Team_Members(Group_NO)
-- );

ALTER TABLE Guide DROP PRIMARY KEY;
ALTER TABLE Guide ADD PRIMARY KEY(GID,Group_NO);
show tables;
INSERT INTO Guide(GID,Guide_name,Group_NO) VALUES 
					(7,'Manish Narnaware',15),
                    (7,'Manish Narnaware',20);
                    