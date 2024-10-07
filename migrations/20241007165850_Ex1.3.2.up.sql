SET SEARCH_PATH TO company;

-- The department with dnumber 5 can be deleted despite having
-- multiple employees. There are no foreign key constraints on
-- the tables which might depend on it.
DELETE FROM department WHERE dnumber = 5;

SET SEARCH_PATH TO public;
