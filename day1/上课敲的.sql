--删除数据库
DROP DATABASE mydb2;
--创建数据库
CREATE DATABASE mydb;


--创建数据库,使用GBK字符集
CREATE DATABASE mydb1 CHARACTER SET gbk;

--修改数据库 mydb,让它支持UTF-8字符集
ALTER DATABASE mydb CHARACTER SET UTF8;

--查看所有数据库
SHOW DATABASES;

--查看前面创建的mydb1数据库的定义信息
SHOW  CREATE  DATABASE mydb1;

--其他
--查看当前使用的数据库
SELECT DATABASE();
--切换数据库
USE mydb1;

--DDL操作表
--创建表
USE mydb;
CREATE TABLE employee(
	empno CHAR(5),
	empname VARCHAR(10),
	age INT,
	birthday DATE,
	gender CHAR(2),
	job VARCHAR(15),
	salary DOUBLE
);

--查询当前数据的所有表
SHOW TABLES;
--查看表的字段信息
DESC employee;
--修改表添加列
ALTER TABLE employee ADD photo BLOB;
--修改表修改列
ALTER TABLE employee MODIFY job CHAR(20);
--修改表删除列
ALTER TABLE employee DROP age;


--修改表名 employee改名为users
RENAME TABLE employee TO users;
DESC employee;
RENAME TABLE users TO employee;

--列名empname修改为username
ALTER TABLE employee CHANGE empname ename VARCHAR(100);

--删除表
DROP TABLE employee;

--新建表emp
CREATE TABLE emp(
id INT,
NAME VARCHAR(100),
gender VARCHAR(10),
birthday DATE,
salary FLOAT(10,2),
entry_date DATE,
RESUME TEXT
);

--DML--给表emp插入一条记录
INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME)
VALUES(1,'张无忌','男','2000-11-11',3000.00,'2018-8-1','武当山掌门人');

INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME)
VALUES(2,'李寻欢','female','1990-5-10',10000,'2015-5-5-','good girl');

INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME)
VALUES(3,'lisi','male','1995-5-10',10000,'2015-5-5','good boy');


--修改数据表
--将所有员工的工资改为 5000.
UPDATE emp SET salary=5000;

--将张无忌的工资改为 10000
UPDATE emp SET salary=10000 WHERE NAME='张无忌';
--将lisi的性别改为女,出生日期改为1999-1-1;
UPDATE emp SET gender='女',birthday='1999-1-1' WHERE NAME='lisi';
----将lisi的性别改为女,出生日期改为1999-1-1,名字改为李四;
UPDATE emp SET gender='女',birthday='1999-1-1',NAME='李四' WHERE id=3;


--删除表
--删除李四的记录
DELETE FROM emp WHERE NAME='李四'; 
--删除表中的所有记录
DELETE FROM emp;

--数据查询DQL,只查询数据,不会改变数据库

--新建数据库mydb1
DROP DATABASE mydb1;
CREATE DATABASE mydb1;
--新建以下表
CREATE TABLE stu (
	sid		CHAR(6),
	sname		VARCHAR(50),
	age		INT,
	gender	VARCHAR(50)
);
--给表stu添加数据
--插入数据时,如果列值的个数,顺序,类型与列定义时的列一致,则可以省略列名
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

--创建emp表
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

--为emp添加值
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

--创建dept表
CREATE TABLE dept(
	deptno		INT,
	dname		VARCHAR(14),
	loc			VARCHAR(13)
);
--为dept表添加记录
INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');


--查询所有学生
SELECT * FROM stu;
--查询学生的姓名,年龄
SELECT sname,age FROM stu;
--查询学生的姓名
SELECT sname FROM stu;
--查询女学生
SELECT * FROM stu WHERE gender='female';
--查询30岁以下的女同学 
SELECT * FROM stu WHERE gender='female' AND age<30;
--查询学号为S_1001，或者姓名为liSi的记录
SELECT * FROM stu WHERE sid='S_1001' OR sname='liSi';
--查询学号为S_1001或者S_1002的记录
SELECT * FROM stu WHERE sid='S_1001' OR sid='S_1002';
--查询学号为S_1001或者S_1002或者S_1003的记录
SELECT * FROM stu WHERE sid='S_1001' OR sid='S_1002' OR sid='S_1003';
--查询学号为S_1001，S_1002，S_1003的记录
SELECT * FROM stu WHERE sid IN('S_1001','S_1002','S_1003');
--查询年龄为NULL的记录
SELECT * FROM stu WHERE age IS NULL;
--查询年龄不为NULL的记录
SELECT * FROM stu WHERE age IS NOT NULL;
--查询年龄在20到40之间的学生记录
SELECT * FROM stu WHERE age>=20 AND age<=40;
SELECT * FROM stu WHERE age BETWEEN 20 AND 40;
--查询性别非男的学生记录
SELECT * FROM stu WHERE gender!='male';
SELECT * FROM stu WHERE NOT gender='male';

--模糊查询
--查询姓名由5个字母构成的学生记录
SELECT * FROM stu WHERE sname LIKE '_____';
--查询姓名由5个字母构成，并且第5个字母为“i”的学生记录
SELECT * FROM stu WHERE sname LIKE '____i';
--查询姓名由5个字母构成，并且第1个字母为“s”的学生记录
SELECT * FROM stu WHERE sname LIKE 's____';
--查询姓名第1个字母为“z”的学生记录
SELECT * FROM stu WHERE sname LIKE 'z%';
--查询姓张的学生记录
SELECT * FROM stu WHERE sname LIKE '张%';
--查询姓名中第2个字母为“i”的学生记录
SELECT * FROM stu WHERE sname LIKE '_i%';
-查询姓名中含有字母为“i”的学生记录
SELECT * FROM stu WHERE sname LIKE '%i%';
--查询姓名中包含字母a的学生.
SELECT * FROM stu WHERE sname LIKE '%a%';


--字段控制查询
--查询所有员工
SELECT * FROM emp;
--查询员工的职位(有重复)
SELECT job FROM emp;
--查询员工有哪几个职位(不能重复)
SELECT DISTINCT job FROM emp;

--查看雇员的姓名,月薪与佣金
SELECT ename,sal,comm FROM emp;

--查看雇员的姓名,月薪与佣金,月实际收入
SELECT ename,sal,comm,sal+comm FROM emp;

--思路把NULL当作0来处理
--查看雇员的姓名,月薪与佣金,如果佣金为NULL则显示为0
SELECT ename,sal,comm, IFNULL(comm,0) FROM emp;
--使用JAVA来模拟comm==NULL?0:comm;
--查看雇员的姓名,月薪与佣金,月实际收入
SELECT ename AS 员工姓名,sal 基本工资,comm 奖金,sal+IFNULL(comm,0) AS 月实际工资 
FROM emp;


--查询所有学生记录，按年龄升序排序(默认)
SELECT * FROM stu ORDER BY age ASC
--查询所有学生记录，按年龄降序排序
SELECT * FROM stu ORDER BY age DESC
--查询所有雇员，按月薪升序排序，如果月薪相同时，按编号降序排序
SELECT * FROM emp ORDER BY sal ASC,empno DESC


--聚合函数
--查询emp表中记录数：
--查询有几个员工
SELECT COUNT(empno) AS 员工人数 FROM emp;
SELECT COUNT(*) AS 员工人数 FROM emp;
--查询emp表中有佣金的人数：
SELECT COUNT(comm) FROM emp;
--查询emp表中月薪大于2500的 人数：
SELECT COUNT(*) FROM emp WHERE sal>2500;
--统计月薪与佣金之和大于2500元的人数：
SELECT COUNT(*) FROM emp WHERE sal+IFNULL(comm,0)>2500;
--	查询有佣金的人数，以及有领导的人数：
SELECT COUNT(comm) 有佣金的人数,COUNT(mgr) 有领导的人数 FROM emp;
--查询所有雇员月薪和：
SELECT SUM(SAL) 月薪和 FROM emp;
--	查询所有雇员月薪和，以及所有雇员佣金和：
SELECT SUM(SAL),SUM(comm) 月薪和 FROM emp;
--	查询所有雇员月薪+佣金和：
SELECT SUM(SAL)+SUM(comm) 月薪和 FROM emp;
SELECT SUM(sal+IFNULL(comm,0)) 月薪和 FROM emp;
--	统计所有员工平均工资：
SELECT AVG(sal) FROM emp;
--	统计所有员工最高工资：
SELECT MAX(sal) FROM emp;
--	统计所有员工最低工资：
SELECT MIN(sal) FROM emp;
--同时查询工资总和,最高工资,最低工资,平均工资
SELECT SUM(sal) 工资总和,MAX(sal) 最高工资,MIN(sal) 最低工资,AVG(sal) 平均工资 
FROM emp 

--分组查询
--查询男同学的人数
SELECT COUNT(*) FROM stu WHERE gender='male';
--查询女同学的人数
SELECT COUNT(*) FROM stu WHERE gender='female';
--查询不同性别的同学的人数
SELECT gender,COUNT(*) FROM stu GROUP BY gender
--查询每个部门的部门编号以及每个部门的人数：
SELECT COUNT(*) FROM emp WHERE deptno=10
SELECT COUNT(*) FROM emp WHERE deptno=20
SELECT COUNT(*) FROM emp WHERE deptno=30
SELECT deptno,COUNT(*) FROM emp GROUP BY deptno;
--	查询每个部门的部门编号和每个部门的工资和：
SELECT deptno,SUM(sal) FROM emp GROUP BY deptno
--	查询每个部门的部门编号和每个部门的平均工资：
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno
--	查询每个部门的部门编号和每个部门的最高工资：
SELECT deptno,MAX(sal) FROM emp GROUP BY deptno
--	查询每个部门的部门编号以及每个部门工资大于1500的人数：
SELECT deptno,COUNT(*) FROM emp WHERE sal>1500 GROUP BY deptno
--	查询工资总和大于9000的部门编号以及工资和：
SELECT deptno,SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>9000;

--查询各个职位的平均工资
SELECT job,AVG(sal) FROM emp GROUP BY job

--只查看前面五个员工
SELECT * FROM emp LIMIT 0,5
--查询10行记录，起始行从3开始
SELECT * FROM emp LIMIT 2,10
--分页,每页显示3条,
--查询第1页
SELECT * FROM emp LIMIT 0,3
--SELECT * FROM emp LIMIT (1-1)*3,3
--查询第2页
SELECT * FROM emp LIMIT 3,3
--SELECT * FROM emp LIMIT (2-1)*3,3
--查询第3页
SELECT * FROM emp LIMIT 6,3
--SELECT * FROM emp LIMIT (3-1)*3,3
--变量 页码,即当前页pageno,一页显示的条数pagesize
--SELECT * FROM emp LIMIT (pageno-1)*pagesize,pagesize
--分页,第5页,每页2条
SELECT * FROM emp LIMIT 8,2

--创建学生表student,无主健约束,数据有重复
CREATE TABLE student(
sid INT,
sname VARCHAR(50)
);

SELECT * FROM student

DROP TABLE student;

--创建学生表student,有主健约束,数据不能重复,方式一
CREATE TABLE student(
sid INT PRIMARY KEY,
sname VARCHAR(50)
);

--创建学生表student,有主健约束,数据不能重复,方式二
CREATE TABLE student(
sid INT,
NAME VARCHAR(50),
PRIMARY KEY(sid)
);
方式二可以设置联合主健
CREATE TABLE student(
classid INT,
stuid INT,
NAME VARCHAR(50),
PRIMARY KEY(classid,stuid)
);

--创建学生表student,有主健约束,数据不能重复,方式三
--创建表时忘记设主健.
先建表
CREATE TABLE student(
sid INT,
sname VARCHAR(50)
);
以后再设主健
ALTER TABLE student  ADD  PRIMARY  KEY (sid);

--唯一约束
CREATE TABLE student(
SId INT PRIMARY KEY,
NAME VARCHAR(50), 
Idcard VARCHAR(18) UNIQUE
);

--自动增长列
CREATE TABLE student(
Id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50)
);

INSERT INTO student(NAME) VALUES('ddddd');

