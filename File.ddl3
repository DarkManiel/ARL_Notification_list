-- Table Relation_3 has a compound primary key so no sequence or trigger was created for it.
-- Table Relation_4 has a compound primary key so no sequence or trigger was created for it.
DROP SEQUENCE member_seq ; 
create sequence member_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger member_PK_trig 
before insert on member
for each row 
begin 
select member_seq.nextval into :new.member_id from dual; 
end; 
/
alter table member add created date ; 
alter table member add created_by VARCHAR2 (255) ; 
alter table member add row_version_number integer ; 
alter table member add updated date ; 
alter table member add updated_by VARCHAR2 (255) ; 
/
create or replace trigger member_AUD_trig 
before insert or update on member 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE list_seq ; 
create sequence list_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger list_PK_trig 
before insert on list
for each row 
begin 
select list_seq.nextval into :new.list_id from dual; 
end; 
/
alter table list add created date ; 
alter table list add created_by VARCHAR2 (255) ; 
alter table list add row_version_number integer ; 
alter table list add updated date ; 
alter table list add updated_by VARCHAR2 (255) ; 
/
create or replace trigger list_AUD_trig 
before insert or update on list 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE list_member_seq ; 
create sequence list_member_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger list_member_PK_trig 
before insert on list_member
for each row 
begin 
select list_member_seq.nextval into :new.list_member_id from dual; 
end; 
/
alter table list_member add created date ; 
alter table list_member add created_by VARCHAR2 (255) ; 
alter table list_member add row_version_number integer ; 
alter table list_member add updated date ; 
alter table list_member add updated_by VARCHAR2 (255) ; 
/
create or replace trigger list_member_AUD_trig 
before insert or update on list_member
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

