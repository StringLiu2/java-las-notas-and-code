CREATE DATABASE homework;

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

1.查询员工姓名是4个字母的员工信息

SELECT * FROM emp WHERE ename LIKE '____';
2.查询员工姓名里面包含A的
SELECT * FROM emp WHERE ename LIKE '%A%';
3.查询员工姓名以S结尾的
SELECT * FROM emp WHERE ename LIKE '%S';
4.分组查询各个职位的员工人数,输出职位与员工人数
SELECT job 职位,COUNT(job) 该职位人数 FROM emp GROUP BY job; 
5.分组查询各个职位的员工平均工资,最高工资,最低工资
SELECT job ,AVG(sal) 平均工资 ,MAX(sal) 最高工资, MIN(sal) 最低工资 FROM emp GROUP BY job;
6.分组查询各个职位的员工平均实发工资(工资+奖金),输出职位与员
工平均工实发工资,用中文显示列名,只显示平均实发工资大于2000的
SELECT job 部门,AVG(sal+IFNULL(comm,0)) 平均工资 FROM emp GROUP BY job HAVING AVG(sal+IFNULL(comm,0))>2000;

7.查询第4页,每页3条
SELECT * FROM emp LIMIT 9,3;
8.新建一个product表,有产品编号pid,产品名称pname,价格price,产
地address列,使用三种方式设置产品编号pid为主键,设置pid自动增
长,并使用INSERT语句测试是否自动增长
CREATE TABLE product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	pname VARCHAR(10),
	price DOUBLE,
	address VARCHAR(20)
);

INSERT INTO product(pname,price,address) VALUES('张三',2000,'China');
INSERT INTO product(pname,price,address) VALUES('李四',1000,'China');
INSERT INTO product(pname,price,address) VALUES('赵五',1600,'China');

CREATE TABLE product(
	pid INT AUTO_INCREMENT,
	pname VARCHAR(10),
	price DOUBLE,
	address VARCHAR(20),
	PRIMARY KEY(pid)
);
CREATE TABLE product(
	pid INT AUTO_INCREMENT,
	pname VARCHAR(10),
	price DOUBLE,
	address VARCHAR(20)
);
ALTER TABLE product ADD PRIMARY KEY(pid);

9.说说主键约束与唯一约束的区别,联合主键是怎么回事?
主键约束本列不能重复且不能为空

唯一约束 该列不重复、可以为空、其他列可以为空
