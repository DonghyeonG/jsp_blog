drop table images

-- create
create table images( 
no	 number not null, 	-- 게시글번호
wname	 varchar(20) not null,	-- 등록자
title    varchar(30) not null,	-- 제목
content  varchar(100) not null,	-- 내용
passwd varchar(20) not null,	-- 비밀번호
viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
grpno 	 NUMBER(7) DEFAULT 0,	-- 부모글 번호
indent	 NUMBER(2) DEFAULT 0,	-- 답변여부, 답변의 깊이
ansnum 	 NUMBER(5) DEFAULT 0,	-- 답변순서
fname varchar(50) default 'default.jpg',	-- 파일이름 
primary key(no)
);

ALTER TABLE images
ADD (refno number(5) default 0);



--insert
INSERT INTO images(no, wname, title, content, passwd, wdate, grpno, fname)  
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM images), 
'말숙이', '주제', '내용', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 FROM images), 'woman.jpg')

  --list

   전체 글 목록(S:Total Select List), 최신글 먼저 출력 
   - ASC: 오름 차순, DESC: 내림 차순   
   
	 SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname, r
   	 from(  
   		SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname, rownum r
			   	from(
					SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname
					FROM images  
					--where title like '%게시판%'
					ORDER BY grpno DESC, ansnum 
				    )
  		  ) where r>=9 and r<=14
  		  
    조회수 증가 
	UPDATE images 
	SET viewcnt = viewcnt + 1 
	WHERE bbsno=1; 
	
	
	1건의 글 보기(R:Read, PK 사용) 
	SELECT no, wname, title, content, password, grpno, indent, ansnum, filename
	FROM images
	WHERE bbsno = 5; 

select * from images;

delete from
