create table student(
	stunum number(5) 	primary key,
	name varchar2(10) 	not null,
	old number(10) not null,
	gender varchar2(10) not null,
	phonenum varchar2(20)
)
insert into student values(1001,'강동현',20,'남','010');
insert into student values(1002,'신중욱',30,'여','0111');
insert into student values(1003,'홍준혁',22,'남','0121856');
insert into student values(1004,'천일해',40,'여','01120');
insert into student values(1005,'최형택',28,'남','010');
insert into student values(1006,'이태규',80,'남','010');

update student set name='신중욱2', old=10  where  stunum=1002;

delete from student where stunum=1006 ;


select * from person;






CREATE TABLE TBL_ARTIST (
	ARTIST_ID		CHAR(4)					PRIMARY KEY,
	ARTIST_NAME		VARCHAR2(20),
	ARTIST_BIRTH		CHAR(8),
	ARTIST_GENDER	CHAR(1)			CHECK(ARTIST_GENDER IN('M', 'F')),
	TALENT		CHAR(1)			CHECK(TALENT IN('1', '2', '3')),
	AGENCY					VARCHAR2(20)
)
select * from TBL_ARTIST;
CREATE TABLE TBL_MENTO(
	MENTO_ID	CHAR(4)					PRIMARY KEY,
	MENTO_NAME	VARCHAR2(20)
)
select * from TBL_MENTO;

CREATE TABLE TBL_POINT(
	SERIAL_NO	CHAR(4)					PRIMARY KEY,
	ARTIST_ID	CHAR(4),
	MENTO_ID	CHAR(4),
	POINT		NUMBER(3)
)
select * from TBL_POINT;


select a.ARTIST_ID, a.ARTIST_NAME, nvl(sum(b.POINT),0)as a, avg(POINT), rank() over(order by avg(POINT) asc)as ho
from TBL_ARTIST a, TBL_POINT b
where a.ARTIST_ID=b.ARTIST_ID
group by a.ARTIST_ID, a.ARTIST_NAME
order by ho desc



insert into tbl_artist values('A001', '황스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist values('A002', '정스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist values('A003', '박스타', '19990301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist values('A004', '김스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist values('A005', '서스타', '20010501', 'F', '2', 'E엔터테이먼트');




INSERT INTO TBL_MENTO VALUES('J001', '이멘토');
INSERT INTO TBL_MENTO VALUES('J002', '안멘토');
INSERT INTO TBL_MENTO VALUES('J003', '한멘토');




INSERT INTO TBL_POINT VALUES('P001', 'A001', 'J001', 84);
INSERT INTO TBL_POINT VALUES('P002', 'A001', 'J002', 82);
INSERT INTO TBL_POINT VALUES('P003', 'A001', 'J003', 86);

INSERT INTO TBL_POINT VALUES('P004', 'A002', 'J001', 98);
INSERT INTO TBL_POINT VALUES('P005', 'A002', 'J002', 99);
INSERT INTO TBL_POINT VALUES('P006', 'A002', 'J003', 100);

INSERT INTO TBL_POINT VALUES('P007', 'A003', 'J001', 23);
INSERT INTO TBL_POINT VALUES('P008', 'A003', 'J002', 43);
INSERT INTO TBL_POINT VALUES('P009', 'A003', 'J003', 34);

INSERT INTO TBL_POINT VALUES('P010', 'A004', 'J001', 67);
INSERT INTO TBL_POINT VALUES('P011', 'A004', 'J002', 56);
INSERT INTO TBL_POINT VALUES('P012', 'A004', 'J003', 89);

INSERT INTO TBL_POINT VALUES('P013', 'A005', 'J001', 3);
INSERT INTO TBL_POINT VALUES('P014', 'A005', 'J002', 6);
INSERT INTO TBL_POINT VALUES('P015', 'A005', 'J003', 9);


