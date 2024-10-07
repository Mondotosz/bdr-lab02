SET SEARCH_PATH TO company;

INSERT INTO works_on VALUES('123456789', 3, 10.0);
-- There is no project with pnumber 5 but since there is not foreign key constraints, this is allowed
INSERT INTO works_on VALUES('123456789', 5, 10.0);

SET SEARCH_PATH TO public;
