create database Employee;
use Employee;


create table Department(
	Dept_no int primary key,
    Dname varchar(255),
    Dloc varchar(255)
);
create table EmployeeData (
	Emp_No int primary key,
    Ename varchar(255),
    Mgr_no int,
    HireDate date,
    Sal decimal(2),
    Dept_no int,
    foreign key (Dept_no) references Department(Dept_no)
);

create table incentives (
	Emp_no int ,
    Incentive_date date,
    Incentive_amount decimal(2),
    foreign key (Emp_no) references EmployeeData(Emp_no)
);

create table Project (
	PNo int primary key,
    Ploc varchar(255),
    Pname varchar(255)
);

create table Assigned(
	Emp_no int,
    pno int,
    job_role Varchar(255),
    foreign key (Emp_no) references EmployeeData(Emp_no),
    foreign key (Pno) references Project(Pno)
);

insert into Department values
(1,"Human Resources", "Banglore"),
(2,"IT", "Banglore"),
(3,"Marketing","Mysore"),
(4, "Finance","Hyderabad");

insert into EmployeeData values
(101,"John Doe",105,'2020-06-15',80,1),
(102,"Jane Smith",106,'2018-03-23',85,2),
(103,"Alex Johnson",105, '2019-08-30',78,3),
(104,"Emily Davis",106,'2021-01-12',90,4),
(105,"Michael Brown",Null,'2017-11-10',95,1),
(106,"Jessica Taylor",null,'2016-07-19',92,2);

insert into Incentives values
(101,'2022-12-25',5),
(102,'2022-10-15',8),
(103,'2022-07-12',6),
(104,'2023-01-10',7),
(105,'2022-09-30',10);

insert into Project values
(201,'Banglore','HR system Upgrade'),
(202, 'Delhi','Cloud Migration'),
(203,'Mysore','Marketing Stratergy Revamp'),
(204, 'Hyderabad','Finacial Audit');

insert into Assigned values
(101,201,"HR Specialist"),
(102, 202, "Cloud Engineer"),
(103,203,"Marketing Coordinator"),
(104,204, "Finance Manager"),
(105, 201,"HR Manager"),
(106,202,"IT Manager");

-- -->Retrieve the employee numbers of all employees who work on project located in Bengaluru, Hyderabad, or Mysuru
select a.Emp_no from Assigned a where a.Pno in ( select p.pno from project p where ploc in ('banglore','hyderabad','Mysore'));
    
-- -->Get Employee ID’s of those employees who didn’t receive incentives
select e.Emp_no from EmployeeData e where e.Emp_no not in (select i.Emp_no from Incentives i);

-- -->Write a SQL query to find the employees name, number, dept, job_role, department location and project location who are working for 
-- a project location same as his/her department location.
Select 
    e.Emp_No, 
    e.Ename, 
    d.Dname AS Department, 
    a.job_role, 
    d.Dloc AS Department_Location, 
    p.Ploc AS Project_Location
FROM 
    EmployeeData e
JOIN 
    Department d ON e.Dept_no = d.Dept_no
JOIN 
    Assigned a ON e.Emp_No = a.Emp_no
JOIN 
    Project p ON a.Pno = p.PNo
WHERE 
    d.Dloc = p.Ploc;
