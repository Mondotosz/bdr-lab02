-- Add up migration script here
create schema company;

set search_path to company;

create table employee (
  fname varchar(15) not null,
  minit char(1),
  lname varchar (15) not null,
  ssn char(9) not null,
  bdate date,
  address varchar(30),
  sex char (1),
  salary decimal(10, 2),
  super_ssn char(9),
  dno integer not null,
  primary key (ssn)
);

create table department (
  dname integer not null,
  dnumber integer not null,
  mgr_ssn char(9) not null,
  mgr_start_date date not null,
  primary key (dnumber)
);

create table dept_location (
  dnumber integer not null,
  dlocation integer not null,
  primary key (dnumber, dlocation)
);

create table project (
  pname varchar(15) not null,
  pnumber integer not null,
  plocation integer,
  dnum integer not null,
  primary key (pnumber)
);

create table works_on (
  essn char(9) not null,
  pno integer not null,
  hours decimal(3, 1) not null,
  primary key (essn, pno)
);

create table dependent (
  essn char(9) not null,
  dependent_name varchar(15) not null,
  sex char(1),
  bdate date,
  relationship varchar(8),
  primary key (essn, dependent_name)
);

create table location (
  lnumber integer not null,
  lname varchar(15) not null,
  primary key (lnumber)
);

set search_path to public; -- Needed since sqlx migrations have issues otherwise
