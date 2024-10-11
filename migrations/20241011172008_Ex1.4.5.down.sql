SET
    SEARCH_PATH TO company;

BEGIN;

UPDATE employee
SET
    ssn = '999887777'
WHERE
    ssn = '7';

ALTER TABLE works_on
DROP CONSTRAINT fk_essn,
ADD CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee (ssn) DEFERRABLE;

COMMIT;

SET
    SEARCH_PATH TO public;
