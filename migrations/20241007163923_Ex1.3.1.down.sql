SET SEARCH_PATH TO company;

DELETE FROM works_on WHERE essn = '123456789' AND pno in (3,5);

SET SEARCH_PATH TO public;
