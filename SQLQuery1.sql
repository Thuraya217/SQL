create database Company;

use Company;

create table Employees (
Ssn int primary key,
FName varchar (20) not null,
Minit char (1) not null,
LName varchar (20) not null,
Bdate date,
Address varchar ( 255 ),
Sex char(1) CHECK (Sex IN ('M', 'F')),
Salary decimal (10,2) check (Salary > 0 ),
Super_ssn int,
Dno int,
foreign key (Super_ssn) references Employees (Ssn),
foreign key (Dno) references department (Dnumber),
);

use Company;
Go
create table department (
Dnumber int primary key,
DName varchar (20) not null,
Mgr_ssn int,
Mgr_start_date date,
foreign key (Mgr_ssn) references Employees (Ssn)
);

create table DEPT_LOCATIONS (
Dnumber int,
DLocation varchar (20),
primary key (Dnumber , DLocation),
foreign key (Dnumber) references department (Dnumber),
);

create table project (
PNumber int primary key,
PName varchar (20) not null,
PLocation varchar (20),
Dnum int
foreign key (Dnum) references department (Dnumber),
);

create table Works_on (
Essn int,
Pno int,
Hours decimal (5,2),
primary key (Essn , Pno),
foreign key (Essn) references Employees (Ssn),
foreign key (Pno) references project (PNumber),
);

create table Dependent (
Essn int,
Dependent_name int,
Sex char(1) check (Sex IN ('M', 'F')),
Bdate date,
Realtionship varchar (20),
primary key (Essn , Dependent_name),
foreign key (Essn) references Employees (Ssn),
);

alter table Employees 
add DateOfBirth Date;

alter table Employees
drop column Minit;

