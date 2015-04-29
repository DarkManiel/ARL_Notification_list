-- Table Relation_3 has a compound primary key so no sequence or trigger was created for it.
-- Table Relation_4 has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE member_seq ; 
create sequence member_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER member_PK_trig 
; 

create or replace trigger member_PK_trig 
before insert on member
for each row 
begin 
select member_seq.nextval into :new.member_id from dual; 
end; 
/

DROP SEQUENCE list_seq ; 
create sequence list_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER list_PK_trig 
; 

create or replace trigger list_PK_trig 
before insert on list
for each row 
begin 
select list_seq.nextval into :new.list_id from dual; 
end; 
/

DROP SEQUENCE list_member_seq ; 
create sequence list_member_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER list_member_PK_trig 
; 

create or replace trigger list_member_PK_trig 
before insert on list_member
for each row 
begin 
select list_member_seq.nextval into :new.list_member_id from dual; 
end; 
/

