DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS  Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	department_name		VARCHAR(50) NOT NULL UNIQUE KEY
);

INSERT INTO Department(department_name)
VALUE					('Phòng Hàng chính'),
						('Phòng Nhân sự'),
						('Phòng Kế toán'),
						('Phòng Marketting'),
						('Phòng Thiết kế'),
						('Phòng Sale'),
                        ('Phòng Xuất nhập khẩu'),
                        ('Phòng Kế hoạch'),
                        ('Phòng Dự án đầu tư'),
                        ('Phòng Giao nhận');
SELECT *
FROM Department;

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
position_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
position_name	ENUM('Dev','Test','Serum Master','PM') UNIQUE KEY
);
INSERT INTO Position ( position_name)
VALUE						('Dev'),
							('Test'),
							('Serum Master'),
							('PM');
SELECT *
FROM Position ;

DROP TABLE IF EXISTS Account;
CREATE TABLE `Account` (
account_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
email			VARCHAR(50),
username		VARCHAR(50) NOT NULL UNIQUE KEY,
fullname		VARCHAR(50) NOT NULL,
department_id	TINYINT UNSIGNED,
position_id		TINYINT UNSIGNED,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY (department_id) REFERENCES Department(department_id),
FOREIGN KEY (position_id) REFERENCES Position (position_id)
);

INSERT INTO `Account` (account_id	, email						, username		, fullname			)
VALUE						(1	,'nguyenvana@gmail.com'		, 'anguyen'		, 'nguyen van a'		), 
							(2	,'nguyenvanb@gmail.com'		, 'bnguyen'		, 'nguyen van b'		),
							(3	,'nguyenvanhuynh@gmail.com'	, 'quynhnguyen'	, 'nguyen van quynh'		),
                            (4	,'nguyenvandao@gmail.com'	, 'daonguoen'	, 'nguyen van dao'				),
							(5	,'nguyenvane@gmail.com'		, 'enguyen'		, 'nguyen van e'				),
							(6	,'nguyenvanf@gmail.com'		, 'fnguyen'		, 'nguyen van f'				),
                            (7	,'nguyenvang@gmail.com'		, 'gnguyen'		, 'nguyen van g'			),
                            (8	,'nguyenvanh@gmail.com'		, 'hnguyen'		, 'nguyen van h'				),
                            (9	,'nguyenvanvo@gmail.com'	, 'vonguyen'	, 'nguyen van vo'					),
                            (10	,'nguyenvanhuynh@gmail.com'	, 'huynhnguyen'	, 'nguyen van huynh'		);
SELECT *		
FROM Account;

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
group_id 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
group_name 		VARCHAR(50) NOT NULL UNIQUE KEY,
creator_id 		TINYINT UNSIGNED,
creator_date 	DATETIME DEFAULT NOW(),
FOREIGN KEY (creator_id) REFERENCES `Account`(account_id)
);
INSERT INTO `Group`(	group_name	,creator_id	, creator_date)
VALUE					('G-1'		,1			,'2019/12/10'),
						('G-2'		,2			,'2019/12/11'),
						('G-3'		,3			,'2019/12/13'),
						('G-4'		,4			,'2019/12/14'),
						('G-5'		,5			,'2019/12/15'),
                        ('G-6'		,6			,'2019/12/16'),
                        ('G-7'		,7			,'2019/12/17'),
                        ('G-8'		,8			,'2019/12/18'),
                        ('G-9'		,9			,'2019/12/18'),
                        ('G-10'		,10			,'2019/12/20');
SELECT *
FROM Group_user;

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
group_id		TINYINT UNSIGNED,
account_id		TINYINT UNSIGNED,
join_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(group_id) REFERENCES `Group`(group_id),
FOREIGN KEY(account_id) REFERENCES `Account`(account_id)
);
INSERT INTO GroupAccount	(group_id	,account_id	)
VALUE						(1			,1			),
							(2			,2			),
							(3			,3			),
							(4			,4			),
                            (5			,5			),
                            (6			,6			),
                            (7			,7			),
                            (8			,8			),
                            (9			,9			),
                            (10			,10			);
                            

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
category_name	VARCHAR(50) NOT NULL UNIQUE KEY
);
INSERT INTO CategoryQuestion(category_name)
VALUE						('Java'),
							('.NET'),
                            ('SQL'),
                            ('Postman'),
                            ('Ruby');
                            
SELECT *
FROM CategoryQuestion; 

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
question_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content			VARCHAR(50) NOT NULL,
category_id		TINYINT UNSIGNED,
type_id			TINYINT UNSIGNED,
creator_id		TINYINT UNSIGNED,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(creator_id) REFERENCES `Account`(account_id),
FOREIGN KEY(category_id) REFERENCES CategoryQuestion (category_id),
FOREIGN KEY(type_id) REFERENCES TypeQuestion (type_id)
);

INSERT INTO Question(content	)
VALUE				('1+1=2?'	),
					('1+2=3?'	),
                    ('1+3=4?'	),
                    ('1+4=5?'	),
                    ('1+5=0?'		),
                    ('1+6=7?'		),
                    ('1+7=8?'		),
                    ('1+8=9?'			),
                    ('1+9=0?'		),
                    ('1+10=0?'		);
                    
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
INSERT INTO Answer	(content	,iscorrect)
VALUE				('1+1=2?'	,'ĐÚNG'),
					('1+2=3?'	,'ĐÚNG'),
                    ('1+3=4?'	,'ĐÚNG'),
                    ('1+4=5?'	,'ĐÚNG'),
                    ('1+5=0?'	,'SAI'),
                    ('1+6=7?'	,'ĐÚNG'),
                    ('1+7=8?'	,'ĐÚNG'),
                    ('1+8=9?'	,'ĐÚNG'),
                    ('1+9=0?'	,'SAI'),
                    ('1+10=0?'	,'SAI');
SELECT *
FROM Answer;               
                  
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
code			VARCHAR(50) NOT NULL,
title			VARCHAR(50) NOT NULL,
category_id		TINYINT UNSIGNED ,
duration		TINYINT UNSIGNED CHECK (duration >= 45 AND duration <= 120),
creator_id		TINYINT UNSIGNED,
create_date		DATETIME DEFAULT NOW(),
FOREIGN KEY(creator_id) REFERENCES `Account`(account_id),
FOREIGN KEY(category_id) REFERENCES CategoryQuestion (category_id)
);

INSERT INTO Exam(code	,title	, duration	, create_date)
VALUE			('A11'	,'Toán'	,120		,'2019/12/10'),
				('A12'	,'Lý'	,90	 		,'2019/12/11'),
				('A13'	,'Hóa'	,90			,'2019/12/12'),
				('A14'	,'Sinh'	,60			,'2019/12/13'),
				('A15'	,'Sử'	,45			,'2019/12/14'),
                ('A16'	,'Địa'	,60			,'2019/12/15'),
                ('A17'	,'Văn'	,60			,'2019/12/16'),
                ('A18'	,'KT'	,60			,'2019/12/17'),
                ('A19'	,'MT'	,60			,'2019/12/18'),
                ('A10'	,'AV'	,60			,'2019/12/19');
SELECT *
FROM Exam;

DROP TABLE IF EXISTS Examquestion;
CREATE TABLE Examquestion(
exam_id			TINYINT UNSIGNED,
question_id		TINYINT UNSIGNED,
 PRIMARY KEY(exam_id,question_id),
 FOREIGN KEY(question_id) REFERENCES Question(question_id)
);
				
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
FROM `Group`
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
FROM `Group`
ORDER BY creator_date DESC 
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT department_id, COUNT(account_id) AS so_nhan_vien 
FROM Account
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
DELETE 
FROM Exam WHERE CreateDate < '2019-12-20';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
UPDATE Account
SET fullname 	= 	N'Nguyễn Quang Chiến', 
	email 		= 	'chienquang.nguyen@adcstudio.info'
WHERE account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE 	GroupAccount
SET 	account_id = 5 
WHERE 	group_id = 4;

-- Assignment 4
