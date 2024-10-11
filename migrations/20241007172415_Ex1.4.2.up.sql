SET
    SEARCH_PATH TO company;

ALTER TABLE employee
ADD CONSTRAINT fk_super_ssn FOREIGN KEY (super_ssn) REFERENCES employee (ssn),
ADD CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES department (dnumber);

ALTER TABLE department
ADD CONSTRAINT fk_mgr_ssn FOREIGN KEY (mgr_ssn) REFERENCES employee (ssn);

ALTER TABLE dept_locations
ADD CONSTRAINT fk_dnumber FOREIGN KEY (dnumber) REFERENCES department (dnumber),
ADD CONSTRAINT fk_dlocation FOREIGN KEY (dlocation) REFERENCES location (lnumber);

ALTER TABLE project
ADD CONSTRAINT fk_plocation FOREIGN KEY (plocation) REFERENCES location (lnumber),
ADD CONSTRAINT fk_dnum FOREIGN KEY (dnum) REFERENCES department (dnumber);

ALTER TABLE works_on
ADD CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee (ssn),
ADD CONSTRAINT fk_pno FOREIGN KEY (pno) REFERENCES project (pnumber);

ALTER TABLE dependent
ADD CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee (ssn);

SET
    SEARCH_PATH TO public;
