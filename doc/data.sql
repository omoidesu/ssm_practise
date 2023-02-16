insert into academy values (1, '计算机系');
insert into academy values (2, '数学系');
insert into academy values (3, '材料系');
insert into academy values (4, '电子信息系');
insert into academy values (5, '外语系');

insert into course values (2201, '数论', 'Monday', '8-201', 18, 1, 6, 1003, 2);
insert into course values (2302, '高等数学', 'Friday', '8-203', 18, 1, 6, 1001, 3);
insert into course values (2103, '英语', 'Tuesday', '6-105', 18, 1, 6, 1005, 1);
insert into course values (2404, '通信原理', 'Tuesday', '9-304', 16, 1, 4, 1007, 4);
insert into course values (2405, '信号与系统', 'Thursday', '9-501', 16, 1, 5, 1008, 4);
insert into course
values (2106, 'C语言程序设计', 'Wednesday', '5-106', 15, 0, 4, 1004, 1);
insert into course
values (2107, '数据结构与算法', 'Wednesday', '5-204', 16, 0, 5, 1002, 1);
insert into course
values (2208, '数学分析', 'Friday', '6-303', 15, 1, 6, 1006, 2);
insert into course
values (2509, '专业英语', 'Thursday', '6-204', 15, 1, 5, 1005, 5);
insert into course
values (2010, '日语(选修)', 'Monday', '6-103', 8, 0, 3, 1005, 3);
insert into course
values (2111, '操作系统', 'Thursday', '8-303', 10, 1, 4, 1002, 1);
insert into course
values (2112, 'python基础', 'Friday', '5-101', 8, 0, 2, 1004, 1);
insert into course
values (2413, 'matlab仿真', 'Monday', '9-202', 8, 0, 3, 1007, 4);

insert into score
values (1, 2201, 10005, 75);
insert into score
values (2, 2201, 10010, '');
insert into score
values (3, 2302, 10006, 60);
insert into score
values (4, 2103, 10002, 80);
insert into score
values (5, 2103, 10003, 61);
insert into score
values (6, 2103, 10007, '');
insert into score
values (7, 2103, 10009, '');
insert into score
values (8, 2106, 10002, '');
insert into score
values (9, 2106, 10003, '');
insert into score
values (10, 2106, 10007, '');
insert into score
values (11, 2106, 10009, '');
insert into score
values (12, 2107, 10002, '');
insert into score
values (13, 2107, 10003, '');
insert into score
values (14, 2107, 10007, '');
insert into score
values (15, 2107, 10009, '');
insert into score
values (16, 2112, 10002, '');
insert into score
values (17, 2112, 10003, '');
insert into score
values (18, 2112, 10007, '');
insert into score
values (19, 2112, 10009, '');
insert into score
values (20, 2404, 10001, 80);
insert into score
values (21, 2404, 10008, 71);
insert into score
values (22, 2405, 10001, 73);
insert into score
values (23, 2405, 10008, 59);

insert into student
values (10001, '谭之平', '男', '1995-04-23', '2014-09-01', 4);
insert into student
values (10002, '陈安成', '男', '2000-05-03', '2019-09-01', 1);
insert into student
values (10003, '张晓山', '男', '2000-04-09', '2019-09-01', 1);
insert into student
values (10004, '徐天珍', '女', '1996-02-17', '2016-09-01', 5);
insert into student
values (10005, '燕玉婷', '女', '1994-09-14', '2014-09-01', 2);
insert into student values (10006, '任少楠', '男', '1994-10-25', '2015-09-01', 3);
insert into student values (10007, '修奇', '男', '1999-11-01', '2017-09-01', 1);
insert into student values (10008, '徐秀艳', '女', '1998-12-16', '2018-09-01', 4);
insert into student values (10009, '黄茂华', '男', '1998-10-13', '2017-09-01', 1);
insert into student values (10010, '朱鹏鹏', '男', '1997-07-21', '2016-09-01', 2);

insert into teacher values (1001, '苏悦', '女', '1983-08-27', '硕士', '普通教师', '2013-04-20', 3);
insert into teacher values (1002, '董诗斌', '男', '1980-04-11', '专科', '助教', '2010-09-01', 1);
insert into teacher values (1003, '奚晓霞', '女', '1980-01-03', '硕士', '副教授', '2005-06-15', 2);
insert into teacher values (1004, '姜迅', '男', '1998-06-06', '本科', '普通教师', '2017-09-10', 1);
insert into teacher values (1005, '何元忠', '男', '1990-06-20', '博士', '教授', '2007-07-21', 5);
insert into teacher values (1006, '郑德钟', '男', '1974-07-23', '本科', '副教授', '1996-02-16', 2);
insert into teacher values (1007, '孙莉梅', '女', '1989-09-20', '硕士', '普通教师', '2004-08-31', 4);
insert into teacher values (1008, '李佩菁', '女', '1996-07-03', '硕士', '普通教师', '2014-04-26', 4);
insert into teacher values (1009, '严国安', '男', '1988-06-06', '博士', '副教授', '2003-01-01', 3);

insert into user values (1, 'admin', 'administrator', 999);
insert into user values (2, '1001', 'suyueyue', 2);
insert into user values (3, '1002', 'dongshizhang', 2);
insert into user values (4, '1003', 'xiyuting', 2);
insert into user values (5, '10001', 'zhangsan', 1);
insert into user values (6, '10002', 'lisi', 1);
insert into user values (7, '10003', 'wangwu', 1);
insert into user values (8, '10004', 'zhaoliu', 1);
