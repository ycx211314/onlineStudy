---DROP TABEL UserInfo
drop sequence seq_userinfo;
create sequence seq_userinfo increment 1 minvalue 1 cache 10;
drop sequence seq_role;
create sequence seq_role increment 1 minvalue 1;
drop sequence seq_menu;
create sequence seq_menu increment 1 minvalue 1;
drop sequence seq_privilege;
create sequence seq_privilege increment 1 minvalue 1;