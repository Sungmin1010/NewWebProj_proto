drop table tb_user;
drop table tb_board;
drop table tb_file;
drop table tb_reply;
drop table tb_attach;
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
select * from tb_attach;


create table tb_reply(
  rseq int primary key AUTO_INCREMENT,
  bseq int,
  useq int,
  comment varchar(100) not null,
  rstatus int default 0,
  datetime DATETIME default CURRENT_TIMESTAMP
)
desc tb_reply;
select * from tb_reply;


alter table tb_board add constraint fk_board_useq foreign key(useq) references tb_user(useq);
alter table tb_file add constraint fk_file_bseq foreign key(bseq) references tb_board(bseq);
alter table tb_reply add constraint fk_reply_bseq foreign key(bseq) references tb_board(bseq);
alter table tb_reply add constraint fk_reply_useq foreign key(useq) references tb_user(useq);

drop table tablename;
show tables

=====================================================

insert into tb_user(nick, email, pwd) values('testNick', 'test@mail.com', '0000');
insert into tb_user(nick, email, pwd) values('test1', 'test1@mail.com', '1111');
insert into tb_user(nick, email, pwd) values('롱롱', 'test10@mail.com', '0000');

insert into tb_board(title, content, hit, useq) values('test post title', 'This is my first board', 0, 1 );
select u.nick, b.bseq, b.title, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq;
select u.nick, b.title, b.content, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq and b.bseq=1;
select * from tb_user where nick='testNick';
======================================================

select * from tb_user;
select * from tb_file;
select * from tb_board order by bseq desc;


insert into tb_board(title, content, hit, useq) values('미드 추천 받아용', '요즘 ', 0, 1 );
insert into tb_board(title, content, hit, useq) values('다들 여가시간에 머하시나요', 'This is my first board', 0, 6);
insert into tb_board(title, content, hit, useq) values('댄스동호회 모집합니당~~', 'This is my first board', 0, 7);
insert into tb_board(title, content, hit, useq) values('인원 충원합니다.(꼭 하실분만!)', 'This is my first board', 0, 8);
insert into tb_board(title, content, hit, useq) values('강남에 영화 카페 있을까요?', 'This is my first board', 0, 9);
insert into tb_board(title, content, hit, useq) values('클래식 음악 추천 리스트', 'This is my first board', 0, 10);
insert into tb_board(title, content, hit, useq) values('월디페 가보신분??', 'This is my first board', 0, 11);
insert into tb_board(title, content, hit, useq) values('신촌에 만화카페 추천 받아욧!!', 'This is my first board', 0, 12);
insert into tb_board(title, content, hit, useq) values('test11', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test12', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test13', 'This is my first board', 0, 1 );
SELECT LAST_INSERT_ID();
select * from tb_board order by bseq desc limit 0, 10;
SELECT LAST_INSERT_ID();
update tb_board set hit=hit+1 where bseq=1;
select * from tb_board
update tb_board set content="날씨도 덥고 에어컨 빵빵한데서 만화책 보고 싶은데 신촌에 괜찮을 곳 있을까요?? " where bseq=20;
