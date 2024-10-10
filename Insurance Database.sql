create database Insurance;
use Insurance;

create table Person(
	driver_id varchar(255) primary key ,
    Name varchar(255),
    Address varchar(255)
    );

create table Car(
	reg_num varchar(255) primary key,
    Model varchar(255),
    Year year
);

create table Owns(
	driver_id varchar(255),
    reg_num varchar(255),
    foreign key (driver_id) references Person(driver_id),
    foreign key (reg_num) references Car(reg_num)
);

create table Accident(
	report_num int(5) primary key,
    accident_date date,
    location varchar(255)
);

create table Participated(
	driver_id varchar(255),
    reg_num varchar(255),
    report_num int(5),
    damage_amount decimal(10,2),
    foreign key (driver_id) references Person(driver_id),
    foreign key (reg_num) references Car(reg_num),
    foreign key (report_num) references Accident(report_num)
);

desc person;
desc Owns;
desc Car;
desc Accident;
desc participated;

insert into Person(driver_id, Name , Address) values
("A01","Richard","Srinivas Nagar"),
("A02" , "Pradeep", "Rajaji Nagar"),
("A03", "Smith","Ashok Nagar"),
("A04","Venu","N R Colony"),
("A05","Jhon","Hanumanth Nagar");

select * from Person;

insert into Car(reg_num,model,year) values
("KA052250","Indica",1990),
("KA031181","Lancer",1957),
("KA095477","Toyota",1998),
("KA053408","Honda",2008),
("KA041702","Audi",2005);

insert into Owns(driver_id,reg_num) values
("A01","KA052250"),
("A02","KA053408"),
("A03","KA031181"),
("A04","KA095477"),
("A05","KA041702");

insert into Accident values
(11,'2003-01-01',"Mysore Road"),
(12,'2004-02-02',"South End Circle"),
(13,'2003-01-21',"Bull Temple Road"),
(14,'2008-02-17',"Mysore Road"),
(15,'2005-03-04',"Kanakpura Road");

insert into participated(driver_id,reg_num,report_num,damage_amount)values
("A01","KA052250",11,10000),
("A02","KA053408",12,50000),
("A03","KA031181",13,25000),
("A04","KA095477",14,3000),
("A05","KA041702",15,5000);

-- -->Display Accident date and Location

select accident_date, location from Accident;

-- -->Display Driver id who did accident with amount greater than or equal to 25000

select driver_id from participated where damage_amount >= 25000;


