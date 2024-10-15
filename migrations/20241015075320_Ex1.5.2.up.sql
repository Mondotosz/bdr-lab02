SET
    SEARCH_PATH TO company;

BEGIN;
  -- We can't actually use the existing departments since there are other constraints
  -- which will prevent the update
SET CONSTRAINTS ALL DEFERRED;

INSERT INTO department
VALUES
  ('Temp', 99, '555555555', '1981-06-19');

INSERT INTO
    employee
VALUES
    ('A', NULL, 'A', '555555555', NULL, NULL, NULL, NULL, NULL, 99),
    ('B', NULL, 'B', '666666666', NULL, NULL, NULL, NULL, NULL, 99),
    ('C', NULL, 'C', '777777777', NULL, NULL, NULL, NULL, NULL, 99),
    ('D', NULL, 'D', '888888888', NULL, NULL, NULL, NULL, NULL, 99);

COMMIT;

BEGIN;

--
-- INFO: We can't update the department as it is because of the `fk_dno` on
-- `employee`. We need to cascade the changes when updating the dno

ALTER TABLE employee
DROP CONSTRAINT fk_dno,
ADD CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES department (dnumber) ON UPDATE CASCADE DEFERRABLE;

UPDATE department
  SET dnumber = 100
  WHERE dnumber = 99;

COMMIT;

SET
    SEARCH_PATH TO public;
