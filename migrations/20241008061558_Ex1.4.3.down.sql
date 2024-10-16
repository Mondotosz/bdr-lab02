SET
    SEARCH_PATH TO company;

BEGIN;

SET CONSTRAINTS ALL DEFERRED;

TRUNCATE TABLE department,
dependent,
dept_locations,
employee,
project,
works_on,
location;

COMMIT;

BEGIN;

ALTER TABLE employee
ALTER CONSTRAINT fk_super_ssn NOT DEFERRABLE,
ALTER CONSTRAINT fk_dno NOT DEFERRABLE;

ALTER TABLE department
ALTER CONSTRAINT fk_mgr_ssn NOT DEFERRABLE;

ALTER TABLE dept_locations
ALTER CONSTRAINT fk_dnumber NOT DEFERRABLE,
ALTER CONSTRAINT fk_dlocation NOT DEFERRABLE;

ALTER TABLE project
ALTER CONSTRAINT fk_plocation NOT DEFERRABLE,
ALTER CONSTRAINT fk_dnum NOT DEFERRABLE;

ALTER TABLE works_on
ALTER CONSTRAINT fk_essn NOT DEFERRABLE,
ALTER CONSTRAINT fk_pno NOT DEFERRABLE;

ALTER TABLE dependent
ALTER CONSTRAINT fk_essn NOT DEFERRABLE;

COMMIT;

SET
    SEARCH_PATH TO public;
