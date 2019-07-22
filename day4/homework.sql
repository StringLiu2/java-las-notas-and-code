1.创建表空间TS_HR,查看表空间
--创建表空间TS_HR
create tablespace TS_HR
datafile 'c:/hrfile.dbf' size 10m
autoextend on next 1m;
--查看表空间TS_HR
select file_name,tablespace_name,bytes,autoextensible
from dba_data_files
where tablespace_name = 'TS_HR';


2.创建用户hr,使用上述表空间,数据文件为c:/hrfile.dbf,再查看系统用户
--创建用户hr
create user hr identified by 12345
default tablespace TS_HR;
--查看系统用户
select * from all_users;


3.给用户hr授resource与connect角色,查看其角色,用户hr新建表t_person,有id,pname,gender,age等列,id设置为主键,gender限制为男女,age只能是1-100之间,插入数据测试
--给用户hr授resource与connect角色
grant resource,connect to hr;
--查看当前用户的角色
select *from user_role_privs;
--新建表t_person
create table  t_person(
id number(8) primary key,
pname varchar2(20) not null,
gender varchar2(8),
age number(8),
constraint a_1 check(age>=1 and age<=100),
constraint c_1 check(gender in ('男','女'))
);
--测试
insert into t_person values(2,'aaa','男',44);
insert into t_person values(3,'bbb','男',22);
insert into t_person values(6,'ccc','女',15);
insert into t_person values(1,'ddd','男',32);


4.新建表t_student,有id,pname,gender,age等列,id设置为主键,gender限制为男女,age只能是1-100之间,插入数据测试,创建序列,实现id自增长
--新建表t_student
create table  t_student(
id number(8) primary key,
pname varchar2(20) not null,
gender varchar2(8),
age number(8),
constraint a_1 check(age>=1 and age<=100),
constraint c_1 check(s_sex in ('男','女'))
);
--创建序列
create sequence seq_test
increment by 1
start with 1
maxvalue 1000
nocycle;
--实现id自增长
select seq_test.nextval from dual;
--测试
insert into T_STUDENT values(seq_test.nextval,'aaa','男',44);
insert into T_STUDENT values(seq_test.nextval,'bbb','男',22);
insert into T_STUDENT values(seq_test.nextval,'ccc','女',15);
insert into T_STUDENT values(seq_test.nextval,'ddd','男',32);
insert into T_STUDENT values(seq_test.nextval,'eee','男',54);
insert into T_STUDENT values(seq_test.nextval,'fff','男',21);
insert into T_STUDENT values(seq_test.nextval,'ggg','女',16);
insert into T_STUDENT values(seq_test.nextval,'hhh','男',44);
insert into T_STUDENT values(seq_test.nextval,'iii','男',41);
insert into T_STUDENT values(seq_test.nextval,'jjj','男',75);
insert into T_STUDENT values(seq_test.nextval,'kkk','女',88);
insert into T_STUDENT values(seq_test.nextval,'lll','男',99);
insert into T_STUDENT values(seq_test.nextval,'nnn','男',1);
insert into T_STUDENT values(seq_test.nextval,'mmm','男',2);
insert into T_STUDENT values(seq_test.nextval,'zzz','女',100);
insert into T_STUDENT values(seq_test.nextval,'xxx','男',32);


5.上述表插入15条以上的数据,--查询年龄最大的三位员工

select rownum，t.* from (select * from t_student order by age desc) t where rownum<=3;


6上表然后按年龄升序进行分页,输出第3页,第3页

select t.*from(select rownum rowno,e.* from (select * from t_student order by age asc) e where rownum<=12) t where rowno>8;
