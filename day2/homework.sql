1.查询男学生的学号、姓名、课程编号、课程名称、成绩

SELECT scores.studentno 学号,studentname 姓名,scores.courseno 课程编号,coursename 课程名称,score 成绩 FROM course,scores,studentinfo 
WHERE studentsex='男' AND  course.courseno = scores.courseno AND studentinfo.studentno = scores.studentno;


2.查询各个班的班级,专业名称,专业总分,专业平均分
--1.查看专业,按专业分
SELECT speciality FROM studentinfo GROUP BY speciality;
--2.查看每个专业的总分
SELECT speciality,SUM(score) FROM scores,studentinfo WHERE scores.studentno=studentinfo.studentno GROUP BY speciality;
--
SELECT  class 班级,speciality 专业,SUM(score) 总分,AVG(score) 平均分 FROM scores,studentinfo 
WHERE scores.studentno = studentinfo.studentno GROUP BY class,speciality;


3.查询各个课程的课程编号,课程名称,总分,平均分
--查看每个课程和编号
SELECT courseno,coursename FROM course GROUP BY courseno;
--
SELECT scores.courseno 课程编号,coursename 课程名称,SUM(score) 总分,AVG(score) 平均分 FROM course,scores 
WHERE course.courseno = scores.courseno GROUP BY scores.courseno;


4.查询班级平均分高于电子商务专业的玫级的所有学生的学号,专业,总分,平均分
--1.查看电子商务专业的平均分
SELECT AVG(score) FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno AND speciality='电子商务';
--2.查询高于电子商务专业的班级
SELECT speciality FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno GROUP BY class
HAVING AVG(score)>(SELECT AVG(score) FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno AND speciality='电子商务');
--
SELECT scores.studentno 学号,studentname,speciality 专业,SUM(score) 总分,AVG(score) 平均分 FROM scores,studentinfo 
WHERE scores.studentno = studentinfo.studentno
AND speciality IN(SELECT speciality FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno GROUP BY class
HAVING AVG(score)>(SELECT AVG(score) FROM scores,studentinfo WHERE scores.studentno = studentinfo.studentno AND speciality='电子商务'))
GROUP BY scores.studentno;


5.查询工作和部门与ALLEN相同的员工,输出员工姓名职位部门编号与名称
--1.查询ALLEN的工作和部门
SELECT job,deptno FROM emp WHERE ename='ALLEN';
--
SELECT ename 员工姓名,job 职位,emp.deptno 部门编号,dname 名称 FROM emp,dept WHERE emp.deptno=dept.deptno 
AND (job,emp.deptno)IN(SELECT job,deptno FROM emp WHERE ename='ALLEN');


6.有只有一个直接下属的员工信息
--1.分组查询mgr出现的次数
SELECT mgr,COUNT(mgr) FROM emp GROUP BY mgr;
--2.筛选出上述结果中等于1的
SELECT mgr,COUNT(mgr) FROM emp GROUP BY mgr HAVING COUNT(mgr)=1;

SELECT mgr FROM emp GROUP BY mgr HAVING COUNT(mgr)=1;
--3.查询上述结果中的员工编号的员工信息
SELECT * FROM emp 
WHERE empno IN(SELECT mgr FROM emp GROUP BY mgr HAVING COUNT(mgr)=1);


7.求所有员工的员工编号、姓名、经理编号和经理姓名
--1.求出员工的经理编号
SELECT mgr FROM emp;
--2.求出员工的员工编号、姓名、经理编号
SELECT empno,ename,mgr FROM emp;
--
SELECT e1.empno 员工编号,e1.ename 姓名,e1.mgr 经理编号,e2.ename 经理姓名 FROM emp e1 JOIN emp e2 
WHERE e1.empno IN(SELECT empno FROM emp) AND e1.mgr=e2.empno;


8.工资高于WARD的工资的所有人的员工信息
--查看WARD的工资
SELECT sal FROM emp WHERE ename='WARD';
--
SELECT*FROM emp WHERE sal >(SELECT sal FROM emp WHERE ename='WARD');

SELECT*FROM emp WHERE sal> ALL(SELECT sal FROM emp WHERE ename='WARD');