# 数据库设计

## 用户表 user

| 字段       | 属性                                | 备注  |
|----------|-----------------------------------|-----|
| id       | integer primary key autoincrement |     |
| username | text                              | 用户名 |
| password | text                              | 密码  |
| role     | text                              | 身分组 |

## ~~学院表~~

| 字段           | 属性                                | 备注  |
|--------------|-----------------------------------|-----|
| faculty_id   | integer primary key autoincrement |     |
| faculty_name | text                              | 学院名 |

## 学生表

| 字段               | 属性              | 备注   |
|------------------|-----------------|------|
| student_id       | int primary key | 学号   |
| student_name     | text            | 学生姓名 |
| student_gender   | text            | 学生性别 |
| student_birthday | text            | 学生生日 |
| student_register | text            | 入学时间 |
| student_belong   | int             | 所属学院 |

## 教师表

| 字段                | 属性              | 备注   |
|-------------------|-----------------|------|
| teacher_id        | int primary key | 工号   |
| teacher_name      | text            | 教师姓名 |
| teacher_gender    | text            | 教师性别 |
| teacher_birthday  | text            | 教师生日 |
| teacher_education | text            | 教师学历 |
| teacher_rank      | text            | 教师职称 |
| teacher_register  | text            | 入职日期 |
| teacher_belong    | int             | 所属学院 |

## 课程表

| 字段             | 属性              | 备注     |
|----------------|-----------------|--------|
| course_id      | int primary key | 课程id   |
| course_name    | text            | 课程名    |
| course_date    | text            | 上课时间   |
| course_address | text            | 上课地点   |
| course_times   | int             | 周数     |
| course_type    | int             | 课程类型   |
| course_point   | int             | 学分     |
| teacher_id     | int             | 授课老师编号 |
| course_belong  | int             | 所属院系   |

## 成绩表

| 字段         | 属性              | 备注   |
|------------|-----------------|------|
| id         | int primary key |      |
| course_id  | int             | 课程id |
| student_id | int             | 学生id |
| score      | int             | 成绩   |

---

# 需求

## admin (crud)

1. 课程管理
2. 学生管理
3. 教师管理
4. 账号密码重置
5. 修改密码
6. 退出系统

## 教师

1. 我的课程 -> 学生名单 -> 打分
2. 修改密码
3. 退出系统

## 学生

1. 所有课程
2. 已选课程
3. 已修课程
4. 修改密码
5. 退出系统

---

# 接口

