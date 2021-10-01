create database SQLHandsON;

use SQLHandsON;

--Creating table Salesman
create table Salesman (salesman_id numeric(5) primary key,
						name varchar(30),
						city varchar(15), 
						commission decimal(5,2));

--Creating Customer table
create table Customer(customer_id numeric(5) primary key,
						cust_name varchar(30),
						city varchar(15),
						grade numeric(3),
						salesman_id numeric(5) );
--Creating Orders table
create table Orders (order_no numeric(5) primary key,
						purch_amt decimal(8,2),
						order_date date,
						customer_id numeric(5) references Customer(customer_id),
						salesman_id numeric(5) references Salesman(salesman_id));


-- Inserting values into Customer table
insert into Customer values(3002, 'Nick Rimando','New York',100,5001);
insert into Customer values(3007, 'Brad Davis','New York',200,5001);
insert into Customer values(3005, 'Graham Zusi','Califonia',200,5002);
insert into Customer values(3008, 'Julian Green','London',300,5002);
insert into Customer values(3004, 'Fabian Johnson','Paris',300,5006);
insert into Customer values(3009, 'Geoff Cameron','Berlin',100,5003);
insert into Customer values(3003, 'Jozy Altidor','Moscow',200,5007);
insert into Customer(customer_id,cust_name,	city, salesman_id) values(3001, 'Brad Guzan','London',5005);


-- Inserting values into Salesman table
insert into Salesman Values(5001, 'James Hogg', 'New Yok', 0.15);
insert into Salesman Values(5002, 'Nail Knite', 'Paris', 0.13);
insert into Salesman Values(5005, 'Pit Alex', 'London', 0.11);
insert into Salesman Values(5006, 'Mc Lyon', 'Paris', 0.14);
insert into Salesman Values(5007, 'Paul Adam', 'Rome', 0.13);
insert into Salesman Values(5003, 'Lauson Hen', 'San Jose', 0.12);


-- Inserting values into Orders table
insert into Orders values (70001, 150.5, '2012-10-05', 3005, 5002);
insert into Orders values (70009, 270.65, '2012-09-10', 3001, 5005);
insert into Orders values (70002, 65.26, '2012-10-05', 3002, 5001);
insert into Orders values (70004, 110.5, '2012-08-17', 3009, 5003);
insert into Orders values (70007, 948.5, '2012-09-10', 3005, 5002);
insert into Orders values (70005, 2400.6, '2012-07-27', 3007, 5001);
insert into Orders values (70008, 5760, '2012-09-10', 3002, 5001);
insert into Orders values (70010, 1983.43, '2012-10-10', 3004, 5006);
insert into Orders values (70003, 2480.4, '2012-10-10', 3009, 5003);
insert into Orders values (70012, 250.45, '2012-06-27', 3008, 5002);
insert into Orders values (70011, 75.29, '2012-08-17', 3003, 5007);
insert into Orders values (70013, 3045.6, '2012-04-25', 3002, 5001);


-- 1. 
select * from Salesman;

-- 2.
select name, commission from Salesman;

-- 3.
select order_date, salesman_id, order_no, purch_amt from Orders;

-- 4.
select distinct(salesman_id) from Salesman;

-- 5.
select name, city from Salesman where city='Paris'

-- 6.
 select customer_id, cust_name,city,grade,salesman_id from Customer where grade=200;

-- 7.
select order_no, order_date, purch_amt from Orders where salesman_id = 5001; 

-- 8.
select customer_id, cust_name,city,grade,salesman_id  from Customer where grade > 100;

-- 9.
select customer_id, cust_name,city,grade,salesman_id from Customer where grade > 100 and city = 'New York';

-- 10.
select customer_id, cust_name,city,grade,salesman_id from Customer where grade > 100 or city = 'New York';

-- 11.
select customer_id, cust_name,city,grade,salesman_id from Customer where not grade > 100 and city = 'New York';

-- 12.
select customer_id, cust_name,city,grade,salesman_id from Customer where not grade > 100 and not city = 'New York';

-- 13.
select order_no, purch_amt,order_date,customer_id,salesman_id from Orders where not order_date = '2012-09-10' and not salesman_id > 5005 or not purch_amt > 1000;

-- 14
select salesman_id,name,city,commission from Salesman where commission between 0.10 and 0.12;

-- 15.
select sum(purch_amt) as 'Total purchase amount' from Orders; 

-- 16.
select avg(purch_amt) as 'Average purchase amount' from Orders;

-- 17.
select count(distinct(salesman_id)) as 'Unique salespeople' from Salesman;

-- 18.
select count(*) as 'Total customers' from Customer;

-- 19.
select count(grade) as 'Total customers' from Customer;

-- 20.
select max(purch_amt) as 'Maximum purchase amount' from Orders; 

-- 21.
select min(purch_amt) as 'Minimum purchase amount' from Orders; 

-- 22.
select customer_id,  order_date, max(purch_amt) as 'Max_amount' from Orders group by customer_id, order_date having max(purch_amt) > 2000;

-- 23.
select customer_id,  order_date, max(purch_amt) from Orders group by customer_id, order_date having max(purch_amt) >= 2000 and  max(purch_amt) <= 6000;

-- 24.
select customer_id,  order_date, max(purch_amt) from Orders group by customer_id, order_date having max(purch_amt) >= 2000 and  max(purch_amt) in (2000, 3000, 5760,6000);

-- 25.
select customer_id, max(purch_amt) as 'Max order' from Orders group by customer_id having customer_id>= 3002 and customer_id <= 3007;



create view ViewExp
as
select * from Salesman;



select * from Salesman;
select * from Customer;
select * from Orders;
