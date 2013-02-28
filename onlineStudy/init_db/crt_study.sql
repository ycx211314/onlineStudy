----------用户
drop table t_userinfo;
create table t_userinfo(
  userid integer primary key default nextval('seq_userinfo'),
  email varchar(100) not null unique,
  thirdinfo varchar(100),
  username varchar(50) not null unique,
  passwords varchar(48) not null,
  neckname varchar(50) not null,
  age integer,
  gender varchar(1),
  registDate date default current_date,
  lastloginTs date,
  loginCookies varchar(100)
);
-------科目表
drop table t_branch;
create table t_branch(
  bid integer primary key default nextval('seq_branch'),
  categroy integer,
  displayText varchar(100) not null,
  description varchar(500),
  dependon varchar (100),
  pid integer default 0,
  createTs date default  current_date,
  updateTs date default current_date,
  creator varchar(20)
);
----------问题表
drop table T_SUBJECT;
create table T_SUBJECT(
  s_id integer primary key default nextval('seq_question'),
  title_desc varchar(200),
  keywords varchar(50),
  img_url varchar(100),
  branch_id integer not null,
  types integer not null default 1,
  stand_answer varchar(50),
  analysis_Text varchar(300),
  createTs date default  current_date,
  updateTs date default current_date,
  creator varchar(20)
);
drop table T_ANSWER_OPT;
create table T_ANSWER_OPT(
  adi integer primary key default nextval('seq_questionitem'),
  show_text varchar(100),
  question_id integer not null,
  img_url varchar(100),
  details varchar(200),
  createTs date default  current_date,
  updateTs date default current_date,
  creator varchar(20)
);