-- Add up migration script here
CREATE SCHEMA company;

SET
    search_path TO company;

CREATE TABLE employee (
    fname varchar(15) NOT NULL,
    minit char(1),
    lname varchar(15) NOT NULL,
    ssn char(9) NOT NULL,
    bdate date,
    address varchar(30),
    sex char(1),
    salary decimal(10, 2),
    super_ssn char(9),
    dno integer NOT NULL,
    PRIMARY KEY (ssn)
);

CREATE TABLE department (
    dname varchar(15) NOT NULL,
    dnumber integer NOT NULL,
    mgr_ssn char(9) NOT NULL,
    mgr_start_date date NOT NULL,
    PRIMARY KEY (dnumber)
);

CREATE TABLE dept_locations (dnumber integer NOT NULL, dlocation integer NOT NULL, PRIMARY KEY (dnumber, dlocation));

CREATE TABLE project (pname varchar(15) NOT NULL, pnumber integer NOT NULL, plocation integer, dnum integer NOT NULL, PRIMARY KEY (pnumber));

CREATE TABLE works_on (essn char(9) NOT NULL, pno integer NOT NULL, hours decimal(3, 1) NOT NULL, PRIMARY KEY (essn, pno));

CREATE TABLE dependent (
    essn char(9) NOT NULL,
    dependent_name varchar(15) NOT NULL,
    sex char(1),
    bdate date,
    relationship varchar(8),
    PRIMARY KEY (essn, dependent_name)
);

CREATE TABLE location (lnumber integer NOT NULL, lname varchar(15) NOT NULL, PRIMARY KEY (lnumber));

SET
    search_path TO public;

-- Needed since sqlx migrations have issues otherwise
