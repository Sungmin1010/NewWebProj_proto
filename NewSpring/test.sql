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