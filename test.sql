select Activation from person where acc_num=?



CREATE TABLE "PERSON" (
	"ID"	varchar(20)		primary key,
	"NAME"	varchar(30)		NULL,
	"GENDER"	number(13)		NULL,
	"YEAR"	number(3)		NULL,
	"PASS"	varchar(20)		NULL,
	"ACTIVATION"	number(1)		NULL
);




select *from PERSON;
update PERSON set ACTIVATION=1;

insert into ACCOUNT values(0,'자유','자유는 어쩌고 저쩌고');
insert into ACCOUNT values(1,'적금','적금은 어쩌고 저쩌고');
insert into ACCOUNT values(2,'예금','예금은 어쩌고 저쩌고');
insert into ACCOUNT values(3,'청약','청약은 어쩌고 저쩌고');

update OWNACCOUNT set BALANCE=100000 where ACC_NUM=27299575;

insert into val
CREATE TABLE "ACCOUNT" (
	"ACC_CODE"	number(13)		NOT NULL,
	"ACC_NAME"	varchar(10)		NULL,
	"ACC_EX"	varchar(200)		NULL
);

CREATE TABLE "OWNACCOUNT" (
	"ACC_NUM"	number(13)		NOT NULL,
	"BALANCE"	number(10)		NULL,
	"ACC_CODE"	number(10)		NOT NULL,
	"ID"	varchar(12)		NOT NULL
);
select * from OWNACCOUNT;
CREATE TABLE "ACC_W_D" (
	"Key"	number		NOT NULL,
	"MONEY"	number(7)		NULL,
	"TRA_TIME"	timestamp		NULL,
	"GET_ACC"	number(13)		NOT NULL,
	"GIVE_ACC"	number(13)		NOT NULL
);

ALTER TABLE "PERSON" ADD CONSTRAINT "PK_PERSON" PRIMARY KEY (
	"ID"
);

ALTER TABLE "ACCOUNT" ADD CONSTRAINT "PK_ACCOUNT" PRIMARY KEY (
	"ACC_CODE"
);

ALTER TABLE "OWNACCOUNT" ADD CONSTRAINT "PK_OWNACCOUNT" PRIMARY KEY (
	"ACC_NUM"
);

ALTER TABLE "ACC_W_D" ADD CONSTRAINT "PK_ACC_W_D" PRIMARY KEY (
	"Key"
);

