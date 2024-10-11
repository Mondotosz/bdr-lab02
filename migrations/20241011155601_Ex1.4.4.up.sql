SET
    SEARCH_PATH TO company;

-- NOTE: we have a circular relationship which means we need to disable the
-- foreign constraints while we insert.
BEGIN;

SET CONSTRAINTS ALL DEFERRED;

INSERT INTO
    department
VALUES
    ('IT', 10, '555444333', NOW());

INSERT INTO
    employee
VALUES
    ('Steve', NULL, 'Jobs', '555444333', '1955-02-24', NULL, 'M', NULL, NULL, 10);

COMMIT;

SET
    SEARCH_PATH TO public;
