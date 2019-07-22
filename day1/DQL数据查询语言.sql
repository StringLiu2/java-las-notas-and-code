--数据库执行DQL语句不会对数据进行改变，而是让数据库发送结果集给客户端。
--查询返回的结果集是一张虚拟表
--查询关键字 SELECT 
--SELECT 列名 FROM 表名
--【WHERE --> GROUP BY -->HAVING--> ORDER BY】
--查询表you中的my1的信息
SELECT my1 FROM you;
--GROUP BY grouping_columns /*对结果分组*/
--HAVING CONDITION /*分组后的行条件*/
--ORDER BY sorting_columns /*对结果分组*/
--LIMIT offset_start, ROW_COUNT /*结果限定*/
--学生表stu
CREATE TABLE stu (
	sid	CHAR(6),
	sname		VARCHAR(50),
	age		INT,
	gender	VARCHAR(50)
);
INSERT INTO stu VALUES('S_1001', 'liuYi', 35, 'male');
INSERT INTO stu VALUES('S_1002', 'chenEr', 15, 'female');
INSERT INTO stu VALUES('S_1003', 'zhangSan', 95, 'male');
INSERT INTO stu VALUES('S_1004', 'liSi', 65, 'female');
INSERT INTO stu VALUES('S_1005', 'wangWu', 55, 'male');
INSERT INTO stu VALUES('S_1006', 'zhaoLiu', 75, 'female');
INSERT INTO stu VALUES('S_1007', 'sunQi', 25, 'male');
INSERT INTO stu VALUES('S_1008', 'zhouBa', 45, 'female');
INSERT INTO stu VALUES('S_1009', 'wuJiu', 85, 'male');
INSERT INTO stu VALUES('S_1010', 'zhengShi', 5, 'female');
INSERT INTO stu VALUES('S_1011', 'xxx', NULL, NULL);