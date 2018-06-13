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
insert into tb_user(nick, email, pwd) values('�շ�', 'test10@mail.com', '0000');

insert into tb_board(title, content, hit, useq) values('test post title', 'This is my first board', 0, 1 );
select u.nick, b.bseq, b.title, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq;
select u.nick, b.title, b.content, b.datetime, b.hit from tb_user u, tb_board b where u.useq=b.useq and b.bseq=1;
select * from tb_user where nick='testNick';
======================================================

select * from tb_user;
select * from tb_file;
select * from tb_board order by bseq desc;


insert into tb_board(title, content, hit, useq) values('�̵� ��õ �޾ƿ�', '���� ', 0, 1 );
insert into tb_board(title, content, hit, useq) values('�ٵ� �����ð��� ���Ͻó���', 'This is my first board', 0, 6);
insert into tb_board(title, content, hit, useq) values('����ȣȸ �����մϴ�~~', 'This is my first board', 0, 7);
insert into tb_board(title, content, hit, useq) values('�ο� ����մϴ�.(�� �ϽǺи�!)', 'This is my first board', 0, 8);
insert into tb_board(title, content, hit, useq) values('������ ��ȭ ī�� �������?', 'This is my first board', 0, 9);
insert into tb_board(title, content, hit, useq) values('Ŭ���� ���� ��õ ����Ʈ', 'This is my first board', 0, 10);
insert into tb_board(title, content, hit, useq) values('������ �����ź�??', 'This is my first board', 0, 11);
insert into tb_board(title, content, hit, useq) values('���̿� ��ȭī�� ��õ �޾ƿ�!!', 'This is my first board', 0, 12);
insert into tb_board(title, content, hit, useq) values('test11', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test12', 'This is my first board', 0, 1 );
insert into tb_board(title, content, hit, useq) values('test13', 'This is my first board', 0, 1 );
SELECT LAST_INSERT_ID();
select * from tb_board order by bseq desc limit 0, 10;
SELECT LAST_INSERT_ID();
update tb_board set hit=hit+1 where bseq=1;
select * from tb_board
update tb_board set content="������ ���� ������ �����ѵ��� ��ȭå ���� ������ ���̿� ������ �� �������?? " where bseq=20;
==========================================================
create table tbl_user(
uid varchar(50) primary key not null,
upw varchar(50) not null,
uname varchar(100) not null,
upoint int default 0
);
create table tbl_message(
mid int not null auto_increment,
targetid varchar(50) not null,
sender varchar(50) not null,
message text not null,
opendate DATETIME,
senddate DATETIME not null default CURRENT_TIMESTAMP,
primary key(mid)
);
alter table tbl_message add constraint fk_usertarget foreign key (targetid) references tbl_user(uid);
alter table tbl_message add constraint fk_usersender foreign key (sender) references tbl_user(uid);

insert into tbl_user(uid, upw, uname) values('user00', 'user00', 'IRON MAN');
insert into tbl_user(uid, upw, uname) values('user02', 'user02', 'CAPTAIN');
insert into tbl_user(uid, upw, uname) values('user03', 'user03', 'HULK');
insert into tbl_user(uid, upw, uname) values('user04', 'user04', 'THOR');
insert into tbl_user(uid, upw, uname) values('user10', 'user10', 'QUICK SILVER');

select * from tbl_user;
select * from tbl_message;