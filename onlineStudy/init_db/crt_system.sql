----------------------------系统管理表------------------------
-------------管理员表----------
drop table t_administrator;
create table t_administrator(
  loginname varchar(50) NOT NULL primary key ,
  loginpsd varchar(64) not null,
  username varchar(20) not null,
  cellphone varchar(20) not null,
  lastloginTs DATE default current_date,
  states bool default true,
  roleid integer not null
);
---------角色表------------
drop table t_role;
create table t_role(
  rid integer primary key default nextval('seq_role'),
  rolename varchar(20) not null,
  description varchar(100) not null,
  updatets date default current_date,
  creator varchar(50) not null,
  cangrant bool default false
);
-----------菜单表----------
drop table t_menu;
create table t_menu(
  mid integer primary key default nextval('seq_menu'),
  showtext varchar(20) not null,
  url varchar(100) not null,
  attrs integer default 1,
  iconcls varchar(50),
  pid integer,
  updatets Date not null default current_date,
  cangrant bool not null default true
);
----------角色 菜单表------
drop table t_role_menu;
create table t_role_menu(
  role_id integer not null,
  menu_id integer not null,
  primary key(role_id,menu_id)
);
drop table t_privilege;
create table t_privilege(
  id integer not null primary key default nextval('seq_privilege'),
  display_el varchar(500),
  actions varchar(100) not null,
  otheres varchar(100),
  cangrant bool default true,
  updatets date default current_date
);
drop table t_role_privilege;
create table t_role_privilege(
  role_id integer not null,
  privilege_id integer not null,
  primary key (role_id,privilege_id)
);

