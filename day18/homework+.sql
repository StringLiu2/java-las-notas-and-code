--创建emp表
CREATE TABLE emp(
	empno		INT PRIMARY KEY AUTO_INCREMENT,
	ename		VARCHAR(50) NOT NULL,
	job		VARCHAR(50),
	mgr		INT,
	hiredate	DATE,
	sal		DECIMAL(7,2),
	comm		DECIMAL(7,2),
	deptno		INT,
	CONSTRAINT emp_deftno FOREIGN KEY(deptno) REFERENCES dept(deptno)
);

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
INSERT INTO emp VALUES(7935,'TOOBUG','CLERK',7782,'1999-02-23',2100,11,10);
INSERT INTO emp VALUES(7937,'马云','CLERK',7782,'1988-01-23',2200,2000,10);
--创建dept表
CREATE TABLE dept(
	deptno		INT PRIMARY KEY AUTO_INCREMENT,
	dname		VARCHAR(14) NOT NULL,
	loc		VARCHAR(13)
);
--为dept表添加记录
INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');



-- 查询每个部门的部门编号，总人数，平均工资
SELECT deptno ,COUNT(empno),AVG(sal) FROM emp WHERE deptno IN (SELECT deptno FROM emp) GROUP BY deptno;
-- 查询与TOOBUG在同一个部门的员工
SELECT ename FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'TOOBUG') AND ename <> 'TOOBUG';
-- 查询工资比马云少的员工所在部门的人数
SELECT deptno,COUNT(deptno) FROM emp WHERE sal < (SELECT sal FROM emp WHERE ename = '马云') GROUP BY deptno;
-- 查询每个部门薪水最高的员工所有信息
SELECT * FROM emp WHERE sal IN (SELECT MAX(sal) FROM emp WHERE deptno IN (SELECT deptno FROM emp) GROUP BY deptno
);
-- 查询所有部门编号为2的员工信息
SELECT * FROM emp WHERE deptno = 20;

-- 设计表
-- 账号
CREATE TABLE `user`(
	`username` VARCHAR(20) PRIMARY KEY,
	`password` VARCHAR(20)
);

INSERT INTO `user` VALUES ('string','xxxxxx'); 
INSERT INTO `user` VALUES ('cuiwen','meijiule'); 



-- 商品
CREATE TABLE shop(
	id  INT PRIMARY KEY,
	`username` VARCHAR(20),
	`name` VARCHAR(20),
	sort INT,
	CONSTRAINT user_shop FOREIGN KEY(username) REFERENCES `user`(username),
	CONSTRAINT sort_shop FOREIGN KEY(sort) REFERENCES `sort`(id)
);
INSERT INTO shop VALUES (1,'string','cui牌猪肉脯',1);
INSERT INTO shop VALUES (2,'string','cui牌牛肉干',1);
INSERT INTO shop VALUES (3,'cuiwen','cui牌鱿鱼条',1);
INSERT INTO shop VALUES (4,'cuiwen','怡宝',2);
INSERT INTO shop VALUES (5,'string','油菜',3);
INSERT INTO shop VALUES (6,'cuiwen','青菜',3);
INSERT INTO shop VALUES (7,'string','菜心',3);
INSERT INTO shop VALUES (8,'cuiwen','农夫三拳',2);
INSERT INTO shop VALUES (9,'string','水杯',1);
-- 分类


CREATE TABLE sort(
	id INT PRIMARY KEY,
	NAME VARCHAR(20)
);
INSERT INTO sort VALUES(1,'生活用品');
INSERT INTO sort VALUES(2,'饮品');
INSERT INTO sort VALUES(3,'蔬菜类');

-- 要求商品必须存在由哪个账户进行发布的
