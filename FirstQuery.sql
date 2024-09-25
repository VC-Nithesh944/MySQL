use firstdatabase;

create table student( Student_id int , student_name varchar(20), dob date, admitted date, fees int(5), gender char);
desc student;
insert into student( Student_id , student_name , dob, admitted , fees , gender) values (218, "Nithesh", '2005-03-22', '2023-10-10', 96084, "M" );
insert into student(Student_id, student_name,dob, admitted , fees, gender) values (200, "Namish", "2010-11-28", "2023-10-10", 32648, "M");

alter table student add column Phone_number varchar(10);
select * from student;

update student set Phone_number = '9901944364' where student_name = "Nithesh";
update student set Phone_number = "9449947556" where student_name = "Namish";

alter table student rename column Phone_number to Student_number ;

alter table student add column Marks int(2);

alter table student drop column Marks;
select * from student;