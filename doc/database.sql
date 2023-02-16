-- 用户表
create table user
(
    id       integer primary key autoincrement,
    username text unique,
    password text,
    role     int check (role in (1, 2, 999))
);
-- 学院表
create table academy
(
    academy_id   integer primary key autoincrement,
    academy_name text
);
-- 学生表
create table student
(
    student_id       int primary key,
    student_name     text,
    student_gender   text check (student_gender in ('男', '女')),
    student_birthday text,
    student_register text,
    student_belong   int
);
-- 教师表
create table teacher
(
    teacher_id        int primary key,
    teacher_name      text,
    teacher_gender    text check (teacher_gender in ('男', '女')),
    teacher_birthday  text,
    teacher_education text,
    teacher_rank      text,
    teacher_register  text,
    teacher_belong    int
);
-- 课程表
create table course
(
    course_id      int primary key,
    course_name    text,
    course_date    text,
    course_address text,
    course_times   int,
    course_type    int check (course_type in (0, 1)),
    course_point   int,
    teacher_id     int,
    course_belong  int
);
-- 成绩表
create table score
(
    id         integer primary key autoincrement,
    course_id  int,
    student_id int,
    score int default ''
);