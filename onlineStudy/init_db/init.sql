---DROP TABEL UserInfo
drop sequence seq_userinfo;
create sequence seq_userinfo increment 1 minvalue 1 cache 10;


----------create tables--------
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
)