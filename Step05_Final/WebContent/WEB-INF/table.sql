-- 사용자(회원) 정보를 저장할 table
create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100), -- profile image 경로를 저장할 column
	regdate date -- 가입일
);

-- 게시글을 저장할 테이블
create table board_cafe(
	num number primary key, -- 글번호
	writer varchar2(100) not null, -- 작성자(로그인된 아이디)
	title varchar2(100) not null, -- 제목
	content clob, -- 글 내용
	viewCount number, -- 조회수
	regdate date -- 글 작성일
);

-- 게시글을 얻어낼 시퀀스
create sequence board_cafe_seq;

select *
from
	(select num, title, writer,
	lag(num, 1, 0) over (order by num desc) as prevNum,
	lead(num, 1, 0) over (order by num desc) as nextNum
	from board_cafe
	order by num desc)
where num=381;


select *
from
	(select num, title, writer,
	lag(num, 1, 0) over (order by num desc) as prevNum,
	lead(num, 1, 0) over (order by num desc) as nextNum
	from board_cafe
	where writer like '%%'
	order by num desc)
where num=381;

-- 업로드 된 파일의 정보를 저장할 테이블
create table board_file(
	num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varchar2(100) not null, -- 원본 파일 명
	saveFileName varchar2(100) not null, -- 서버에 실제로 저장되는 파일 명
	fileSize number not null, -- 파일의 크기
	regdate date
);

create sequence board_file_seq;

CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
   	writer VARCHAR2(100), --댓글 작성자의 아이디
   	content VARCHAR2(500), --댓글 내용
   	target_id VARCHAR2(100), --댓글의 대상자 아이디
   	ref_group NUMBER,
   	comment_group NUMBER,
   	deleted CHAR(3) DEFAULT 'no',
   	regdate DATE
);

CREATE SEQUENCE board_cafe_comment_seq;

"select num, writer, content, target_id, ref_group," + 
					"	comment_group, deleted, board_cafe_comment.regdate, profile" + 
					" from board_cafe_comment" + 
					" inner join users" + 
					" on board_cafe_comment.writer=users.id"
					+ " where ref_group=?"
					+ " order by comment_group asc, num asc"