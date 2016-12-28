drop table team;

create table team(
	no	number not null,
	name varchar(20) not null,
	gender varchar(5) not null,
	phone varchar(20) not null,
	zipcode varchar(6) not null,
	address1 varchar(100) not null,
	address2 varchar(100) not null,
	skill varchar(100) not null,
	hobby varchar(100) not null,
	filename varchar(50) default 'member.jpg',
	primary key(no)
)

select nvl(max(no),0)+1 from team;

--insert
insert into team(no,name,gender,phone,zipcode,address1,address2,skill,hobby,filename)
values((select nvl(max(no),0)+1 from team),'홍길동','남자','010-5641-5694','12345','서울시 종로구','관철동','java,JSP,MVC','독서','member.jpg');

--read
select*from team
where no=1

--update
update team
set phone='010-3265-7491',
zipcode='02154',
address1='서울시 강남구',
address2='역삼로',
skill='Java,Spring',
hobby='운동'
where no=2;

--delete
--delete from team
where no=5

--
update team
set filename='라이언.jpg'
where no between 9 and 11;

update team
set filename='프로도.jpg'
where no between 7 and 8;

update team
set filename='네오.jpg'
where no between 4 and 6;

update team
set filename='무지.jpg'
where no between 1 and 3;

update team
set filename='친구.jpg'
where no=12;
select name,gender,phone,zipcode,address1,address2,skill,hobby,filename from team

--list
select no,name,phone,skill,filename, r
from(
	select no,name,phone,skill,filename,rownum r
	from(
		select no,name,phone,skill,filename
		from team
		where name like '%길%'
		order by no desc
	)
)where r>=1 and r<=5