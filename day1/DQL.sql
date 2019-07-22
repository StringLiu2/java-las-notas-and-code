RENAME TABLE you TO my;

CREATE TABLE emp(
	id INT,
	nam VARCHAR(100),
	gender VARCHAR(10),
	birthday DATE,
	salary FLOAT(10,2),
	entry_date DATE,
	resumee TEXT
);
INSERT INTO emp(id,nam,gender,birthday,salary,entry_date,resumee)
VALUES(1,'zhang','nan','2000-11-11',4000.23,'2018-8-5','..............');
INSERT INTO emp(id,nam,gender,birthday,salary,entry_date,resumee)
VALUES(2,'zhang2','nan','2000-1-11',32132.23,'2018-8-5','..........');
INSERT INTO emp(id,nam,gender,birthday,salary,entry_date,resumee)
VALUES(3,'zhang3','nan','2000-3-11',3223.23,'2018-8-5','.......');
SELECT*FROM emp;


--修改语句

UPDATE emp SET salary = 10000;

UPDATE emp SET salary = 20000 WHERE nam ='zhang';

UPDATE emp SET gender='gui',nam='liu' WHERE id =2;

DELETE FROM emp WHERE nam ='zhang3';

DELETE FROM emp;

--

CREATE TABLE stu (
	sid	CHAR(6),
	sname		VARCHAR(50),
	age		INT,
	gender	VARCHAR(50)
);
INSERT INTO stu VALUES('S_1001', 'liuYi', 35, 'male');
INSERT INTO stu VALUES('S_1002', 'chenEr', 15, 'female');
INSERT INTO stu VALUES('S_1003', 'zhangSan', 95, 'male');
INSERT INTO stu VALUES('S_1004', 'liSi', 65, 'female');
INSERT INTO stu VALUES('S_1005', 'wangWu', 55, 'male');
INSERT INTO stu VALUES('S_1006', 'zhaoLiu', 75, 'female');
INSERT INTO stu VALUES('S_1007', 'sunQi', 25, 'male');
INSERT INTO stu VALUES('S_1008', 'zhouBa', 45, 'female');
INSERT INTO stu VALUES('S_1009', 'wuJiu', 85, 'male');
INSERT INTO stu VALUES('S_1010', 'zhengShi', 5, 'female');
INSERT INTO stu VALUES('S_1011', 'xxx', NULL, NULL);


CREATE TABLE emp(
	empno		INT,
	ename		VARCHAR(50),
	job		VARCHAR(50),
	mgr		INT,
	hiredate	DATE,
	sal		DECIMAL(7,2),
	comm		DECIMAL(7,2),
	deptno		INT
) ;
INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp VALUES(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp VALUES(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp VALUES(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO emp VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp VALUES(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20);
INSERT INTO emp VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp VALUES(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);


CREATE TABLE dept(
	deptno		INT,
	dname		VARCHAR(14),
	loc		VARCHAR(13)
);
INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');


SELECT * FROM stu;

SELECT sid,sname FROM stu;

SELECT * FROM stu WHERE sname = 'liuYi';

SELECT *FROM stu WHERE age BETWEEN 20 AND 40;

SELECT * FROM stu WHERE sid IN('S_1001','S_1003'); 

SELECT * FROM stu WHERE age IS NULL;


SELECT *FROM stu WHERE sname LIKE '_s_____';

SELECT * FROM stu WHERE sname LIKE 's_____';

SELECT * FROM stu WHERE sname LIKE '_____';

SELECT * FROM stu WHERE sname LIKE 's%';

SELECT * FROM stu WHERE sname LIKE '_s%';

SELECT * FROM stu WHERE sname LIKE '%a%';

SELECT * FROM stu WHERE gender <>'male';


SELECT * FROM stu;

SELECT DISTINCT * FROM stu;


SELECT sname FROM stu;

SELECT sname , age , sid FROM stu;

IFNULL(age,0);


SELECT*FROM stu ORDER BY  age;

SELECT*FROM stu ORDER BY age DESC,sname DESC;

SELECT COUNT(*) 总学生数 FROM stu;

SELECT SUM(age) 总年龄 FROM stu;

SELECT MAX(age) 最大年龄 FROM stu;

SELECT MIN(age) 最小年龄 FROM stu;

SELECT AVG(age) AS 平均年龄 FROM stu;

SELECT COUNT(*) 总学生数,SUM(age) 总年龄 ,MAX(age) 最大年龄,MIN(age) 最小年龄,AVG(age) AS 平均年龄 FROM stu;

SELECT gender,COUNT(*) FROM stu GROUP BY gender;

SELECT gender,COUNT(*) FROM stu GROUP BY gender;

SELECT gender,COUNT(age) FROM stu GROUP BY gender;
SELECT gender,COUNT(age) FROM stu GROUP BY gender HAVING AVG(age)>40 ;
SELECT * FROM stu LIMIT 0,5;

SELECT * FROM stu LIMIT 2,10;
--变量 当前页pageno 一页的条数 pagesize
SELECT * FROM stu LIMIT (pageno-1)*pagesize , pagesize;

CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(10),
	scrad INT UNIQUE
);

CREATE TABLE student(
	sid INT AUTO_INCREMENT,
	sname VARCHAR(10),
	scrad INT UNIQUE,
	PRIMARY KEY(sid)
);