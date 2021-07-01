create table users2
	(id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100),
	regdate date);
	
create table fine
	(num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	content clob,
	viewCount number,
	regdate date,
	upCount number);
	
create sequence fine_seq;	