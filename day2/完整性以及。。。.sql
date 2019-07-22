CREATE TABLE student(
	Id INT PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	Sex VARCHAR(10) DEFAULT '女'
);

INSERT INTO student VALUES(1,'tom','女');
INSERT INTO student VALUES(2,'jerry',DEFAULT);
INSERT INTO student VALUES(3,'zcw',DEFAULT);

CREATE TABLE student(
id INT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
sex VARCHAR(10) DEFAULT 'nan'
);
CREATE TABLE score(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	sid INT ,
	coursename  VARCHAR(10),
	score INT,
	CONSTRAINT fk_score_sid FOREIGN KEY (sid) REFERENCES student(id)
);

CREATE TABLE score(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	coursename  VARCHAR(10),
	score INT
);
ALTER TABLE score ADD CONSTRAINT fk_score_sid FOREIGN KEY (sid) REFERENCES student(id);

ALTER TABLE score ADD CONSTRAINT fk_score_ss UNIQUE(sid);

SELECT * FROM stu UNION SELECT *FROM score;
SELECT * FROM stu UNION ALL SELECT *FROM score;

笛卡尔乘积
SELECT * FROM stu,score;


SELECT studentno , courseno,score FROM scores;
--内连接 不标准做法
SELECT scores.studentno ,studentname , courseno,score FROM scores,studentinfo 
WHERE scores.studentno=studentinfo.studentno;

SELECT studentno,scores.courseno,score FROM scores,course
WHERE scores.courseno = course.courseno;

SELECT scores.studentno,studentname,scores.courseno,score FROM scores,course,studentinfo
WHERE scores.courseno = course.courseno AND scores.studentno = studentinfo.studentno;

--内连接
SELECT studentno,scores.courseno,score FROM scores INNER JOIN course ON scores.courseno = course.courseno;
--左外连接
SELECT studentno,course.courseno,score FROM course LEFT OUTER JOIN scores ON scores.courseno = course.courseno;
--右外连接
SELECT studentno,course.courseno,score FROM scores RIGHT OUTER JOIN course ON scores.courseno = course.courseno;

SELECT ename,sal,dname,loc FROM emp,dept WHERE emp.deptno=dept.deptno AND empno = 7788;

