DESC you;
--查询表中所有数据SELECT*FROM 表名;
SELECT*FROM you;
SELECT*FROM stu;
--插入操作 INSERT
--向表you中插入信息
--INSERT INTO 表名(列名1。。。) VALUES(列值1。。。);
INSERT INTO you(my1,my2,my3,my4,my5,my6,my7,my8,my9)
VALUES(1,'me','i am',20.55,'what a you doing?','10:10:10','1999-10-11','1999-10-10 10:10:10','ewadadsad'); 
--查看数据库编码的具体信息
SHOW VARIABLES LIKE 'character%';
--临时更改客户端和服务器结果集的编码
SET character_set_client = utf8;
SET character_set_results = gbk;
--修改操作 UPDATE
--将my1的内容全部修改成10
UPDATE you SET my1 = 10;
--将my1 =10的my5改成什么鬼
UPDATE you SET my5='什么鬼' WHERE my1 =10;
--将my1 = 10的my3 my5 修改成以下内容
UPDATE you SET my5='honey wenjiejie',my3 = 18.0 WHERE my1 =10;
--将my3 = 18.0的my1在基础上增加20
UPDATE you SET my1 = my1+20 WHERE my3 = 18.0;
--删除操作 DELETE 
--DELETE 表名 WHERE 列名=值
--删除my1为1的一行记录
DELETE FROM you WHERE my1 =1;
--删除you中所有的记录
DELETE FROM you;
--使用TRUNCATE删除表中记录
TRUNCATE FROM you;
--DELETE 删除表中的数据，表结构还在;删除后的数据可以找回
--TRUNCATE 删除是把表直接DROP掉，然后再创建一个同样的新表。
--删除的数据不能找回。执行速度比DELETE快。