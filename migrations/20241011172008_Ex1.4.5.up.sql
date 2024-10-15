SET
    SEARCH_PATH TO company;

BEGIN;

-- (a)
-- WARN: Doesn't work since the employee is referenced in `works_on` and violates
-- the foreign key constraint. Can be avoided by specifying the `ON UPDATE` action
--
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

-- Rollback since we don't actually want to update the database as it would
-- clash with the rest of the task
ROLLBACK;

SET
    SEARCH_PATH TO company;

BEGIN;

-- (b)
-- WARN: Doesn't work since it violates the foreign key `fk_essn` on `works_on`.
-- This can be avoided by specifying the `ON DELETE` action
--
-- DELETE FROM employee
-- WHERE
--     ssn = '999887777';
ALTER TABLE works_on
DROP CONSTRAINT fk_essn,
ADD CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee (ssn) ON DELETE CASCADE DEFERRABLE;

DELETE FROM employee
WHERE
    ssn = '999887777';

ROLLBACK;

-- (c)
-- WARN: Doesn't work since there is no project with id 5. We either need to
-- insert a 5th project or not insert the second tuple.
--
-- INSERT INTO
--     works_on
-- VALUES
--     ('123456789', 3, 10),
--     ('123456789', 5, 10);
-- (d)
--
-- WARN: Doesn't work since it violates the foreign key constraint `fk_dno` on
-- `employee`, `fk_dnum` on `project` and `fk_dnumber` on `dept_locations`. We
-- could try and overcome this issue by using `ON DELETE CASCADE` for each of
-- those constraints but that would have rippling effects since deleting a project
-- also implies deleting every `works_on` relationships that were linked. We might
-- want to take it all down at once but since it wasn't explicitly asked, let's
-- not do it.
--
-- DELETE FROM department
-- WHERE
--     dnumber = 5;
SET
    SEARCH_PATH TO public;
