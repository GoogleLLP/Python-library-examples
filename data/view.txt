use demo_db1;
create table t(quantity int, price int);
insert into t values (3, 50), (2, 100);

create view view_t as
    select quantity, price, quantity * price from t;

select * from view_t;

update t set price = 150 where quantity = 3;

-- 视图的列取别名-----------
create view view2(qty, price, total)
as select quantity, price, quantity * price from t;

select * from view2;
-- 多表创建视图------------
create table student (id int, name varchar(50));
insert into student values
(1, 'pyz'), (2, 'gaiqu'), (3, 'zxr');
create table student_info (id int, name varchar(30), grade varchar(40));
insert into student_info values
(1, 'tj', '1st'), (2, 'sz', '2nd'), (3, 'sh', '3rd');
create view stu_glass(id, name)
as
    select student.id, student.name from student, student_info where student.id = student_info.id;
insert into student_info values (4, 'asda', '4th');

select * from student;
select * from student_info;
select * from stu_glass;

-- 查看视图-----------------
desc stu_glass;
show create view stu_glass;
show create view view_t;
show table status like 'view_t';
show table status like 't';
select * from information_schema.VIEWS;

-- 修改视图-----------------
create or replace view view_t
as select * from t;

select * from t;

alter view demo_db1.view_t as
    select quantity from t;
select * from demo_db1.view_t;
