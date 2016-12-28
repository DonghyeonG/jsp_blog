create table address(
	no number(6) not null,
	name varchar(20) not null,
	phone varchar(20) not null,
	zipcode varchar(7) not null,
	address1 varchar(80) not null,
	address2 varchar(80) not null,
	wdate date not null,
	primary key(no)
)
--max(no)+1, 자동으로 no++시켜주기 위해서 사용
select nvl(max(no),0)+1 from address

--insert (C of CRUD)
insert into address (no,name,phone,zipcode,address1,address2,wdate)
values ((select nvl(max(no),0)+1 from address),'라이언','010-1212-1212','56125','서울시 종로구','관철동',sysdate)

--select (R of CRUD)
select *from address;

--update (U of CRUD)
update address set name='무지',address1='제주도',address2='다음카카오',phone='010-1313-1313' where no=2;

--delete (D of CRUD)
--delete from address where no=100;

--list
select no,name,TO_CHAR(wdate,'yyyy-mm-dd') wdate, r
from(
	select no,name,wdate, rownum r
	from(
		select no,name,wdate
		from address
		where wdate like '%11%'
		order by no desc
	)
)
--alter 
alter table address modify(address2 varchar(100));
alter table address modify(wdate date);

select no,name,wdate from address order by no desc