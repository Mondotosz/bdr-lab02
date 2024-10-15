SET
    SEARCH_PATH TO company;

BEGIN;

-- We can't actually use employees that are already in the database since every
-- supervisor is also a department manager which prevents us from deleting them
--
-- NOTE: Trying to just delete the employee will fail as it violates the 
-- `fk_super_ssn` constraint on `employee`. To automatically set the `super_ssn`
-- value to NULL for the supervisees, we can change the constraint to
-- `ON DELETE SET NULL`
INSERT INTO
    employee
VALUES
    ('A', NULL, 'A', '111111111', NULL, NULL, NULL, NULL, NULL, 5),
    ('B', NULL, 'B', '222222222', NULL, NULL, NULL, NULL, '111111111', 5),
    ('C', NULL, 'C', '333333333', NULL, NULL, NULL, NULL, '111111111', 5),
    ('D', NULL, 'D', '444444444', NULL, NULL, NULL, NULL, '111111111', 5);

ALTER TABLE employee
DROP CONSTRAINT fk_super_ssn,
ADD CONSTRAINT fk_super_ssn FOREIGN KEY (super_ssn) REFERENCES employee (ssn) ON DELETE SET NULL DEFERRABLE;

DELETE FROM employee
WHERE
    employee.ssn = '111111111';

COMMIT;

SET
    SEARCH_PATH TO public;
