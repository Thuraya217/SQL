create database University;
Go
use University;

create table Hostel (
hostel_ID int primary key,
hostel_name varchar (20) not null,
no_of_seats varchar (20) not null,
);

create table Course (
course_ID int primary key,
duration int,
course_name varchar (20),
department_id int,
);

create table Department (
department_id int primary key,
D_name varchar (20),
);

alter table Course
add constraint fk_Course_Department
foreign key (department_id) references Department (department_id);

create table Exams (
exam_code int primary key,
room varchar (20),
date date,
time time,
department_id int,
foreign key (department_id) references Department (department_id)
);

create table Subject (
subject_id int primary key,
subject_name varchar (20),
);

create table Faculty (
F_id int primary key,
name varchar (20),
department varchar (20), 
salary decimal (10,2),
department_id int,
foreign key (department_id) references Department (department_id)
);

create table Faculty_mobile_no (
F_id int,
mobile_no varchar (20),
primary key (F_id,mobile_no),
foreign key (F_id) references Faculty (F_id)
);

create table Student (
S_id int primary key,
F_name varchar (20),
L_name varchar (20),
city varchar (20),
state varchar (20),
pin_code varchar (20),
DOB date,
age int,
F_id int,
hostel_id int,
foreign key (F_id) references Faculty (F_id),
foreign key (hostel_id) references Hostel (hostel_id)
);

create table Student_phone_no (
S_id int,
phone_no varchar (20),
foreign key (S_id) references Student (S_id)
);

create table Student_Faculty (
S_id int,
F_id int,
foreign key (F_id) references Faculty (F_id),
foreign key (S_id) references Student (S_id)
);

create table Student_Course (
S_id int,
course_ID int,
primary key (course_ID,S_id),
foreign key (course_ID) references Course (course_ID),
foreign key (S_id) references Student (S_id)
);
