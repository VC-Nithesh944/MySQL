create database Store;
use Store;

create table Products ( Product_id int(4), Product_code char(3), Product_name varchar(20), Quantity int(10), Price int(10), primary key (Product_id)); 

desc Products;

insert into Products( Product_id, Product_code, Product_name, Quantity, Price) 
values (1001, "PEC","Pencil 2B", 2, 20), (1002,"PEC", "Pencil HB", 4, 40), (1003, "PEN", "Hauser OX", 4 , 40), (1004, "PEN" , "Octane", 3, 60);


alter table Products drop column Price;
alter table Products add column Amount int(5);
update Products
set Amount = case
	  when Product_id = 1001 then 20
    when Product_id = 1002 then 40
    when Product_id = 1003 then 20
    when Product_id = 1004 then 60
end
where Product_id in (1001, 1002, 1003, 1004);

alter table Products change Amount Price int(5);

select * from Products order by Product_id;
