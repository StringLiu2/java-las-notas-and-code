--创建
CREATE DATABASE mydb1;
CREATE DATABASE mydb2 CHARACTER SET gbk;
CREATE DATABASE mydb3 CHARACTER SET gbk COLLATE gbk_chinese_ci;
			
--查询
--查看当前数据库服务器中的所有数据库
SHOW DATABASES;
--查看前面创建的mydb2数据库的定义信息
SHOW  CREATE  DATABASE mydb2;
		
--修改
--查看服务器中的数据库，并把mydb2的字符集修改为utf8;
ALTER DATABASE mydb2 CHARACTER SET utf8;
--删除	
DROP DATABASE mydb3;
--其他：
--查看当前使用的数据库
SELECT DATABASE();
--切换数据库
USE mydb2;

USE my1;
--操作表数据
--创建表
CREATE TABLE my(
	my1 INT,
	my2 CHAR(10),
	my3 VARCHAR(100),
	my4 DOUBLE,
	my5 TEXT,
	my6 TIME,
	my7 DATE,
	my8 DATETIME,
	my9 BLOB,
	my10 TIMESTAMP
);
--总十种类型
--查看当前数据库的所有表
SHOW TABLES;
--查看my表的信息
DESC my;
--在表my中添加一个my11的列
ALTER TABLE my ADD my11 DOUBLE(10,3);
--修改表my中my11列的数据类型和长度
ALTER TABLE my MODIFY my11 TIMESTAMP;

DESC my;
--删除表my中my11列
ALTER TABLE my DROP my11;
--修改表my的名字成you
RENAME TABLE my TO you;
--查看表you的细节
SHOW CREATE TABLE you;
--修改表you的字符集编码成gbk
ALTER TABLE you CHARACTER SET gbk;
--给表you中的列my10改名成my10name 并修改类型
ALTER TABLE you CHANGE my10 my10name TIMESTAMP;

CREATE TABLE youu(
	c INT
);
--删除表youu
DROP TABLE youu;
