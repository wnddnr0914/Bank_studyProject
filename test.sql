
CREATE TABLE "PERSON" (
	"ID"	char(20)		NOT NULL,
	"NAME"	char(30)		NULL,
	"GENDER"	number(13)		NULL,
	"YEAR"	number(3)		NULL,
	"pw"	char(20)		NULL
);
select *from OWNACCOUNT;
delete OWNACCOUNT where balance=0;
update ownaccount set balance=10000 where acc_num=2111450678; 
insert into ACCOUNT values(3,'예금');
CREATE TABLE "ACCOUNT" (
	"ACC_CODE"	number(13)		NOT NULL,
	"ACC_NAME"	char(10)		NULL
);

CREATE TABLE "OWNACCOUNT" (
	"ACC_NUM"	number(13)		NOT NULL,
	"BALANCE"	number(10)		NULL,
	"ACC_CODE"	number(10)		NOT NULL,
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
