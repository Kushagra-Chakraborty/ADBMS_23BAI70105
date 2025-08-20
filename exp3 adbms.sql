use DB_DEMO
/*
	EXP-3
	subqueries = nested queries
	Q1(Q2(Q3)) where Q is query

	MAIN OPERATORS:
		0. =:
		1. IN
		2. NOT IN
		3. ANY (checks lowerbound)
		4. ALL (checks upperbound)

	TYPES OF SUBQUERIES:
		1. SCALER SUBQUERY
			-> RETURNS ONLY ONE VALUE WHICH CAN BE INT OR VARCHER OR ANY 
				->OPERATORS USED WITH THIS : <,>,=<,>=, != (<>)
		2. MULTI_ROW SQ
			-> RETURNS MULTIPLE ROWS
				->OPERATORS: IN, NOT IN ,ANY(OR),ALL(AND)
		3. SELF_CONTAINED SQ 
			-> (Q1(Q2)) -> Q2 CAN BE RUN SEPARATELY
			-> WHICH HAS NO DEPENDENCY ON MAIN QUERY
		4. CO_RELATED SQ
			-> (Q1(Q2)) -> Q2 CANT BE RUN SEPARATELY
			-> INNER QUERYDEPENDANT ON OUTER QUERY

	
*/

select * from Employee
select * from Department
/*
	WRITE A QUERY WHICH TAKES
*/

CREATE TABLE MyEmployees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);


INSERT INTO MyEmployees (EmpName, Gender, Salary, City, Dept_id)
VALUES
('Amit', 'Male', 50000, 'Delhi', 2),
('Priya', 'Female', 60000, 'Mumbai', 1),
('Rajesh', 'Male', 45000, 'Agra', 3),
('Sneha', 'Female', 55000, 'Delhi', 4),
('Anil', 'Male', 52000, 'Agra', 2),
('Sunita', 'Female', 48000, 'Mumbai', 1),
('Vijay', 'Male', 47000, 'Agra', 3),
('Ritu', 'Female', 62000, 'Mumbai', 2),
('Alok', 'Male', 51000, 'Delhi', 1),
('Neha', 'Female', 53000, 'Agra', 4),
('Simran', 'Female', 33000, 'Agra', 3);


create table dept(
	id int unique not null, 
	Dept_Name varchar(20) not null
)

insert into dept values(1, 'Accounts');
insert into dept values(2, 'HR');
insert into dept values(3, 'Admin');
insert into dept values(4, 'Counselling');


select * from MyEmployees
select * from dept

select * from MyEmployees where Dept_id in ( select id from dept where dept_name = 'Accounts')

/* given a n employee table (emp_id)
						1
						2
						3
						3
						4
						5
						6
						6
						7
						8
						8
find the max val for emp id excluding the repeated

*/
create table emp (EMP_ID int)
INSERT INTO emp (EMP_ID) VALUES
(1),
(2),
(3),
(3),
(4),
(5),
(6),
(6),
(7),
(8),
(8)

select max(emp_id) from emp where emp_id in (select emp_id from emp group by emp_id having count(emp_id) < 2)

-----------------------------------------------------------------------------------------------------------------------------

-- practice question
CREATE TABLE TBL_PRODUCTS
(
	ID INT PRIMARY KEY IDENTITY,
	[NAME] NVARCHAR(50),
	[DESCRIPTION] NVARCHAR(250) 
)

CREATE TABLE TBL_PRODUCTSALES
(
	ID INT PRIMARY KEY IDENTITY,
	PRODUCTID INT FOREIGN KEY REFERENCES TBL_PRODUCTS(ID),
	UNITPRICE INT,
	QUALTITYSOLD INT
)

INSERT INTO TBL_PRODUCTS VALUES ('TV','52 INCH BLACK COLOR LCD TV')
INSERT INTO TBL_PRODUCTS VALUES ('LAPTOP','VERY THIIN BLACK COLOR ACER LAPTOP')
INSERT INTO TBL_PRODUCTS VALUES ('DESKTOP','HP HIGH PERFORMANCE DESKTOP')


INSERT INTO TBL_PRODUCTSALES VALUES (3,450,5)
INSERT INTO TBL_PRODUCTSALES VALUES (2,250,7)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,4)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,9)


SELECT *FROM TBL_PRODUCTS
SELECT *FROM TBL_PRODUCTSALES

-- find product which has not been sold atleast ones

select ID, NAME, DESCRIPTION from TBL_PRODUCTS where ID NOT in (select distinct  PRODUCTID from TBL_PRODUCTSALES)


-- TASK 2: find the names of product along with quantities sold  sum

select [NAME],
(select sum(QUALTITYSOLD) from TBL_PRODUCTSALES where PRODUCTID = TBL_PRODUCTS.ID) as [SALES_SUM]
from TBL_PRODUCTS





--NEXT CLASS: SET OPERATIONS 

------------- SET OPERATION IN DATABASES----------------------

CREATE TABLE FootballParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE HockeyParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);




INSERT INTO FootballParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Jane', 'jane.smith@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('David', 'david.wilson@example.com');


INSERT INTO HockeyParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Patricia', 'patricia.taylor@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('Kevin', 'kevin.martinez@example.com');


SELECT *FROM  FootballParticipants
SELECT *FROM  HockeyParticipants

/*
		SET? -> TABLE

		1. UNION
		2. UNION ALL
		3. INTERSECT (INNER JOIN)
		4. (A-B): EXCEPT


		RESTRICTION:
			1. THE NO COLUMNS IN INVOLVING RELATION SHOULD BE SAME (STRICLTY SAME)
			2. DATATYPES OF THESE COL MUST HAVE TO BE SAME


			EG: 
			
			SELECT *FROM A
			UNION
			SELECT *FROM B

			SELECT ID, NAME FROM A
			UNION
			SELECT NAME, ID FROM B


			SELECT ID, NAME FROM A
			UNION
			SELECT DECIMAL, ID FROM B

*/

SELECT *FROM  FootballParticipants
SELECT *FROM  HockeyParticipants

--UNION: UNION REMOVING DUPLICATES


SELECT *FROM  FootballParticipants
UNION
SELECT *FROM  HockeyParticipants


--UNION ALL
SELECT *FROM  FootballParticipants
UNION ALL
SELECT *FROM  HockeyParticipants





--SET OPERATIONS: UNIQUE ELEMETS
/*
	OPERATIONS
		1. UNION: UNIQUE VALUES
		2. UNION ALL: UNIQUE + DUPLICATES
		3. INTERSECT (INNER JOIN): COMMON DATA
		4. (A-B): EXCEPT (A BUT NOT B)

		WHAT IS A SET IN DB? SET = TABLE


	IMPORTANT RULES:
		1. COLUMN NAMES OF INVOLVING TABLES/SET SHOULD BE SAME (DATA TYPES SHOULD BE STRICLY SAME)
		2. ORDER OF PLACING THE COL IS VERY IMP
				ID, NAME
				NAME, ID
*/

CREATE TABLE FootballParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE HockeyParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);




INSERT INTO FootballParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Jane', 'jane.smith@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('David', 'david.wilson@example.com');


INSERT INTO HockeyParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Patricia', 'patricia.taylor@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('Kevin', 'kevin.martinez@example.com');


SELECT *FROM  FootballParticipants
SELECT *FROM  HockeyParticipants

--1. UNION
SELECT *FROM  FootballParticipants
UNION
SELECT *FROM  HockeyParticipants

--2. UNION ALL
SELECT *FROM  FootballParticipants
UNION ALL
SELECT *FROM  HockeyParticipants


--QUESTION
SELECT CAST(ID AS VARCHAR(MAX)), NAME FROM  FootballParticipants
UNION ALL
SELECT NAME, CAST(ID AS VARCHAR(MAX)) FROM  HockeyParticipants



--IN ORDER TO JOIN 2 TABLES
/*
	1. JOIN
	2. SQ
	3. SET OPERATIONS
*/

--MEDIUM/HARD QUESTIONS

CREATE TABLE department_med (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee_med (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department_med(id)
);


-- Insert into Department Table
INSERT INTO department_med (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee_med (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);
 
 select * from employee_med
 select * from department_med

 select E.id , E.name, E.salary, D.dept_name 
 from 
 employee_med as E
 left outer join 
 department_med as D on
 E.department_id = D.id
 where salary in (
	select max(salary) from employee_med group by department_id
 )
 order by E.salary desc


 --HARD QUESTION

 create table A(
	empid int ,
	empname varchar(10),
	salary int
 )
  create table B(
	empid int ,
	empname varchar(10),
	salary int
 )
 insert into A(empid,empname,salary) values
	(1,'AA',1000),
	(2,'BB',300);
  insert into B(empid,empname,salary) values
	(2,'BB',400),
	(3,'CC',100);

	select* from A
	select* from B

	select empid, min(empname), min(salary) from
	(
	select* from A
	union all
	select * from B
	) as temp_res
	group by empid

	select A.*,B.* 
	from
	A 
	full outer join 
	B on
	A.empid = B.empid