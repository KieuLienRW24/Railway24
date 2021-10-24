DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS  Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	department_name		VARCHAR(50) NOT NULL
);

INSERT INTO Department(department_id,department_name)
VALUE					(1		,'Phòng Hàng chính'),
					(2		,'Phòng Nhân sự'),
					(3		,'Phòng Kế toán'),
					(4		,'Phòng Marketting'),
					(5		,'Phòng Thiết kế');
SELECT *
FROM Department;

DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
position_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
position_name	ENUM('Dev','Test','Serum Master','PM')
);
INSERT INTO Position (position_id	, position_name)
VALUE						(1		,'Dev'),
						(2		,'Test'),
						(3		,'Serum Master'),
						(4		,'PM');
SELECT *
FROM Position ;

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
account_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
email			VARCHAR(50),
username		VARCHAR(50) NOT NULL,
fullname		VARCHAR(50) NOT NULL,
department_id	TINYINT UNSIGNED NOT NULL,
position_id		TINYINT UNSIGNED NOT NULL,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY (department_id) REFERENCES Department(department_id),
FOREIGN KEY (position_id) REFERENCES Position (position_id)
);

INSERT INTO Account(account_id	, email					, username		, fullname		, department_id	, position_id	)
VALUE						(1	,'nguyenvana@gmail.com'	, 'anguyen'		, 'nguyen van a', 1				, 1				), 
						(2	,'nguyenvanb@gmail.com'	, 'bnguyen'		, 'nguyen van b', 2				, 2				),
						(3	,'nguyenvanc@gmail.com'	, 'cnguyen'		, 'nguyen van c', 3				, 3				),
                           			(4	,'nguyenvand@gmail.com'	, 'dnguyen'		, 'nguyen van d', 4				, 4				);

SELECT *
FROM Account;

DROP TABLE IF EXISTS Group_user;
CREATE TABLE Group_user(
group_id 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
group_name 		VARCHAR(50) NOT NULL,
creator_id 		TINYINT UNSIGNED,
creator_date 	DATETIME DEFAULT NOW()
);
INSERT INTO Group_user	(group_id	,group_name	,creator_id	)
VALUE					(1			,'G-1'		,1			),
					(2			,'G-2'		,2			),
					(3			,'G-3'		,3			),
					(4			,'G-4'		,4			),
					(5			,'G-5'		,5			);
SELECT *
FROM Group_user;

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
group_id		TINYINT UNSIGNED,
account_id		TINYINT UNSIGNED,
join_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(group_id) REFERENCES Group_user (group_id),
FOREIGN KEY(account_id) REFERENCES Account (account_id)
);
INSERT INTO GroupAccount	(group_id	,account_id	)
VALUE						(1			,1			),
						(2			,2			),
						(3			,3			),
						(4			,4			);

SELECT *
FROM GroupAccount;     
               
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
type_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
type_name		ENUM('Essay', 'Multiple-Choice')
);
INSERT INTO TypeQuestion(type_id,type_name)
VALUE					(1		,'Essay'),
					(2		,'Multiple-Choice');
SELECT *
FROM TypeQuestion; 

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
category_name	VARCHAR(50) NOT NULL
);
INSERT INTO CategoryQuestion(category_id,category_name)
VALUE						(1			,'Java'),
						(2			,'.NET'),
                            			(3			,'SQL'),
                            			(4			,'Postman'),
                            			(5			,'Ruby');
SELECT *
FROM CategoryQuestion; 

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
question_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content			VARCHAR(50) NOT NULL,
category_id		TINYINT UNSIGNED,
type_id			TINYINT UNSIGNED,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(category_id) REFERENCES CategoryQuestion (category_id),
FOREIGN KEY(type_id) REFERENCES TypeQuestion (type_id)
);

INSERT INTO Question(question_id	,content	,category_id,type_id)
VALUE			(1		,'1+1=2?'	,1			,1		),
			(2		,'1+2=0?'	,2			,2		);
SELECT *
FROM Question;               
                    
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
answer_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content			VARCHAR(50) NOT NULL,
question_id		TINYINT UNSIGNED,
iscorrect		ENUM('ĐÚNG', 'SAI'),
FOREIGN KEY(question_id) REFERENCES Question (question_id)
);
INSERT INTO Answer	(answer_id	,content	,question_id	,iscorrect)
VALUE				(1	,'1+1=2?'	,1				,'ĐÚNG'),
				(2	,'1+2=0?'	,2				,'SAI');

SELECT *
FROM Answer;               
                  
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
code			VARCHAR(50) NOT NULL,
title			VARCHAR(50) NOT NULL,
category_id		TINYINT UNSIGNED NOT NULL,
duration		TINYINT UNSIGNED CHECK (duration >= 45 AND duration <= 120),
creator_id		TINYINT UNSIGNED,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(category_id) REFERENCES CategoryQuestion (category_id)
);

INSERT INTO Exam(exam_id,code	,title	,category_id, duration	,creator_id	)
VALUE			(1		,'A11'	,'Toán'	,1			,120		,1			),
			(2		,'A12'	,'Lý'	,2			,90	 	,2			),
			(3		,'A13'	,'Hóa'	,3			,90		,3			),
			(4		,'A14'	,'Sinh'	,4			,60		,4			),
			(5		,'A15'	,'Sử'	,5			,45		,5			);
SELECT *
FROM Exam;

DROP TABLE IF EXISTS Examquestion;
CREATE TABLE Examquestion(
exam_id			TINYINT UNSIGNED,
question_id		TINYINT UNSIGNED,
 PRIMARY KEY(exam_id,question_id)
);
INSERT INTO Examquestion(exam_id,question_id)
VALUE					(1		,1			),
					(2		,2			);
				
SELECT *
FROM Examquestion;
