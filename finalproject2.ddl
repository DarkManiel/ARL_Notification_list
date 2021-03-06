-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-06 16:50:19 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

drop table employee;
drop table list_employee;
drop table Relation_3;
drop table Relation_4;


CREATE TABLE Relation_3
  (
    member_user_id           INTEGER NOT NULL ,
    list_member_list_member_id INTEGER NOT NULL
  ) ;
ALTER TABLE Relation_3 ADD CONSTRAINT Relation_3_PK PRIMARY KEY ( member_user_id, list_member_list_member_id ) ;

CREATE TABLE Relation_4
  (
    list_member_list_member_id INTEGER NOT NULL ,
    list_list_id               INTEGER NOT NULL
  ) ;
ALTER TABLE Relation_4 ADD CONSTRAINT Relation_4_PK PRIMARY KEY ( list_member_list_member_id, list_list_id ) ;

DROP TABLE member;

CREATE TABLE member
  (
    member_id    INTEGER NOT NULL ,
    status          integer,
    name            VARCHAR2 (255) ,
    lab             VARCHAR2 (4) ,
    division        VARCHAR2 (4) ,
    status_eff_date DATE
  ) ;
ALTER TABLE member ADD CONSTRAINT member_PK PRIMARY KEY ( member_id ) ;


CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER member_insert_trigger
BEFORE INSERT
ON member
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT member_seq.nextval INTO :NEW.member_id FROM dual;
END;
/


CREATE TABLE list
  (
    list_id               INTEGER NOT NULL,
    name                  VARCHAR2 (40) ,
    description           VARCHAR2 (4000) ,
    external_name         VARCHAR2 (255) ,
    division_code         VARCHAR2 (20)  ,
    status                VARCHAR2 (255) ,
    status_effective_date DATE ,
    creation_date         DATE
  ) ;
ALTER TABLE list ADD CONSTRAINT list_PK PRIMARY KEY ( list_id ) ;


CREATE SEQUENCE list_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER list_insert_trigger
BEFORE INSERT
ON list
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT list_seq.nextval INTO :NEW.list_id FROM dual;
END;
/





CREATE TABLE list_member
  (
    list_member_id        INTEGER NOT NULL ,
    member_id           INTEGER ,
    list_id               INTEGER ,
    date_added            DATE ,
    list_list_id          INTEGER ,
    member_member_id INTEGER
  ) ;
ALTER TABLE list_member ADD CONSTRAINT list_member_PK PRIMARY KEY ( list_member_id ) ;

CREATE TABLE list_list
  ( list_list_id INTEGER , list_list_id1 INTEGER
  ) ;
  
Create or replace force view "list_tree"("name", "id") as 
select name as name, list_id as id
from list


ALTER TABLE Relation_3 ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( member_user_id ) REFERENCES member ( member_id ) ;

ALTER TABLE Relation_3 ADD CONSTRAINT FK_ASS_2 FOREIGN KEY ( list_member_list_member_id ) REFERENCES list_member ( list_member_id ) ;

ALTER TABLE Relation_4 ADD CONSTRAINT FK_ASS_3 FOREIGN KEY ( list_member_list_member_id ) REFERENCES list_member ( list_member_id ) ;

ALTER TABLE Relation_4 ADD CONSTRAINT FK_ASS_4 FOREIGN KEY ( list_list_id ) REFERENCES list ( list_id ) ;

ALTER TABLE list_list ADD CONSTRAINT list_list_list_FK FOREIGN KEY ( list_list_id ) REFERENCES list ( list_id ) ;

ALTER TABLE list_list ADD CONSTRAINT list_list_list_FKv1 FOREIGN KEY ( list_list_id1 ) REFERENCES list ( list_id ) ;

ALTER TABLE list_member ADD CONSTRAINT list_member_member_FK FOREIGN KEY ( member_member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE list_memberADD CONSTRAINT list_member_list_FK FOREIGN KEY ( list_list_id ) REFERENCES list ( list_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
