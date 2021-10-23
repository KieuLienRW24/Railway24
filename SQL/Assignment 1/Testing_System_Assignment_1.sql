CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department(
	department_id		INT,
	department_name		VARCHAR(20)
);
CREATE TABLE Position (
position_id		INT,
poaition_name	VARCHAR(20)
);
CREATE TABLE Account(
account_id		INT,
email			VARCHAR(50),
username		VARCHAR(50),
fullname		VARCHAR(50),
department_id	INT,
position_id		INT,
create_date		DATE
);
CREATE TABLE GroupAccount(
group_id		INT,
account_id		INT,
join_date		DATE
);
CREATE TABLE Group_use(
group_id 		INT,
group_name 		VARCHAR(20),
creator_id 		INT,
creator_date 	DATE
);
CREATE TABLE TypeQuestion(
type_id			INT,
type_name		VARCHAR(20)
);
CREATE TABLE CategoryQuestion(
category_id		INT,
category_name	VARCHAR(20)
);
CREATE TABLE Question(
question_id		INT,
content			VARCHAR(50),
category_ID		INT,
type_id			INT,
create_date		DATE
);
CREATE TABLE Answer(
answer_id		INT,
content			VARCHAR(50),
question_id		INT,
iscorrect		VARCHAR(10)
);
CREATE TABLE Exam(
exam_id			INT,
code			VARCHAR(20),
title			VARCHAR(50),
category_id		INT,
duration		DATE,
creator_id		INT,
create_date		DATE
);
CREATE TABLE Examquestion(
exam_id			INT,
question_id		INT
);
