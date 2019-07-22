--������ռ�
CREATE TABLESPACE lifeng_ts
DATAFILE 'c:\oracle_data\lifeng.dbf' SIZE 10M
AUTOEXTEND ON next 1M;

--�޸ı�ռ�
ALTER TABLESPACE lifeng_ts
ADD DATAFILE 'c:\oracle_data\lifeng2.DBF' SIZE 5M
AUTOEXTEND ON;

--�鿴��ռ�
SELECT file_name,tablespace_name,bytes,autoextensible 
FROM dba_data_files
WHERE tablespace_name='LIFENG_TS';


--ɾ����ռ�,ͬʱɾ�������ļ�
DROP TABLESPACE lifeng_ts INCLUDING CONTENTS AND DATAFILES;
--6.2.1	��ѯϵͳ�û�
select * from all_users;


--�����û�
�﷨: CREATE USER �û��� IDENTIFIED BY ����
   DEFAULT TABLESPACE ��ռ�;
   
   create user book identified by 123
   default tablespace lifeng_ts

   
--�޸��û�
���﷨��
ALTER USER �û��� identified by ����
alter user book identified by 123456


--ɾ���û�  ���﷨��
DROP USER �û��� CASCADE;

��ʾ����
DROP USER book CASCADE;
DROP USER book2 CASCADE;


  --����
  ALTER USER book2 ACCOUNT UNLOCK;

--Ȩ�޹���
--�鿴��ǰ�û���ϵͳȨ��
Select * from user_sys_privs;


--�鿴��ǰ�û��Ķ���Ȩ��
select*from user_tab_privs;

--��book�û�CREATE SESSION ϵͳȨ��
���﷨1��
GRANT ��ɫȨ�ޣ���ɫ��[,��ɫȨ��] TO �û�;
grant CREATE SESSION to book;

---��book�û�select��scott.emp�Ķ���Ȩ��
--δ��Ȩ֮ǰbook�û�����scott.emp��
select * from scott.emp
���﷨2��
GRANT ���� ON ģʽ.����  TO �û�;
grant select on scott.emp to book;

update scott.emp set sal=10000 where empno=7369;


grant CREATE table to book;

--��ɫ:һ���Է�װ�˺ܶ�Ȩ��

grant resource,connect to book

--�鿴��ǰ�û������н�ɫ
select*from user_role_privs;

select * from scott.emp

--���ն���Ȩ��
revoke select on scott.emp from book
--���ս�ɫ
revoke resource,connect from book
revoke CREATE SESSION from book;


---DDL
--CHECKԼ��
create table t_student(
s_id number(8) PRIMARY KEY,
s_name varchar2(20) not null,
s_sex varchar2(8),
clsid number(8),
constraint u_1 unique(s_name),
constraint c_1 check(s_sex in('��','Ů'))
);

select * from t_student;

SELECT ROWID,t.* FROM t_student t;

select rownum,e.* from emp e;

--��ѯ������ߵ���λԱ��
��һҳ
select rownum,t.* from (select * from emp order by sal desc) t where rownum<=3;

--��ҳ
�ڶ�ҳ
select rownum,t.* from (select * from emp order by sal desc) t where rownum>3 and rownum<=6;

select rownum,emp.* from emp 
--��һҳ 
select rownum,emp.* from emp where rownum<=3

--��ѯrownum>3�ļ�¼,rownum������ʹ��>��
select rownum,emp.* from emp where rownum>3

--
--ÿҳ3��:��1ҳ
select t.* from (select rownum rowno,e.* from emp e where rownum<=3) t where rowno>0;

--ÿҳ3��:��2ҳ
select t.* from (select rownum rowno,e.* from emp e where rownum<=6) t where rowno>3;


--ÿҳ3��:��3ҳ
select t.* from (select rownum rowno,e.* from emp e where rownum<=9) t where rowno>6;

--ÿҳ3��:��4ҳ
select * from (select rownum rowno,e.* from emp e where rownum<=12) where rowno>9;

--��ҳ��ͨ�ù�ʽ
--pagesize,pageno
select * from (select rownum rowno,e.* from emp e where rownum<=(pagesize*pageno))  where rowno>(pageno-1)*pagesize;



--ÿҳ5��:��1ҳ
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 5) 

 WHERE rowno > 0;
--ÿҳ����:��2ҳ
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 10)

 WHERE rowno > 5;
 
 --ÿҳ����:��3ҳ
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM emp e

         WHERE ROWNUM <= 15)

 WHERE rowno > 10;

--ÿҳ5��:��1ҳ,�����ʽ�������
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM (select * from emp order by sal desc) e

         WHERE ROWNUM <= 5)

 WHERE rowno > 0;
 
 --ÿҳ5��:��2ҳ,�����ʽ�������
SELECT *

  FROM (SELECT ROWNUM rowno, e.*

          FROM (select * from emp order by sal desc) e

         WHERE ROWNUM <= 10)

 WHERE rowno > 5;
 
 --������ķ�ҳ��ͨ�ù�ʽ
--pagesize,pageno
select * from (select rownum rowno,e.* from (select * from emp order by sal desc) e where rownum<=(pagesize*pageno))  where rowno>(pageno-1)*pagesize;

--������
--����
Create sequence seq_test
Increment by 1
Start with 1
Maxvalue 1000
nocycle;

--ʹ������
select seq_test.nextval from dual

create sequence seq_test2
incrementby-1
startwith5
maxvalue5
minvalue1
nocycle;

select * from T_student

insert into T_STUDENT values(seq_test.nextval,'aaa','��','201701');
insert into T_STUDENT values(seq_test.nextval,'bbb','Ů','201701');
insert into T_STUDENT values(seq_test.nextval,'ccc','Ů','201701');
select seq_test.nextval from dual
insert into T_STUDENT values(seq_test.nextval,'ddd','Ů','201701');
