-- Add up migration script here
create schema company;

set search_path to company;

create table employee {
  ssn char(9) primary key,
  fname varchar(15) not null,
  minit char(1),
  lname varcahr(15) not null,
  bdate date,
  address 
};

create table department {

};

create table dept_location {

};

create table project {

};

create table works_on {

};

create table dependent {

};

create table location {

};
