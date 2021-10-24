DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS  Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	department_name		VARCHAR(50) NOT NULL
);

INSERT INTO Department(department_id	,department_name)
VALUE		(1			,'Phòng Hàng chính'),
		(2			,'Phòng Nhân sự'),
		(3			,'Phòng Kế toán'),
		(4			,'Phòng Marketting'),
		(5			,'Phòng Thiết kế'),
		(6			,'Phòng Sale'),
                (7			,'Phòng Xuất nhập khẩu'),
                (8			,'Phòng Kế hoạch'),
                (9			,'Phòng Dự án đầu tư'),
                (10			,'Phòng Giao nhận');
SELECT *
FROM Department;

DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
position_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
position_name	ENUM('Dev','Test','Serum Master','PM')
);
INSERT INTO Position (position_id	, position_name)
VALUE			(1		,'Dev'),
			(2		,'Test'),
			(3		,'Serum Master'),
			(4		,'PM'),
                        (5		,'Serum Master'),
                        (6		,'Test'),
                        (7		,'Test'),
                        (8		,'Dev'),
                        (9		,'PM'),
			(10		,'Serum Master');
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

INSERT INTO Account(account_id	, email						, username		, fullname		, department_id	, position_id	)
VALUE			(1	,'nguyenvana@gmail.com'		, 'anguyen'	, 'nguyen van a'	, 1				, 1				), 
			(2	,'nguyenvanb@gmail.com'		, 'bnguyen'	'nguyen van b'		, 2				, 2				),
			(3	,'nguyenvanhuynh@gmail.com'	, 'quynhnguyen'	, 'nguyen van quynh'	, 3				, 3				),
                        (4	,'nguyenvandao@gmail.com'	, 'daunguoen'	, 'nguyen van dao'	, 4				, 4				),
			(5	,'nguyenvane@gmail.com'		, 'enguyen'	, 'nguyen van e'	, 5				, 5				),
			(6	,'nguyenvanf@gmail.com'		, 'fnguyen'	, 'nguyen van f'	, 6				, 6				),
                        (7	,'nguyenvang@gmail.com'		, 'gnguyen'	, 'nguyen van g'	, 7				, 7				),
                        (8	,'nguyenvanh@gmail.com'		, 'hnguyen'	, 'nguyen van h'	, 8				, 8				),
                        (9	,'nguyenvanvo@gmail.com'	, 'vonguyen'	, 'nguyen van vo'	, 9				, 9				),
                        (10	,'nguyenvanhuynh@gmail.com'	, 'huynhnguyen'	, 'nguyen van huynh'	, 10				, 10				);
SELECT *		
FROM Account;

DROP TABLE IF EXISTS Group_user;
CREATE TABLE Group_user(
group_id 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
group_name 		VARCHAR(50) NOT NULL,
creator_id 		TINYINT UNSIGNED,
creator_date 	DATETIME DEFAULT NOW()
);
INSERT INTO Group_user	(group_id	,group_name	,creator_id	, creator_date)
VALUE			(1		,'G-1'		,1			,'2019/12/10'),
			(2		,'G-2'		,2			,'2019/12/11'),
			(3		,'G-3'		,3			,'2019/12/13'),
			(4		,'G-4'		,4			,'2019/12/14'),
			(5		,'G-5'		,5			,'2019/12/15'),
                        (6		,'G-6'		,6			,'2019/12/16'),
                       	(7		,'G-7'		,7			,'2019/12/17'),
                        (8		,'G-8'		,8			,'2019/12/18'),
                        (9		,'G-9'		,9			,'2019/12/18'),
                        (10		,'G-10'		,10			,'2019/12/20');
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
VALUE				(1		,1		),
				(2		,2		),
				(3		,3		),
				(4		,4		),
                           	(5		,5		),
                            	(6		,6		),
                            	(7		,7		),
                            	(8		,8		),
                            	(9		,9		),
                            	(10		,10		);
                            

SELECT *
FROM GroupAccount;     
               
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
type_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
type_name		ENUM('Essay', 'Multiple-Choice')
);
INSERT INTO TypeQuestion(type_id	,type_name		)
VALUE			(1		,'Essay'		),
			(2		,'Multiple-Choice'	),
                        (3		,'Multiple-Choice'	),
                        (4		,'Essay'		),
                        (5		,'Multiple-Choice'	),
                        (6		,'Essay'		),
                        (7		,'Essay'		),
                        (8		,'Multiple-Choice'	),
                        (9		,'Essay'		),
                        (10		,'Multiple-Choice'	);
                        
SELECT *
FROM TypeQuestion; 

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
category_name	VARCHAR(50) NOT NULL
);
INSERT INTO CategoryQuestion(category_id,category_name	)
VALUE				(1	,'Java'		),
				(2	,'.NET'		),
                            	(3	,'SQL'		),
                            	(4	,'Postman'	),
                            	(5	,'Ruby'		),
                            	(6	,'Java'		),
                           	(7	,'SQL'		),
                            	(8	,'.NET'		),
                            	(9	,'Postman'	),
                            	(10	,'Java'		);
                            
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

INSERT INTO Question(question_id	,content	,category_id		,type_id)
VALUE			(1		,'1+1=2?'	,1			,1		),
			(2		,'1+2=3?'	,2			,2		),
                    	(3		,'1+3=4?'	,3			,3		),
                    	(4		,'1+4=5?'	,4			,4		),
                   	(5		,'1+5=0?'	,5			,5		),
                    	(6		,'1+6=7?'	,6			,6		),
                    	(7		,'1+7=8?'	,7			,7		),
                   	(8		,'1+8=9?'	,8			,8		),
                    	(9		,'1+9=0?'	,9			,9		),
                    	(10		,'1+10=0?'	,10			,10		);
                    
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
INSERT INTO Answer	(answer_id	,content	,question_id	,iscorrect	)
VALUE				(1	,'1+1=2?'	,1		,'ĐÚNG'		),
				(2	,'1+2=3?'	,2		,'ĐÚNG'		),
                    		(3	,'1+3=4?'	,1		,'ĐÚNG'		),
                    		(4	,'1+4=5?'	,4		,'ĐÚNG'		),
                    		(5	,'1+5=0?'	,5		,'SAI'		),
                    		(6	,'1+6=7?'	,6		,'ĐÚNG'		),
                    		(7	,'1+7=8?'	,1		,'ĐÚNG'		),
                    		(8	,'1+8=9?'	,8		,'ĐÚNG'		),
                    		(9	,'1+9=0?'	,9		,'SAI'		),
                   		(10	,'1+10=0?'	,1		,'SAI'		);
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

INSERT INTO Exam(exam_id,code	,title	,category_id	, duration	,creator_id	, create_date)
VALUE		(1	,'A11'	,'Toán'	,1		,120		,1			,'2019/12/10'),
		(2	,'A12'	,'Lý'	,2		,90	 	,2			,'2019/12/11'),
		(3	,'A13'	,'Hóa'	,3		,90		,3			,'2019/12/12'),
		(4	,'A14'	,'Sinh'	,4		,60		,4			,'2019/12/13'),
		(5	,'A15'	,'Sử'	,5		,45		,5			,'2019/12/14'),
                (6	,'A16'	,'Địa'	,6		,60		,4			,'2019/12/15'),
                (7	,'A17'	,'Văn'	,7		,60		,4			,'2019/12/16'),
                (8	,'A18'	,'KT'	,8		,60		,4			,'2019/12/17'),
                (9	,'A19'	,'MT'	,9		,60		,4			,'2019/12/18'),
                (10	,'A10'	,'AV'	,10		,60		,4			,'2019/12/19');
SELECT *
FROM Exam;

DROP TABLE IF EXISTS Examquestion;
CREATE TABLE Examquestion(
exam_id			TINYINT UNSIGNED,
question_id		TINYINT UNSIGNED,
 PRIMARY KEY(exam_id,question_id)
);
INSERT INTO Examquestion	(exam_id	,question_id)
VALUE				(1		,1			),
				(2		,2			),
                            	(3		,3			),
                            	(4		,4			),
                            	(5		,5			),
                           	(6		,6			),
                            	(7		,7			),
                            	(8		,8			),
                            	(9		,9			),
                           	(10		,10			);
				
SELECT *
FROM Examquestion;

-- Assignment 3
-- Question 2: lấy ra tất cả các phòng ban
-- Question 3: lấy ra id của phòng ban "Sale"
SELECT *
FROM Department
WHERE Department_name = 'Phòng Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM Account
WHERE LENGTH(fullname) = (SELECT MAX(LENGTH(fullname)) FROM Account);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM Account
WHERE LENGTH(fullname) = (SELECT MAX(LENGTH(fullname)) FROM Account) AND department_id = 3;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT Group_name
FROM Group_user
WHERE creator_date < '2019-12-19';

-- Question 6: Lấy ra ID của question có >= 4 câu trả lời
SELECT question_id, COUNT(question_id) AS so_lan 
FROM answer
GROUP BY question_id
HAVING COUNT(question_id) >=4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT Code
FROM Exam
WHERE duration >= 60 AND create_date < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * 
FROM Group_user
ORDER BY creator_date DESC 
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT department_id, COUNT(account_id) AS so_nhan_vien 
FROM Account
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

