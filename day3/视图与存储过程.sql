--创建视图
--查询学生的学号,学生姓名,课程号,课程名称,成绩
CREATE VIEW v_studentscore
AS
SELECT scores.studentno,studentname,scores.courseno,coursename,score 
FROM scores,studentinfo,course 
WHERE scores.studentno=studentinfo.studentno AND scores.courseno=course.courseno

--使用视图查询学生的学号,学生姓名,课程号,课程名称,成绩
SELECT * FROM v_studentscore;
--查询学生的姓名,课程名称,成绩
--不使用视图
SELECT studentname,coursename,score 
FROM scores,studentinfo,course 
WHERE scores.studentno=studentinfo.studentno AND scores.courseno=course.courseno
--使用视图
SELECT studentname,coursename,score FROM v_studentscore
--查询各个学生的平均成绩,显示学生姓名,平均成绩
--不使用视图
SELECT studentname,AVG(score) FROM studentinfo,scores WHERE studentinfo.studentno=scores.studentno GROUP BY studentname;
--使用视图
SELECT studentname,AVG(score) FROM v_studentscore GROUP BY studentname;


--创建视图2
--查询10号部门的所有员工
CREATE VIEW v_emp1
AS
SELECT * FROM emp WHERE deptno=10

--查询视图
--查询10号部门的所有员工
SELECT * FROM v_emp1

--视图可以用于权限管理


DELIMITER就是告诉mysql解释器，该段命令是否已经结束了，是否可以执行了。
默认情况下，DELIMITER是分号;，遇到分号就执行。
后面的双美元符号 就是告诉mysql，遇到双美元符号再执行

-- 查询所有员工及其所在部门名称
DELIMITER $$
CREATE PROCEDURE sp_emp1()   
    BEGIN
	SELECT emp.*,dname FROM emp,dept WHERE emp.deptno=dept.deptno;	
    END$$
DELIMITER ;
--重新恢复为;号

CALL sp_emp1();



--查询指定部门编号的员工
DELIMITER $$
CREATE PROCEDURE sp_emp2(IN dno INT)   
    BEGIN
	SELECT * FROM emp WHERE deptno=dno;	
    END$$
DELIMITER ;
--查询20号部门的员工
CALL sp_emp2(30)

--查询指定部门名称的员工
DELIMITER $$
CREATE   
    PROCEDURE sp_emp3(IN deptname VARCHAR(50))   
    BEGIN
	SELECT emp.*,dname FROM emp,dept WHERE emp.deptno=dept.deptno AND dname=deptname;	
    END$$
DELIMITER ;

CALL sp_emp3('RESEARCH')

-- 查询员工总人数
DELIMITER //
  CREATE PROCEDURE sp_emp4(OUT counts INT)
    BEGIN
      SELECT COUNT(*) INTO counts FROM emp;      
    END
    //
DELIMITER ;
#调用
SET @num=0;
CALL sp_emp4(@num);
SELECT @num;

-- 查询某个部门的员工人数
DELIMITER $$
  CREATE PROCEDURE sp_emp5(IN dno INT,OUT counts INT)
    BEGIN
      SELECT COUNT(*) INTO counts FROM emp WHERE deptno=dno; 
    END$$    
DELIMITER ;
#调用
--查询10号部门的人数
SET @num=0;
CALL sp_emp5(10,@num);
SELECT @num;
