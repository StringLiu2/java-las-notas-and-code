--字符串拼接
SELECT CONCAT('MY','SQ','L');
--字符串长度
SELECT LENGTH('mysql');
--字符串比较
--STRCMP(expr1,expr2) 
--若所有的字符串均相同，则返回0，若根据当前分类次序，
第一个参数小于第二个，则返回  -1，大于则返回 1 。
SELECT STRCMP('text', 'text');
SELECT STRCMP('b', 'a');
SELECT STRCMP('b', 'c');
--日期函数
--日期
SELECT CURRENT_DATE();
--时间
SELECT CURRENT_TIME();
--现在的日期时间
SELECT NOW();
--时间相减(返回天数)
SELECT DATEDIFF('2017-12-31 23:59:59','2017-12-30');
SELECT DATEDIFF('2017-11-30 23:59:59','2017-12-31');
--时间相加 返回时间
SELECT DATE_ADD('2017-12-31 23:59:59',INTERVAL 1 SECOND);
SELECT DATE_ADD('2018-01-01', INTERVAL 1 DAY);
SELECT DATE_ADD('2018-01-01', INTERVAL 1 HOUR);
SELECT DATE_ADD('2018-01-30', INTERVAL 1 MONTH);

--返回DATE 对应的工作日名称
SELECT DAYNAME('2018-03-06');
--返回DATE 对应的该月日期，范围是从 1到31。
SELECT DAYOFMONTH('2018-3-18');

--返回DATE (1 = 周日, 2 = 周一, ..., 7 = 周六)对应的工作日索引。
SELECT DAYOFWEEK('2018-03-06');

--返回DATE 对应的一年中的天数，范围是从 1到366。
SELECT DAYOFYEAR('2018-02-1');

SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

--获取一个日期或日期时间值，返回该月最后一天对应的值。若参数无效，则返回NULL。
SELECT LAST_DAY('2016-02-05');



-------------------------------------------------------------------------------------------

--创建视图
CREATE VIEW v_student
AS
SELECT scores.studentno,studentname,speciality,SUM(score),AVG(score) FROM scores,studentinfo 
WHERE scores.studentno = studentinfo.studentno
AND speciality IN(SELECT speciality FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno GROUP BY class
HAVING AVG(score)>(SELECT AVG(score) FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno AND speciality='电子商务'))
GROUP BY scores.studentno;

SELECT * FROM v_student;

SELECT studentno,studentname FROM v_student;

------ 视图
CREATE VIEW v_student02
AS
SELECT scores.studentno,studentname,scores.courseno,coursename,score FROM course,scores,studentinfo 
WHERE studentsex='男' AND  course.courseno = scores.courseno AND studentinfo.studentno = scores.studentno;

SELECT * FROM v_student02;

SELECT studentname,SUM(score) FROM v_student02 GROUP BY studentno;

------- 视图存储过程

DELIMITER就是告诉mysql解释器,该段命令是否已经结束了 ,是否可以执行了
默认情况下,DELIMITER是分号，就是告诉mysql，遇到双美元符号再执行

--查询所以员工及其所在部门名称

DELIMITER %%
CREATE PROCEDURE sp_emp1()
	BEGIN 
		SELECT emp.*,dname FROM emp,dept WHERE emp.deptno = dept.deptno;
	END %%
DELIMITER ;
--重新恢复为;号
--打印出来
CALL sp_emp1();

--根据部门编号查询员工
DELIMITER //
CREATE PROCEDURE sp_emp2(IN dno INT)
	BEGIN
		SELECT * FROM emp WHERE deptno = dno;
	END //
DELIMITER ;
--查询20号部门员工
CALL sp_emp2(10);

--获取员工人数
DELIMITER //
CREATE PROCEDURE sp_emp3(OUT counts INT)
	BEGIN
		SELECT COUNT(*) INTO counts FROM emp;
	END //
DELIMITER ;
--获取员工人数
SET @num = 0;
CALL sp_emp3(@num);
SELECT @num;

--获取某某部门人数
DELIMITER //
CREATE PROCEDURE sp_emp4(IN dno INT,OUT counts INT)
	BEGIN
		SELECT COUNT(*) INTO counts FROM emp WHERE deptno =dno;
	END //
DELIMITER ;
--获取10号部门的人数
SET @num = 0;
CALL sp_emp4(10,@num);
SELECT @num;