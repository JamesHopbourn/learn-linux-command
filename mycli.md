#### service start
```
brew services start mysql@5.7
```
#### mysql python
```
mycli -h localhost -u root
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| TESTDB             |
| james              |
| mysql              |
| performance_schema |
+--------------------+
5 rows in set (0.00 sec)

mysql> use TESTDB;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
 mysql> CREATE TABLE `EMPLOYEE` (
  `FIRST_NAME` char(20) NOT NULL,
  `LAST_NAME` char(20) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `INCOME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

mysql>  CREATE TABLE `schoolCard` (
  `card_code` text,
  `user_id` text,
  `group_name` text, 
  `name` text,
  `user_num` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ptzl` (
  `序号` text,
  `姓名` text,
  `性别` text,
  `证件号` text,
  `报名确认点` text,
  `考生号` text,
  `户口所在地` text,
  `收件人` text,
  `邮编` text,
  `报考科类` text,
  `报考语种` text,
  `就读中学` text,
  `就读班级` text,
  `座位号` text,
  `民族` text,
  `毕业中学` text,
  `毕业年份` text,
  `政治面貌` text,
  `考生类别` text,
  `自定义流水号` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

mysql> select * from EMPLOYEE;
+------------+-----------+------+------+--------+
| FIRST_NAME | LAST_NAME | AGE  | SEX  | INCOME |
+------------+-----------+------+------+--------+
| Mac        | Mohan     |   40 | M    |   2000 |
| Mac        | Mohan     |   20 | M    |   2000 |
+------------+-----------+------+------+--------+
2 rows in set (0.01 sec) 
``` 
#### 表格查询
``` mysql> show columns from schoolCard;
+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| card_code  | text | YES  |     | NULL    |       |
| user_id    | text | YES  |     | NULL    |       |
| group_name | text | YES  |     | NULL    |       |
| name       | text | YES  |     | NULL    |       |
| user_num   | text | YES  |     | NULL    |       |
+------------+------+------+-----+---------+-------+
5 rows in set (0.03 sec)

mysql> describe schoolCard;
+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| card_code  | text | YES  |     | NULL    |       |
| user_id    | text | YES  |     | NULL    |       |
| group_name | text | YES  |     | NULL    |       |
| name       | text | YES  |     | NULL    |       |
| user_num   | text | YES  |     | NULL    |       |
+------------+------+------+-----+---------+-------+
5 rows in set (0.02 sec)
```

#### 表格字段查询
```
mysql> show tables schoolCard;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'schoolCard' at line 1
mysql> show full columns from schoolCard;
+------------+------+--------------------+------+-----+---------+-------+---------------------------------+---------+
| Field      | Type | Collation          | Null | Key | Default | Extra | Privileges                      | Comment |
+------------+------+--------------------+------+-----+---------+-------+---------------------------------+---------+
| card_code  | text | utf8mb4_general_ci | YES  |     | NULL    |       | select,insert,update,references |         |
| user_id    | text | utf8mb4_general_ci | YES  |     | NULL    |       | select,insert,update,references |         |
| group_name | text | utf8mb4_general_ci | YES  |     | NULL    |       | select,insert,update,references |         |
| name       | text | utf8mb4_general_ci | YES  |     | NULL    |       | select,insert,update,references |         |
| user_num   | text | utf8_general_ci    | YES  |     | NULL    |       | select,insert,update,references |         |
+------------+------+--------------------+------+-----+---------+-------+---------------------------------+---------+
5 rows in set (0.03 sec) 
``` 
#### 表格查询
```
 select * from `schoolCard` where name like '黄XX'

select * from `schoolCard` where name like '黄%'

select * from `schoolCard` where user_num like 'G%' 
```

#### 更新记录
```
update `schoolCard` set user_num = '21' WHERE name='胡XX'

update `schoolCard` set user_id = '6666' where name = '蔡XX' 
update `schoolCard` set user_num = '21616250063' WHERE name='胡XX' 
```  
#### 删除记录
```
delete from `schoolCard` where name='张XX'
```
#### 删除列
``` 
查看列：desc 表名;
  修改表名：alter table t_book rename to bbb;
  添加列：alter table 表名 add column 列名 varchar(30);
  删除列：alter table 表名 drop column 列名;
  修改列名MySQL： alter table bbb change nnnnn hh int;
  修改列名SQLServer：exec sp_rename't_student.name','nn','column';
  修改列名Oracle：lter table bbb rename column nnnnn to hh int;
  修改列属性：alter table t_book modify name varchar(22); 
``` 
#### 插入数据
``` 
insert into `schoolCard` (group_name,card_code) values ('测试组','0000000001') select * from `schoolCard` where card_code='0000000001'
+------------+---------+------------+--------+----------+
| card_code  | user_id | group_name | name   | user_num |
+------------+---------+------------+--------+----------+
| 0000000001 | <null>  | 测试组     | <null> | <null>   |
+------------+---------+------------+--------+----------+

insert into users values('1','James','iloveyou');
``` 
#### 联合查询
```
select * from `schoolCard` where name='XX'
+------------+---------+----------------+------+-------------+
| card_code  | user_id | group_name     | name | user_num    |
+------------+---------+----------------+------+-------------+
| 0153563467 | 4894    | 2016级（高中） | XX | 31616600491 |
| 3874370874 | 5150    | 2016级（高中） | XX | 31616600181 |
| 3548238659 | 5815    | 2017级（高中） | XX | 31716600520 |
+------------+---------+----------------+------+-------------+

select * from `schoolCard` where name='XX' and group_name like '2016级%'
+------------+---------+----------------+------+-------------+
| card_code  | user_id | group_name     | name | user_num    |
+------------+---------+----------------+------+-------------+
| 0153563467 | 4894    | 2016级（高中） | XX | 31616600491 |
| 3874370874 | 5150    | 2016级（高中） | XX | 31616600181 |
+------------+---------+----------------+------+-------------+

select * from `schoolCard` where name='XX' or card_code='0000000001'
+------------+---------+----------------+--------+-------------+
| card_code  | user_id | group_name     | name   | user_num    |
+------------+---------+----------------+--------+-------------+
| 0153563467 | 4894    | 2016级（高中） | XX   | 31616600491 |
| 3874370874 | 5150    | 2016级（高中） | XX   | 31616600181 |
| 3548238659 | 5815    | 2017级（高中） | XX   | 31716600520 |
| 0000000001 | <null>  | 测试组         | <null> | <null>      |
+------------+---------+----------------+--------+-------------+
``` 
