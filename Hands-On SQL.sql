create database Movie_Ratings;
use Movie_Ratings;


sp_help Movie;
sp_help Rating;
sp_help Reviewer;



Create Table Movie (mID int not null, 
					title varchar(30), 
					released_Year int , 
					director varchar(50));


Create Table Reviewer(rID int not null,
						name varchar(50) );


Create Table Rating (rID int ,
					mID int ,
					stars int not null,
					rating_Date date not null 
					FOREIGN KEY (mID) references Movie(mID),
					FOREIGN KEY (rID) REFERENCES Reviewer(rID));


--Task 1
--1

Alter table Movie 
add constraint PK_Movie Primary key (mID);

--2

Alter table Reviewer 
add constraint PK_Reviewer Primary key (rID);

--3
Alter table Reviewer alter column name varchar(50) not null;

--4
Alter table Rating alter column stars varchar(50) not null;


--5

Alter Table Movie
Add Constraint chk_date 
Check( released_Year >= 1900);

--6
Alter table Rating 
add Constraint chk_rating 
Check(stars>0 AND stars<6);

--7

Alter Table Rating
Add Constraint chk_rls_date 
Check( rating_Date >= '2000-01-01');



insert into Movie values(1, 'abc', 2021, 'xyz');
insert into Movie values(2, 'esd', 2010, 'qpr');
insert into Movie values(4, 'vdsa', 2020, 'xyz');

select * from Movie;

insert into Reviewer values(21, 'Rakesh');
insert into Reviewer values(22, 'Manoj');

select * from Reviewer;

insert into Rating values(21, 1, 4,'2021');
insert into Rating values(21, 2, 5,'2020');
insert into Rating values(22, 1, 3,'2021');

select * from Rating;

drop table Rating;
drop table Reviewer;
drop table Movie;

