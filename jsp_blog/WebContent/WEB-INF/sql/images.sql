drop table images

-- create
create table images( 
no	 number not null, 	-- �Խñ۹�ȣ
wname	 varchar(20) not null,	-- �����
title    varchar(30) not null,	-- ����
content  varchar(100) not null,	-- ����
passwd varchar(20) not null,	-- ��й�ȣ
viewcnt NUMBER(5)     DEFAULT 0, -- ��ȸ��, �⺻�� ��� 
wdate   DATE          NOT NULL,  -- ��� ��¥, sysdate 
grpno 	 NUMBER(7) DEFAULT 0,	-- �θ�� ��ȣ
indent	 NUMBER(2) DEFAULT 0,	-- �亯����, �亯�� ����
ansnum 	 NUMBER(5) DEFAULT 0,	-- �亯����
fname varchar(50) default 'default.jpg',	-- �����̸� 
primary key(no)
);

ALTER TABLE images
ADD (refno number(5) default 0);



--insert
INSERT INTO images(no, wname, title, content, passwd, wdate, grpno, fname)  
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM images), 
'������', '����', '����', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 FROM images), 'woman.jpg')

  --list

   ��ü �� ���(S:Total Select List), �ֽű� ���� ��� 
   - ASC: ���� ����, DESC: ���� ����   
   
	 SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname, r
   	 from(  
   		SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname, rownum r
			   	from(
					SELECT no, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, fname
					FROM images  
					--where title like '%�Խ���%'
					ORDER BY grpno DESC, ansnum 
				    )
  		  ) where r>=9 and r<=14
  		  
    ��ȸ�� ���� 
	UPDATE images 
	SET viewcnt = viewcnt + 1 
	WHERE bbsno=1; 
	
	
	1���� �� ����(R:Read, PK ���) 
	SELECT no, wname, title, content, password, grpno, indent, ansnum, filename
	FROM images
	WHERE bbsno = 5; 

select * from images;

delete from
