视图:
1.创建视图,查询学号为1的学生的姓名,课程名称,成绩
CREATE VIEW v_stu 
AS
SELECT studentname ,co.courseno,score FROM course co,scores sc,studentinfo st WHERE co.courseno = sc.courseno AND sc.studentno = st.studentno AND st.studentno LIKE  '_______1';

SELECT * FROM v_stu;
2.查询上述视图,输出该学生的姓名,总成绩与平均成绩
SELECT studentname,SUM(score),AVG(score) FROM v_stu GROUP BY studentname;


存储过程:
3.查询某个学号的学生的总成绩与平均成绩
DELIMITER %%
	CREATE PROCEDURE sp_stu1(IN sno VARCHAR(8))
	BEGIN 
		SELECT studentno,SUM(score),AVG(score) FROM scores WHERE studentno = sno;
	END %%
DELIMITER ;


CALL sp_stu1('20170101');


4.查询某门课程编号的总成绩与平均成绩
DELIMITER %%
	CREATE PROCEDURE sp_stu2(IN cno INT)
	BEGIN 
		SELECT coursename,SUM(score),AVG(score) FROM scores sc,course co WHERE sc.courseno=co.courseno
		AND co.courseno = cno ;
	END %%
DELIMITER ;

CALL sp_stu2(2);


5.查询某个部门名称的部门经理,输出经理的全部信息

	SELECT mgr FROM dept,emp WHERE dept.deptno = emp.deptno AND dname = 'SALES' GROUP BY mgr;
	
DELIMITER %%
	CREATE PROCEDURE sp_emp1(IN dename VARCHAR(14))
	BEGIN 
		SELECT emp.*,dname,loc FROM dept,emp WHERE dept.deptno = emp.deptno AND  empno IN(SELECT mgr FROM dept,emp WHERE dept.deptno = emp.deptno AND dname = dename GROUP BY mgr); 
	END %%
DELIMITER ;

CALL sp_emp1('RESEARCH');
6.查询某个专业的某门课程的总分平均分

DELIMITER %%
	CREATE PROCEDURE sp_stu3(IN spe VARCHAR(20),IN coname VARCHAR(20))
	BEGIN 
		SELECT SUM(score),AVG(score) FROM scores sc,course co,studentinfo st WHERE co.courseno = sc.courseno AND sc.studentno = st.studentno
		AND st.speciality = spe AND  co.coursename = coname ;
	END %%
DELIMITER ;

CALL sp_stu3('计算机软件','java基础');