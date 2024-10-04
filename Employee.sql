create database firstdatabase;                          -- -> creating and using database
use firstdatabase;

create table Employee(
Emp_id int(10) primary key auto_increment,              -- -> Initialisation can be skipped 
First_name varchar(50) not null,
Last_name varchar (50) Unique,
Hire_date date,
Salary decimal(10,2) not null                           -- -> 10 is the number of digits and 2 is the decimal places(inclusive)
);

desc Employee; 								  # To view the Schema of Database

insert into Employee(First_name, Last_name, Hire_date,Salary)
values ("Nithesh","Naik","2005-03-22",156000), ("Sushanth", "Hebri", "2004-03-11",250000),
("Shreyansh","Kutdalkar","2004-03=18",170000);

select * from Employee;			  							             -- -> displays all the records of the table
select * from Employee where First_name = "Nithesh";     -- -> displays the records of Nithesh
select Salary from Employee;    							           -- -> displays the particular column mentioned

alter table Employee										                 -- -> adds a column Email which holds Only Unique value
add column Email varchar(255) unique;

update Employee												                   -- ->Fills column with the Email details
	set Email = case
    when First_name = 'Nithesh' then 'nitheshu944@gmail.com'
    when First_name = 'Sushanth' then 'sushanthhebri@gmail.com'
    when First_name = 'Shreyansh' then 'Shreyanshkutdalkar@gmail.com'
end 
where First_name in ('Nithesh','Sushanth','Shreyansh');

alter table Employee                                    -- ->To modify the data type of any column
Modify Salary decimal(10,0);

alter table Employee drop column Email;						      -- -> to drop the column Email
