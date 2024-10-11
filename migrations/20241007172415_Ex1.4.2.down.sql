SET
    SEARCH_PATH TO company;

ALTER TABLE employee
DROP CONSTRAINT fk_super_ssn,
DROP CONSTRAINT fk_dno;

ALTER TABLE department
DROP CONSTRAINT fk_mgr_ssn;

ALTER TABLE dept_locations
DROP CONSTRAINT fk_dnumber,
DROP CONSTRAINT fk_dlocation;

ALTER TABLE project
DROP CONSTRAINT fk_plocation,
DROP CONSTRAINT fk_dnum;

ALTER TABLE works_on
DROP CONSTRAINT fk_essn,
DROP CONSTRAINT fk_pno;

ALTER TABLE dependent
DROP CONSTRAINT fk_essn;

SET
    SEARCH_PATH TO public;
