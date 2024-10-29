create database Bank_Enterprise;
use Bank_Enterprise;

create table Branch(
Branch_name varchar(255) Primary Key,
Branch_city varchar(255), 
Assets real
);

create table Bank_Account( 
Acc_no int primary key, 
Branch_name varchar(255),
Balance real,
foreign key (Branch_name) references Branch(Branch_name)
);

create table Bank_Customer(
Customer_name varchar(255) primary key,
Customer_street varchar(255),
Customer_City varchar(255)
);

create table Depositer(
Customer_name varchar(255),
Acc_no int,
foreign key (Customer_name) references Bank_Customer(Customer_name),
foreign key (Acc_no) references Bank_Account(Acc_no)
);

create Table Loan(
Loan_number int,
Branch_name varchar(255),
Amount real,                              -- Adding constraints to foreign key so that when parent row is deleted its also deleted.
Constraint loan_ibfk_1 foreign key (Branch_name) references Bank_Account(Branch_name) on delete cascade
);

insert into Branch values
("SBI_Chamerajpet","Bangalore",50000),
("SBI_ResidencyRoad","Bangalore",10000),
("SBI_ShivajiRoad","Bombay",20000),
("SBI_ParliamentRoad","Delhi",10000),
("SBI_JantarMantar","Delhi",20000);

insert into Bank_Account values
(1,"SBI_Chamerajpet",2000),
(2,"SBI_ResidencyRoad",5000),
(3,"SBI_ShivajiRoad",6000),
(4,"SBI_ParliamentRoad",9000),
(5,"SBI_JantarMantar",8000),
(6,"SBI_ShivajiRoad",4000),
(8,"SBI_ResidencyRoad",4000),
(9,"SBI_ParliamentRoad",3000),
(10,"SBI_ResidencyRoad",5000),
(11,"SBI_JantarMantar",2000);

insert into Bank_Customer values
("Avinash","Bull_Temple_Road","Banglore"),
("Dinesh","Banergatta_Road","Bangalore"),
("Mohan","National_college_Road","Bangalore"),
("Nikil","Akbar_Road","Delhi"),
("Ravi","Prithviraj_Road","Delhi");

insert into Depositer values
("Avinash",1),
("Dinesh",2),
("Nikil",4),
("Ravi",5),
("Avinash",8),
("Nikil",9),
("Dinesh",10),
("Nikil",11);

insert into Loan values
(1,"SBI_Chamerajpet",1000),
(2,"SBI_ResidencyRoad",2000),
(3,"SBI_ShivajiRoad",3000),
(4,"SBI_ParliamentRoad",4000),
(5,"SBI_JantarMantar",5000);

-- -->Find all the customers who have at leat two deposits at the same branch. Eg: SBI_ResidencyRoad
select D.Customer_name from Depositer D where
 D.Acc_no in (select B.Acc_no from Bank_Account B where B.Branch_name = "SBI_ResidencyRoad") group by Customer_name
 having Count(D.Customer_name)>1 ;

-- -->Find all the customers who have an account at all braches located in specific City . Eg: Delhi
select D.Customer_name From Depositer D where D.Acc_no in
(select Ba.acc_no from Bank_account Ba where Ba.Branch_name in 
(select B.Branch_name from Branch B where Branch_city = "Delhi")) Group by Customer_name;

-- -->Demonstrate how you delete all account tuples at every branch located in a specific city. Eg: Bombay
Delete from Bank_account where Acc_no in (select ba.Acc_no from Bank_account Ba where Ba.Branch_name in 
(select B.Branch_name from Branch B where Branch_city = "Bombay"));

-- --> update the balance of all accounts by 5%.
Update Bank_account set balance = balance + balance *0.05;
select balance from Bank_account;
