--创建表空间
CREATE TABLESPACE lifeng_ts
DATAFILE 'c:\oracle_data\lifeng.dbf' SIZE 10M
AUTOEXTEND ON next 1M;

--修改表空间
ALTER TABLESPACE lifeng_ts
ADD DATAFILE 'c:\oracle_data\lifeng2.DBF' SIZE 5M
AUTOEXTEND ON;

--查看表空间
SELECT file_name,tablespace_name,bytes,autoextensible 
FROM dba_data_files
WHERE tablespace_name='LIFENG_TS';


--删除表空间,同时删除数据文件
DROP TABLESPACE lifeng_ts INCLUDING CONTENTS AND DATAFILES;
--6.2.1	查询系统用户
select * from all_users;


--创建用户
语法: CREATE USER 用户名 IDENTIFIED BY 密码
   DEFAULT TABLESPACE 表空间;
   
   create user book identified by 123
   default tablespace lifeng_ts

   
--修改用户
【语法】
ALTER USER 用户名 identified by 密码
alter user book identified by 123456


--删除用户  【语法】
DROP USER 用户名 CASCADE;

【示例】
DROP USER book CASCADE;
DROP USER book2 CASCADE;


  --解锁
  ALTER USER book2 ACCOUNT UNLOCK;

--权限管理
--查看当前用户的系统权限
Select * from user_sys_privs;


--查看当前用户的对象权限
select*from user_tab_privs;

--给book用户CREATE SESSION 系统权限
【语法1】
GRANT 角色权限（角色）[,角色权限] TO 用户;
grant CREATE SESSION to book;

---给book用户select表scott.emp的对象权限
--未授权之前book用户查找scott.emp表
select * from scott.emp
【语法2】
GRANT 操作 ON 模式.对象  TO 用户;
grant select on scott.emp to book;

update scott.emp set sal=10000 where empno=7369;


grant CREATE table to book;

--角色:一次性封装了很多权限

grant resource,connect to book

--查看当前用户的所有角色
select*from user_role_privs;

select * from scott.emp

--回收对象权限
revoke select on scott.emp from book
--回收角色
revoke resource,connect from book
revoke CREATE SESSION from book;


---DDL
--CHECK约束
create table t_student(
s_id number(8) PRIMARY KEY,
s_name varchar2(20) not null,
s_sex varchar2(8),
clsid number(8),
constraint u_1 unique(s_name),
constraint c_1 check(s_sex in('男','女'))
);

select * from t_student;

SELECT ROWID,t.* FROM t_student t;

select rownum,e.* from emp e;

--查询工资最高的三位员工
第一页
select rownum,t.* from (select * from emp order by sal desc) t where rownum<=3;

--分页
第二页
select rownum,t.* from (select * from emp order by sal desc) t where rownum>3 and rownum<=6;

select rownum,emp.* from emp 
--第一页 
select rownum,emp.* from emp where rownum<=3

--查询rownum>3的记录,rownum不可以使用>号
select rownum,emp.* from emp where rownum>3

--
--每页3条:第1页
select t.* from (select rownum rowno,e.* from emp e where rownum<=3) t where rowno>0;

--每页3条:第2页
select t.* from (select rownum rowno,e.* from emp e where rownum<=6) t where rowno>3;


--每页3条:第3页
select t.* from (select rownum rowno,e.* from emp e where rownum<=9) t where rowno>6;

--每页3条:第4页
select * from (select rownum rowno,e.* from emp e where rownum<=12) where rowno>9;

--分页的通用公式
--pagesize,pageno
select * from (select rownum rowno,e.* from emp e where rownum<=(pagesize*pageno))  where rowno>(pageno-1)*pagesize;



--每页5条:第1页
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 5) 

 WHERE rowno > 0;
--每页五条:第2页
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 10)

 WHERE rowno > 5;
 
 --每页五条:第3页
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 15)

 WHERE rowno > 10;

--每页5条:第1页,按工资降序排序
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM (select * from emp order by sal desc) e

         WHERE ROWNUM <= 5)

 WHERE rowno > 0;
 
 --每页5条:第2页,按工资降序排序
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM (select * from emp order by sal desc) e

         WHERE ROWNUM <= 10)

 WHERE rowno > 5;
 
 --有排序的分页的通用公式
--pagesize,pageno
select * from (select rownum rowno,e.* from (select * from emp order by sal desc) e where rownum<=(pagesize*pageno))  where rowno>(pageno-1)*pagesize;

--自增长
--序列
Create sequence seq_test
Increment by 1
Start with 1
Maxvalue 1000
nocycle;

--使用序列
select seq_test.nextval from dual

create sequence seq_test2
incrementby-1
startwith5
maxvalue5
minvalue1
nocycle;

select * from T_student

insert into T_STUDENT values(seq_test.nextval,'aaa','男','201701');
insert into T_STUDENT values(seq_test.nextval,'bbb','女','201701');
insert into T_STUDENT values(seq_test.nextval,'ccc','女','201701');
select seq_test.nextval from dual
insert into T_STUDENT values(seq_test.nextval,'ddd','女','201701');
