drop table tb_user;
drop table tb_board;
drop table tb_file;
drop table tb_reply;

create table tb_user(
  useq int primary key AUTO_INCREMENT,
  nick varchar(30) not null,
  email varchar(30) unique,
  pwd varchar(20) not null,
  ustatus int default 0
);

create table tb_board(
  bseq int primary key AUTO_INCREMENT,
  title varchar(30) not null,
  content varchar(500) not null,
  datetime DATETIME default CURRENT_TIMESTAMP,
  bstatus int default 0,
  hit int,
  useq int
)

create table tb_file(
  fseq int primary key AUTO_INCREMENT,
  fname varchar(20) not null,
  sname varchar(20) unique,
  fdir varchar(30) not null,
  ftype int default 0,
  bseq int
)

create table tb_attach(
  fullName varchar(150) not null,
  bseq int,
  regdate DATETIME default CURRENT_TIMESTAMP,
  primary key(fullName)
)
desc tb_attach;
alter table tb_attach add constraint fk_attach_bseq foreign key(bseq) references tb_board(bseq);

create table tb_reply(
  rseq int primary key AUTO_INCREMENT,
  bseq int,
  useq int,
  comment varchar(100) not null,
  rstatus int default 0,
  datetime DATETIME default CURRENT_TIMESTAMP
)

alter table tb_board add constraint fk_board_useq foreign key(useq) references tb_user(useq);
alter table tb_file add constraint fk_file_bseq foreign key(bseq) references tb_board(bseq);
alter table tb_reply add constraint fk_reply_bseq foreign key(bseq) references tb_board(bseq);
alter table tb_reply add constraint fk_reply_useq foreign key(useq) references tb_user(useq);

drop table tablename;
show tables

=====================================================

insert into tb_user(nick, email, pwd) values('testNick', 'test@mail.com', '0000');
select nick, email, pwd from tb_user where nick='testNick';
insert into tb_board(title, content, hit, useq) values('test post title', 'This is my first board', 0, 1 );
select u.nick, b.bseq, b.title, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq;
select u.nick, b.title, b.content, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq and b.bseq=1;
select * from tb_user where nick='testNick';
======================================================

select * from tb_user;
select * from tb_file;
select * from tb_board order by bseq desc;


insert into tb_board(title, content, hit, useq) values('test3', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test4', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test5', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test6', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test7', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test8', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test9', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test10', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test11', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test12', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test13', 'This is my first board', 0, 1 );

select * from tb_board order by bseq desc limit 0, 10;



