CREATE TABLE "PERSON" (
	"ID"	varchar(20)		NOT NULL,
	"NAME"	varchar(30)		NULL,
	"GENDER"	number(13)		NULL,
	"YEAR"	number(3)		NULL,
	"PASS"	varchar(20)		NULL
);
SELECT * FROM ACCOUNT;
insert into ACCOUNT values(3,'예금','사람이 예금을 해야지 어쩌고 저쩌고 예금통장은 정말 좋아(홍보)');

drop table person;
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

