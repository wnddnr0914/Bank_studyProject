CREATE TABLE "PERSON" (
	"ID"	char(12)		NOT NULL,
	"NAME"	char(5)		NULL,
	"GENDER"	number		NULL,
	"YEAR"	number(3)		NULL
);
alter table
   PERSON
modify
(
   NAME    char(10)
);
--drop table PERSON CASCADE CONSTRAINTS;
--drop table ACCOUNT CASCADE CONSTRAINTS;
--drop table OWNACCOUNT CASCADE CONSTRAINTS;
--drop table ACC_W_D CASCADE CONSTRAINTS;
CREATE TABLE "ACCOUNT" (
	"ACC_CODE"	number		NOT NULL,
	"ACC_NAME"	char(10)		NULL
);

CREATE TABLE "OWNACCOUNT" (
	"ACC_NUM"	number(13)		NOT NULL,
	"BALANCE"	number		NULL,
	"ACC_CODE"	number		NOT NULL,
	"ID"	char(12)		NOT NULL
);

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

ALTER TABLE "OWNACCOUNT" ADD CONSTRAINT "FK_ACCOUNT_TO_OWNACCOUNT_1" FOREIGN KEY (
	"ACC_CODE"
)
REFERENCES "ACCOUNT" (
	"ACC_CODE"
);

ALTER TABLE "OWNACCOUNT" ADD CONSTRAINT "FK_PERSON_TO_OWNACCOUNT_1" FOREIGN KEY (
	"ID"
)
REFERENCES "PERSON" (
	"ID"
);

ALTER TABLE "ACC_W_D" ADD CONSTRAINT "FK_OWNACCOUNT_TO_ACC_W_D_1" FOREIGN KEY (
	"GET_ACC"
)
REFERENCES "OWNACCOUNT" (
	"ACC_NUM"
);

ALTER TABLE "ACC_W_D" ADD CONSTRAINT "FK_OWNACCOUNT_TO_ACC_W_D_2" FOREIGN KEY (
	"GIVE_ACC"
)
REFERENCES "OWNACCOUNT" (
	"ACC_NUM"
);
insert into PERSON values('tlswnddnr2','신중욱',0,12);
insert into PERSON values('qkralwjd','박미정',1,85);
insert into PERSON values('qkrwnsgud','박준형',0,61);
insert into PERSON values('wkdtndud','장수영',1,18);

insert into ACCOUNT values(1,'기본');
insert into ACCOUNT values(2,'적금');
insert into ACCOUNT values(3,'청약');

insert into OWNACCOUNT values(11,0,1,'tlswnddnr2');
insert into OWNACCOUNT values(12,100000,3,'qkralwjd');
insert into OWNACCOUNT values(13,0,2,'qkrwnsgud');
insert into OWNACCOUNT values(14,0,1,'wkdtndud');

select * from PERSON;
select * from ACCOUNT;
select * from OWNACCOUNT;






