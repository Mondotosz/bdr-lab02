SET
    SEARCH_PATH TO company;

BEGIN;

-- (a)
-- WARN: Doesn't work since the employee is referenced in `works_on` and violates
-- the foreign key constraint. Can be avoided by specifying the `ON UPDATE` action
-- NOTE: the value 7 will be cast to a string here but if it was in the `WHERE`
-- clause it would result in an error
-- UPDATE employee
--   SET ssn = 7
--   WHERE ssn = '999887777';
ALTER TABLE works_on
DROP CONSTRAINT fk_essn,
ADD CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee (ssn) ON UPDATE CASCADE DEFERRABLE;

UPDATE employee
SET
    ssn = 7
WHERE
    ssn = '999887777';

COMMIT;

SET
    SEARCH_PATH TO public;
