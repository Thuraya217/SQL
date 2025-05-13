create database Airline;
Go
use Airline;

create table Airport (
Airport_code int primary key,
city varchar (20),
state varchar (20),
name varchar (20)
);

create table Airport_type (
type_name varchar (20) primary key,
Max_seats int,
company varchar (20)
);

create table Flight_LEG (
leg_no int primary key,
number int,
Airport_code int,
Scheduled_dep_time datetime,
Scheduled_arr_time datetime,
foreign key (Airport_code) references Airport (Airport_code)
);

create table LEG_Instance (
date date primary key,
no_of_avail_seats int,
leg_no int,
Airport_code int,
Arr_time datetime,
Dep_time datetime,
foreign key (Airport_code) references Airport (Airport_code),
foreign key (leg_no) references Flight_LEG (leg_no)
);

create table Flight (
number int primary key,
airline varchar (20),
weekdays varchar (20)
);

create table Fare (
code int primary key,
amiunt decimal (10,2),
restrictions varchar (20),
number int,
foreign key (number) references Flight (number)
);

create table Seat (
seat_no int primary key,
date date,
CPhone varchar (20),
customer_name varchar (20),
foreign key (date) references LEG_Instance (date)
);

create table Airplance (
airplane_id int primary key,
Total_no_of_seats int,
type_name varchar (20),
foreign key (type_name) references Airport_type (type_name)
);

create table Airport_airportType (  
Airport_code int,
type_name varchar (20),
foreign key (Airport_code) references Airport (Airport_code),
foreign key (type_name) references Airport_type (type_name)
);

alter table Flight_LEG
add constraint fk_Flight_LEG_Flight
foreign key (number) references Flight (number); --flight_leg table

alter table LEG_Instance
add constraint fk_LEG_Instance_Airplane
foreign key (Airplane_id) references Airplane (Airplane_id); -- leg_instance
