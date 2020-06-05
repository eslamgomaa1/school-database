create database school;
create table teachers
  (id    int,
   name    varchar(50),
   age  int,
   gender varchar(50),
  subject varchar(50),
  address varchar(50),
  phone varchar(50),
  level  varchar(50),
  primary key(id)
  );


create table subject
  (subject_name    varchar(50),
   level varchar(50),
   subject_id   int,
   primary key (subject_id)
  );


create table student
  (student_id    int,
   student_name   varchar(50),
   student_address   varchar(50),
   parent_email      varchar(50),
   parent_phone      int,
   primary key (student_id));


create table management
  (manger_id    int,
  manager_name   varchar(50),
  manager_position   varchar(50),
   address varchar(50),
   email   varchar(50),
   phone   int,
   primary key (manager_id));



#insert statements

insert into teachers values ( 1,'ahmed', 30,'male','math','alexandriaelmandara', 65627562,'from secoundlevel to six');
insert into teachers values (2, 'mai',28,'femal','arabic','mamoaraalex', 65888862,'from one to four');
insert into teachers values (3, 'mickel',43,'male','geography', 'cairo', 678687562,'from one to six');
insert into teachers values (4, 'ibrahem',39,'male','frensh','tanta', 68778862,'all level');
insert into teachers values (5, 'ali',50,'male', 'science','alx' , 78287282,'from four to five');
insert into teachers values (6, 'moaz',25,'male','religen','giza', 87827562,'all level');


insert into subject values ( 'math',1, 2);
insert into subject values ( 'arabic',2,3 );
insert into subject values ( 'science', 3,4);
insert into subject values ( 'religen',4,5);
insert into subject values ( 'frensh', 5,6);
insert into subject values ( 'geography', 6,7);

insert into student values ( 3, 'yasser','alex','ahmed2@yahoo.com',2123000);
insert into student values (4, 'ahmed','cairo',' mohamed5@yahoo.com',1025800);
insert into student values (5, 'noha', 'alex','ibraheem5@yahoo.com',1056970);
insert into student values (6,'aseel', 'alex', 'ali8@yahoo.com',6589710);
insert into student values (7, 'maria', 'alex','mina9@yahoo.com',2089720);


insert into management values ( 5,'ahmed', 'headmaster','alex','ahmedr2Qyahoo.com',26782782);
insert into management values (6, 'mohamed', 'pricible','alex','moham2@yahoo.com',817182782);
insert into management values (7, 'sara', 'agent','alex','sarad2@yahoo.com',287879782);


#Select Statements using Sub Query 

SELECT manager_name, manager_position FROM management WHERE manger_id=( select max(manger_id) from management);
SELECT student_id, student_address FROM student WHERE student_name=( select max(student_name) from student);
SELECT subject_id, subject_name FROM subject WHERE level=( select max(level) from subject);



#Select Statements using Count and Group Functions

SELECT COUNT(id), subject
FROM teachers
GROUP BY subject;

SELECT COUNT(student_id), student_address
FROM student
GROUP BY student_address;


SELECT COUNT(manger_id), manager_position
FROM management
GROUP BY manager_position;

SELECT COUNT(subject_id), level
FROM subject
GROUP BY level;


#Select Statements using Different Joins 

SELECT student.student_address, management.address
FROM student
inner JOIN management ON student.student_address = management.address;

SELECT student.student_address, management.address
FROM student
left outer JOIN management ON student.student_address = management.address;

SELECT student.student_id, management.manger_id
FROM student
right outer JOIN management ON student.student_id = management.manger_id;


SELECT student.parent_email, management.email
FROM student
CROSS JOIN management ON student.parent_email = management.email;

SELECT student.student_id, management.manger_id
FROM student
inner JOIN management ON student.student_id = management.manger_id;






#update statements

UPDATE teachers
SET name = 'Ahmed', age= 28
WHERE id = 4;

UPDATE subject
SET subject_name = 'math', level= 4
WHERE subject_id = 4;

UPDATE subject
SET subject_name = 'math', level= 6
WHERE subject_id = 5;


UPDATE management
SET manager_position = 'head master'
WHERE manger_id =5;

UPDATE management
SET manager_position = 'teacher'
WHERE manger_id =1;


#delete statements

DELETE FROM management WHERE manager_name='sara';
DELETE FROM student WHERE student_address='cairo';
DELETE FROM subject WHERE level=4;
DELETE FROM teachers WHERE name='ahmed';
DELETE FROM management WHERE manager_position='agent';











