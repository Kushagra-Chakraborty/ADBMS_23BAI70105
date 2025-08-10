/*
Exp-2 joins implementation
Minimum number of tables reqired to use join : 1 (self join)
Atleast 1 column in common:
	- they must have same values
Types:
	-Inner
		- (common data)
	-Outer (left and right)
		- (Left/right whole table with command data)
	-Full outer
		- (left + right + common data)
	-self (special join)
		- 
	-right/elft exclusive
*/
use DB_DEMO
--Inner join
SELECT* FROM AUTHOR
select* from book
select* from AUTHOR as A 
inner join 
book as b on
b.BOOK_ID = A.AUTH_ID

--Outer join
SELECT* FROM AUTHOR
select* from book
select* from AUTHOR as A 
left outer join 
book as b on
b.BOOK_ID = A.AUTH_ID

--Employee problem
create table Employee 
(EMP_ID int PRIMARY KEY, ENAME char(10), DEPT varchar(10), Manager_ID int)

--Constraint syntax
Alter table Employee add constraint FK_EMPLOYEE foreign key (Manager_ID) references Employee (EMP_ID)

insert into Employee (EMP_ID, ENAME, DEPT, Manager_ID) values
(1,'Nanu','HR',NULL),
(2,'Ash','IT',1),
(3,'Sam','Fin',1),
(4,'greg','IT',2),
(5,'abc','Fin',3);

select* from Employee

--NPV question

CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

--solution
select Q.ID, Q.YEAR, ISNULL(Y.NPV,0)
from Queries as Q
left outer join
Year_tbl as Y on
Q.ID = Y.ID
and 
Q.YEAR = Y.YEAR

--NEXT SESSION ON SUBQUERIES
-- the pdf must have:
	--problem statement : (E/M)
	-- output + screenshots