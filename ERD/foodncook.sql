
/* Drop Tables */

DROP TABLE a_reg_people CASCADE CONSTRAINTS;
DROP TABLE a_cook_class CASCADE CONSTRAINTS;
DROP TABLE a_purchase CASCADE CONSTRAINTS;
DROP TABLE a_sell_recipe CASCADE CONSTRAINTS;
DROP TABLE reg_people CASCADE CONSTRAINTS;
DROP TABLE cook_class CASCADE CONSTRAINTS;
DROP TABLE notify CASCADE CONSTRAINTS;
DROP TABLE purchase CASCADE CONSTRAINTS;
DROP TABLE p_review CASCADE CONSTRAINTS;
DROP TABLE r_comment CASCADE CONSTRAINTS;
DROP TABLE r_like CASCADE CONSTRAINTS;
DROP TABLE recipe CASCADE CONSTRAINTS;
DROP TABLE r_product CASCADE CONSTRAINTS;
DROP TABLE ur_comment CASCADE CONSTRAINTS;
DROP TABLE ur_like CASCADE CONSTRAINTS;
DROP TABLE user_recipe CASCADE CONSTRAINTS;
DROP TABLE user_info CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE a_cook_class
(
	cno number NOT NULL,
	name varchar2(30) NOT NULL,
	people number NOT NULL,
	category number NOT NULL,
	enddate timestamp NOT NULL,
	dday date NOT NULL,
	c_content varchar2(3000) NOT NULL,
	c_address varchar2(100) NOT NULL,
	c_price number NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (cno)
);


CREATE TABLE a_purchase
(
	email varchar2(30) NOT NULL,
	pid  NOT NULL,
	price  NOT NULL,
	name varchar2(20) NOT NULL,
	deliver varchar2(100) NOT NULL,
	phone varchar2(20) NOT NULL,
	buydate timestamp NOT NULL DEAULT sysdate,
	deliverchk number NOT NULL,
	pchk  NOT NULL
);


CREATE TABLE a_reg_people
(
	cno number NOT NULL,
	email varchar2(30) NOT NULL
);


CREATE TABLE a_sell_recipe
(
	user_rid number NOT NULL,
	name varchar2(30) NOT NULL,
	taste varchar2(100) NOT NULL,
	kind number NOT NULL,
	img varchar2(100) NOT NULL,
	ingredient varchar2(500) NOT NULL,
	regdate timestamp default sysdate,
	recipe_1 varchar2(200),
	recipe_2 varchar2(200),
	recipe_3 varchar2(200),
	recipe_4 varchar2(200),
	recipe_5 varchar2(200),
	recipe_6 varchar2(200),
	recipe_7 varchar2(200),
	recipe_8 varchar2(200),
	recipe_9 varchar2(200),
	recipe_10 varchar2(200),
	email varchar2(30) NOT NULL,
	PRIMARY KEY (user_rid)
);


CREATE TABLE cook_class
(
	cno number NOT NULL,
	name varchar2(30) NOT NULL,
	people number NOT NULL,
	kind number NOT NULL,
	enddate timestamp NOT NULL,
	dday date NOT NULL,
	c_content varchar2(3000) NOT NULL,
	c_address varchar2(100) NOT NULL,
	c_price number NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (cno)
);


CREATE TABLE notify
(
	email varchar2(30) NOT NULL,
	user_rid number NOT NULL,
	UNIQUE (email, user_rid)
);


CREATE TABLE purchase
(
	email varchar2(30) NOT NULL,
	pid number NOT NULL,
	price number NOT NULL,
	name varchar2(20) NOT NULL,
	deliver varchar2(100) NOT NULL,
	phone varchar2(20) NOT NULL,
	buydate timestamp NOT NULL DEAULT sysdate,
	deliverchk number NOT NULL,
	pchk number NOT NULL
);


CREATE TABLE p_review
(
	pcid number NOT NULL,
	p_comment varchar2(300) NOT NULL,
	r_img varchar2(200),
	r_score number,
	email varchar2(30) NOT NULL,
	pid  NOT NULL,
	PRIMARY KEY (pcid)
);


CREATE TABLE recipe
(
	user_rid number NOT NULL,
	name varchar2(30) NOT NULL,
	taste varchar2(100) NOT NULL,
	kind number NOT NULL,
	img varchar2(100) NOT NULL,
	ingredient varchar2(500) NOT NULL,
	recipe_1 varchar2(200),
	recipe_2 varchar2(200),
	recipe_3 varchar2(200),
	recipe_4 varchar2(200),
	recipe_5 varchar2(200),
	recipe_6 varchar2(200),
	recipe_7 varchar2(200),
	recipe_8 varchar2(200),
	recipe_9 varchar2(200),
	recipe_10 varchar2(200),
	PRIMARY KEY (user_rid)
);


CREATE TABLE reg_people
(
	email varchar2(30) NOT NULL,
	cno number NOT NULL,
	UNIQUE (email, cno)
);


CREATE TABLE r_comment
(
	cid number NOT NULL,
	content varchar2(200),
	regdate timestamp default sysdate,
	user_rid number NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (cid)
);


CREATE TABLE r_like
(
	email varchar2(30) NOT NULL,
	user_rid number NOT NULL,
	UNIQUE (email, user_rid)
);


CREATE TABLE r_product
(
	pid  NOT NULL,
	p_price  NOT NULL,
	p_content varchar2(1000) NOT NULL,
	p_count number,
	user_rid number NOT NULL,
	PRIMARY KEY (pid)
);


CREATE TABLE ur_comment
(
	cid number NOT NULL,
	content varchar2(200),
	regdate timestamp default sysdate,
	user_rid number NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (cid)
);


CREATE TABLE ur_like
(
	email varchar2(30) NOT NULL,
	user_rid number NOT NULL,
	UNIQUE (email, user_rid)
);


CREATE TABLE user_info
(
	email varchar2(30) NOT NULL,
	pw varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL UNIQUE,
	address varchar2(100) NOT NULL,
	tel varchar2(20) NOT NULL,
	taste varchar2(100) NOT NULL,
	kind number,
	img varchar2(100),
	score number,
	u_check number,
	PRIMARY KEY (email)
);


CREATE TABLE user_recipe
(
	user_rid number NOT NULL,
	name varchar2(30) NOT NULL,
	kind number NOT NULL,
	taste varchar2(100) NOT NULL,
	img varchar2(100) NOT NULL,
	ingredient varchar2(500) NOT NULL,
	regdate timestamp default sysdate,
	recipe_1 varchar2(200),
	recipe_2 varchar2(200),
	recipe_3 varchar2(200),
	recipe_4 varchar2(200),
	recipe_5 varchar2(200),
	recipe_6 varchar2(200),
	recipe_7 varchar2(200),
	recipe_8 varchar2(200),
	recipe_9 varchar2(200),
	recipe_10 varchar2(200),
	email varchar2(30) NOT NULL,
	PRIMARY KEY (user_rid)
);



/* Create Foreign Keys */

ALTER TABLE a_reg_people
	ADD FOREIGN KEY (cno)
	REFERENCES a_cook_class (cno)
;


ALTER TABLE reg_people
	ADD FOREIGN KEY (cno)
	REFERENCES cook_class (cno)
;


ALTER TABLE r_comment
	ADD FOREIGN KEY (user_rid)
	REFERENCES recipe (user_rid)
;


ALTER TABLE r_like
	ADD FOREIGN KEY (user_rid)
	REFERENCES recipe (user_rid)
;


ALTER TABLE p_review
	ADD FOREIGN KEY (pid)
	REFERENCES r_product (pid)
;


ALTER TABLE cook_class
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE notify
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE purchase
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE p_review
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE reg_people
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE r_comment
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE r_like
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE ur_comment
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE ur_like
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE user_recipe
	ADD FOREIGN KEY (email)
	REFERENCES user_info (email)
;


ALTER TABLE notify
	ADD FOREIGN KEY (user_rid)
	REFERENCES user_recipe (user_rid)
;


ALTER TABLE r_product
	ADD FOREIGN KEY (user_rid)
	REFERENCES user_recipe (user_rid)
;


ALTER TABLE ur_comment
	ADD FOREIGN KEY (user_rid)
	REFERENCES user_recipe (user_rid)
;


ALTER TABLE ur_like
	ADD FOREIGN KEY (user_rid)
	REFERENCES user_recipe (user_rid)
;

SELECT * FROM RECIPE r ;

SELECT * FROM USER_INFO ORDER BY user_id desc;
SELECT * FROM USER_AUTH ORDER BY user_id desc;
SELECT * FROM user_info WHERE name = 'aaa' AND tel = '01011112222' ;

SELECT * FROM RECIPE r ;

SELECT * FROM USER_RECIPE ur ;

SELECT * FROM USER_AUTH ua ;

SELECT * FROM R_LIKE rl ;

SELECT * FROM UR_LIKE ul ;

SELECT * FROM UR_LIKE ul ;
UPDATE USER_AUTH SET AUTH = 'ROLE_ADMIN' WHERE USER_ID = 105;

ALTER TABLE UR_LIKE ADD preference NUMBER; 

DELETE FROM USER_INFO WHERE EMAIL = 'aaa123@naver.com';
DELETE FROM USER_AUTH WHERE EMAIL = 'sopsop111@naver.com';

SELECT COUNT(*) FROM USER_INFO WHERE EMAIL = 'sopsop111@naver.com';

SELECT * FROM USER_AUTH WHERE USER_ID  = (SELECT USER_ID FROM USER_INFO WHERE EMAIL = 'sopsop111@naver.com');

CREATE TABLE user_auth (
   email varchar2(50) NOT NULL,
   auth varchar2(50) NOT NULL,
   CONSTRAINT fk_member_auth FOREIGN KEY(email) REFERENCES user_info(email),
   PRIMARY KEY(email, auth) -- 복합키
);

ALTER TABLE USER_INFO MODIFY pw varchar2(100); 

SELECT * FROM RECIPE WHERE KIND = 1 AND TASTE = 3;

SELECT user_id, pid, r_score FROM P_REVIEW;

--------------------------------------------------------
--  파일이 생성됨 - 일요일-11월-29-2020   
--------------------------------------------------------
DROP TABLE "RECIPE"."A_COOK_CLASS" cascade constraints;
DROP TABLE "RECIPE"."A_PURCHASE" cascade constraints;
DROP TABLE "RECIPE"."A_REG_PEOPLE" cascade constraints;
DROP TABLE "RECIPE"."A_SELL_RECIPE" cascade constraints;
DROP TABLE "RECIPE"."COOK_CLASS" cascade constraints;
DROP TABLE "RECIPE"."NOTIFY" cascade constraints;
DROP TABLE "RECIPE"."PURCHASE" cascade constraints;
DROP TABLE "RECIPE"."P_REVIEW" cascade constraints;
DROP TABLE "RECIPE"."RECIPE" cascade constraints;
DROP TABLE "RECIPE"."REG_PEOPLE" cascade constraints;
DROP TABLE "RECIPE"."R_COMMENT" cascade constraints;
DROP TABLE "RECIPE"."R_LIKE" cascade constraints;
DROP TABLE "RECIPE"."R_PRODUCT" cascade constraints;
DROP TABLE "RECIPE"."UR_COMMENT" cascade constraints;
DROP TABLE "RECIPE"."UR_LIKE" cascade constraints;
DROP TABLE "RECIPE"."USER_AUTH" cascade constraints;
DROP TABLE "RECIPE"."USER_INFO" cascade constraints;
DROP TABLE "RECIPE"."USER_RECIPE" cascade constraints;
--------------------------------------------------------
--  DDL for Table A_COOK_CLASS
--------------------------------------------------------

  CREATE TABLE "RECIPE"."A_COOK_CLASS" 
   (	
   "CNO" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"PEOPLE" NUMBER, 
	"CATEGORY" NUMBER, 
	"ENDDATE" TIMESTAMP (6), 
	"DDAY" DATE, 
	"C_CONTENT" VARCHAR2(3000 BYTE), 
	"C_ADDRESS" VARCHAR2(100 BYTE), 
	"C_PRICE" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table A_PURCHASE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."A_PURCHASE" 
   (	
    "USER_ID" NUMBER, 
	"PID" NUMBER, 
	"PRICE" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"DELIVER" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"BUYDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DELIVERCHK" NUMBER, 
	"PCHK" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table A_REG_PEOPLE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."A_REG_PEOPLE" 
   (	
    "CNO" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table A_SELL_RECIPE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."A_SELL_RECIPE" 
   (	
    "USER_RID" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"TASTE" NUMBER, 
	"KIND" NUMBER, 
	"IMG" VARCHAR2(100 BYTE), 
	"INGREDIENT" VARCHAR2(500 BYTE), 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"RECIPE_1" VARCHAR2(200 BYTE), 
	"RECIPE_2" VARCHAR2(200 BYTE), 
	"RECIPE_3" VARCHAR2(200 BYTE), 
	"RECIPE_4" VARCHAR2(200 BYTE), 
	"RECIPE_5" VARCHAR2(200 BYTE), 
	"RECIPE_6" VARCHAR2(200 BYTE), 
	"RECIPE_7" VARCHAR2(200 BYTE), 
	"RECIPE_8" VARCHAR2(200 BYTE), 
	"RECIPE_9" VARCHAR2(200 BYTE), 
	"RECIPE_10" VARCHAR2(200 BYTE), 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COOK_CLASS
--------------------------------------------------------

  CREATE TABLE "RECIPE"."COOK_CLASS" 
   (	
    "CNO" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"PEOPLE" NUMBER, 
	"KIND" NUMBER, 
	"ENDDATE" TIMESTAMP (6), 
	"DDAY" DATE, 
	"C_CONTENT" VARCHAR2(3000 BYTE), 
	"C_ADDRESS" VARCHAR2(100 BYTE), 
	"C_PRICE" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTIFY
--------------------------------------------------------

  CREATE TABLE "RECIPE"."NOTIFY" 
   (	
    "USER_ID" NUMBER, 
	"USER_RID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PURCHASE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."PURCHASE" 
   (	
    "USER_ID" NUMBER, 
	"PID" NUMBER, 
	"PRICE" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"DELIVER" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"BUYDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DELIVERCHK" NUMBER, 
	"PCHK" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_REVIEW
--------------------------------------------------------

  CREATE TABLE "RECIPE"."P_REVIEW" 
   (	"PCID" NUMBER, 
	"P_COMMENT" VARCHAR2(300 BYTE), 
	"R_IMG" VARCHAR2(200 BYTE), 
	"R_SCORE" NUMBER, 
	"USER_ID" NUMBER, 
	"PID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RECIPE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."RECIPE" 
   (	
    "RID" NUMBER, 
	"NAME" VARCHAR2(50 BYTE), 
	"TASTE" NUMBER, 
	"KIND" NUMBER, 
	"IMG" VARCHAR2(100 BYTE), 
	"INGREDIENT" VARCHAR2(500 BYTE), 
	"RECIPE_1" VARCHAR2(500 BYTE), 
	"RECIPE_2" VARCHAR2(500 BYTE), 
	"RECIPE_3" VARCHAR2(500 BYTE), 
	"RECIPE_4" VARCHAR2(500 BYTE), 
	"RECIPE_5" VARCHAR2(500 BYTE), 
	"RECIPE_6" VARCHAR2(500 BYTE), 
	"RECIPE_7" VARCHAR2(500 BYTE), 
	"RECIPE_8" VARCHAR2(500 BYTE), 
	"RECIPE_9" VARCHAR2(500 BYTE), 
	"RECIPE_10" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REG_PEOPLE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."REG_PEOPLE" 
   (	
    "USER_ID" NUMBER, 
	"CNO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table R_COMMENT
--------------------------------------------------------

  CREATE TABLE "RECIPE"."R_COMMENT" 
   (	
    "CID" NUMBER, 
	"CONTENT" VARCHAR2(200 BYTE), 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"USER_RID" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table R_LIKE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."R_LIKE" 
   (	
    "USER_ID" NUMBER, 
	"USER_RID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table R_PRODUCT
--------------------------------------------------------

  CREATE TABLE "RECIPE"."R_PRODUCT" 
   (	
    "PID" NUMBER, 
	"P_PRICE" NUMBER, 
	"P_CONTENT" VARCHAR2(1000 BYTE), 
	"P_COUNT" NUMBER, 
	"P_NAME" VARCHAR2(100 BYTE), 
	"P_IMG" VARCHAR2(20 BYTE), 
	"P_KIND" NUMBER, 
	"P_TASTE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UR_COMMENT
--------------------------------------------------------

  CREATE TABLE "RECIPE"."UR_COMMENT" 
   (	
    "CID" NUMBER, 
	"CONTENT" VARCHAR2(200 BYTE), 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"USER_RID" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UR_LIKE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."UR_LIKE" 
   (	
    "USER_ID" NUMBER, 
	"USER_RID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_AUTH
--------------------------------------------------------

  CREATE TABLE "RECIPE"."USER_AUTH" 
   (	
    "USER_ID" NUMBER, 
	"AUTH" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_INFO
--------------------------------------------------------

  CREATE TABLE "RECIPE"."USER_INFO" 
   (	
    "USER_ID" NUMBER,
    "EMAIL" VARCHAR2(30 BYTE), 
	"PW" VARCHAR2(100 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"TEL" VARCHAR2(20 BYTE), 
	"TASTE" VARCHAR2(100 BYTE), 
	"KIND" VARCHAR2(20 BYTE), 
	"IMG" VARCHAR2(100 BYTE), 
	"SCORE" NUMBER, 
	"U_CHECK" NUMBER, 
	"ENABLED" CHAR(1 BYTE) DEFAULT '1'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_RECIPE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."USER_RECIPE" 
   (	
    "USER_RID" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"KIND" NUMBER, 
	"TASTE" NUMBER, 
	"IMG" VARCHAR2(100 BYTE), 
	"INGREDIENT" VARCHAR2(500 BYTE), 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"RECIPE_1" VARCHAR2(200 BYTE), 
	"RECIPE_2" VARCHAR2(200 BYTE), 
	"RECIPE_3" VARCHAR2(200 BYTE), 
	"RECIPE_4" VARCHAR2(200 BYTE), 
	"RECIPE_5" VARCHAR2(200 BYTE), 
	"RECIPE_6" VARCHAR2(200 BYTE), 
	"RECIPE_7" VARCHAR2(200 BYTE), 
	"RECIPE_8" VARCHAR2(200 BYTE), 
	"RECIPE_9" VARCHAR2(200 BYTE), 
	"RECIPE_10" VARCHAR2(200 BYTE), 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into RECIPE.A_COOK_CLASS
SET DEFINE OFF;
REM INSERTING into RECIPE.A_PURCHASE
SET DEFINE OFF;
REM INSERTING into RECIPE.A_REG_PEOPLE
SET DEFINE OFF;
REM INSERTING into RECIPE.A_SELL_RECIPE
SET DEFINE OFF;
REM INSERTING into RECIPE.COOK_CLASS
SET DEFINE OFF;
REM INSERTING into RECIPE.NOTIFY
SET DEFINE OFF;
REM INSERTING into RECIPE.PURCHASE
SET DEFINE OFF;
REM INSERTING into RECIPE.P_REVIEW
SET DEFINE OFF;
REM INSERTING into RECIPE.RECIPE
SET DEFINE OFF;
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (3,'오색지라시 스시',1,3,'3.png','밥 210g(1공기), 배합초, 식초 20g(1⅓큰술), 설탕 10g(2작은술), 소금 약간, 달걀노른자 40g(달걀2개), 표고버섯 10g(1장), 새송이버섯 20g(3개), 새우 25g(4마리), 홍피망 10g(1/8개), 청피망 10g(1/8개), 양파 5g(5×1cm), 대두유 20g(1⅓큰술), 참기름 10g(2작은술), 식용유 약간','배합초는 중불에서 설탕이 녹을 때까지 저어가면서 녹인다.','뜨거운 밥에 배합초를 넣어서 밥알이 으깨지지 않게 고루 저어가면서 밥을 체온 정도로 식힌다.','표고버섯은 기둥을 떼고 끓는 물에 데친 후 찬물에 헹궈 물기를 없애고 얇게 썰어 달궈진 팬에 참기름을 두르고 볶는다.','새송이버섯은 세로로 얇게 썰어 달궈진 팬에 참기름을 두르고 볶는다.','달걀노른자를 고루 풀어 약한 불에 지단을 부친 후 채썬다.','청피망과 홍피망은 채를 썬후 달궈진 팬에 기름을 두르고 볶는다.','양파는 채를 썰어 찬물에 담가 매운맛을 제거한 뒤 달궈진 팬에 기름을 두르고 살짝 볶는다.','새우는 껍질을 벗기고 등쪽 2~3마디에 있는 내장을 꼬챙이로 꺼내고 물에 헹궈 물기를 뺀 다음 기름을 두르고 볶는다.','초밥 위에 청피망, 홍피망, 양파, 달걀노른자, 새송이버섯, 표고버섯, 새우를 가지런히 놓는다.',null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (1,'고구마죽',1,1,'1.png','고구마 100g(2/3개), 설탕 2g(1/3작은술), 찹쌀가루 3g(2/3작은술),물 200ml(1컵), 잣 8g(8알)','고구마는 깨끗이 씻어서 껍질을 벗기고 4cm 정도로 잘라준다.','찜기에 고구마를 넣고 20~30분 정도 삶아 주고, 블렌더나 체를 이용하여 잘 으깨어 곱게 만든다.','고구마와 물을 섞어 끓이면서 찹쌀가루로 농도를 맞추고 설탕을 넣어 맛을 낸다.','잣을 팬에 노릇하게 볶아 다져서 고구마 죽에 섞는다. 기호에 따라 고구마를 튀겨 얹어 먹어도 좋다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (2,'누룽지 두부 계란죽',1,1,'2.png','애호박 30g(1/6개), 표고버섯 20g(2개), 당근 5g(3×2×1cm), 누룽지 70g(1/3컵), 순두부 100g(1/4모), 달걀 50g(1개),참기름 3g(2/3작은술), 소금 약간, 참깨 약간, 흰 후추 약간','깨끗이 씻어 손질한 애호박, 당근과 기둥을 뗀 표고버섯을 잘게 다지듯이 썬다.','누룽지는 1cm 정도로 잘게 부숴준다.','냄비에 참기름을 두르고 썰어놓은 채소를 볶다가 누룽지와 물을 넣고 끓인다.','누룽지가 살짝 퍼지면 순두부를 넣고 흰후추와 소금을 넣는다.','죽이 끓으면 달걀을 풀어 넣고 한 소끔 끓여낸 후 참깨를 뿌려 마무리 한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (4,'두부 곤약 나물 비빔밥',1,1,'4.png','두부 110g(1/3모), 흰쌀 15g, 현미쌀 3g, 찹쌀 3g, 실곤약 3g, 콩나물 15g(15개), 표고버섯 4g(1/2장), 애호박 10g(5×2×1cm), 고사리 15g(7줄기), 당근 15g(5×3×1cm), 소금 3g(2/3작은술), 소금 약간, 초고추장 5g(1작은술), 플레인요거트 10g(2작은술), 참기름 2g(1/3작은술), 새싹채소 3g','고사리는 상태에 따라 2~5시간 정도 불린 후 30분 정도 삶아 찬물에 헹구어 물기를 짠다.','콩나물은 다듬어서 끓는 물에 데친후 건져 식힌다.','불린 표고버섯은 물기를 짜서 채를 썰고, 당근, 애호박은 길이 3cm 정도로 채를 썰어 끓는 소금물에 살짝 데쳐 찬물에 헹구어 물기를 짜서 준비한다.','흰쌀, 현미쌀, 찹쌀을 깨끗하게 씻고, 30분 이상 불려 쌀에 1.2배의 물을 붓고 곤약을 넣어 밥을 짓는다.','그릇에 밥과 준비된 재료를 넣어 소금으로 간을 하여 고루 버무려 준다.','초고추장, 플레인요거트와 참기름을 섞어 비빔고추장 소스를 준비한다.','두부는 1.5×1.5×3cm로 자르고 잠길 만큼의 물을 붓고 3~4분정도 끓인 후 속을 파내어 그 속에 버무린 밥을 올린다.','새싹채소를 올려 준 후, 비빔고추 장소스를 곁들여 준다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (5,'닭개장 비빔밥',1,1,'5.png','쌀 90g, 검은 쌀 10g, 닭가슴살 40g(1/3개), 월계수 잎 2장, 후추 약간, 숙주 20g(1/20봉지), 토란대 20g(5cm, 5개), 고사리 20g(10줄기), 달걀 50g(1개), 대파 10g(5cm), 들기름 5g(1작은술), 실고추약간, 소금약간, 들깨가루 15g(1큰술), 고추기름 10g(2작은술), 꿀 8g(1과2/3작은술), 저염간장 8g(1과2/3작은술)','쌀은 30분 정도 불린 후 물을 1:1로 하여 밥을 짓는다.','숙주는 끓는 소금물에 넣어 숨이 죽으면 찬물에 헹구어 물기를 뺀다.','고사리는 상태에 따라 2~5시간정도 불린 후 30분 정도 삶아 찬물에 헹구어 물기를 짠다.','말린 토란대는 미지근한 물에 하루정도 담갔다가 끓는 물에 넣어 끓이다가 물러지면 꺼내어 미지근한 물에 1~2일 담구어 아린 맛을 뺀다.','숙주, 토란대, 고사리는 따로 들기름에 살짝 볶아 준다.','대파는 파채를 썰은 후 물에 담가매운맛을 제거한다.','달걀은 지단을 부치고 채를 썬다.','닭가슴살은 손질을 하여 냄비에 잠길 정도로 물을 붓고 누린내 제거를 위해 월계수잎과 후추를 넣고 15~20분 정도 삶아 식혀서 고기의 결대로 찢는다.','들깨가루, 고추기름, 꿀, 저염간장을 함께 섞어 소스를 만든다.','그릇에 밥을 담고 준비된 고명을 올린 후 소스를 곁들인다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (6,'곰취 쌈밥',1,1,'6.png','잡곡밥 140g(2/3공기), 곰취 30g, 소금 약간, 조갯살 10g, 새우살 10g, 오징어살 15g, 감자 18g(1/6개), 애호박 18g(1/9개), 양파 15g(1/8개), 청양고추 2g(1/5개), 표고버섯 5g(1/2장), 대파 2g(1cm), 마늘 3g(1/2쪽), 쌈장 10g(2작은술), 설탕 약간, 참기름 약간, 카놀라유 5g(1작은술), 고춧가루 약간, 무 65g(6×5×2cm), 식초 30g(2큰술), 설탕 15g(1큰술), 물 50ml(1/4컵)','잡곡을 깨끗하게 씻고 물에 30분 정도 불려 물을 1:1로 하여 밥이 끓으면 약한 불로 줄이고 뜸을 들여 고슬고슬한 밥을 지어 한입 크기로 뭉쳐 놓는다.','무는 채를 썰어 초절임물에 절여 놓는다.','감자, 애호박, 양파, 청양고추, 표고버섯, 대파, 마늘을 잘게 다져 준비하고 조갯살, 새우살, 오징어살을 곱게 다진다.','달궈진 프라이팬에 기름을 두르고, 감자를 먼저 볶다가 투명해지면 나머지 채소를 볶는다.','다른 팬에 기름을 두르고 다진 해산물을 볶아 준비한다.','볶은 채소 팬(4)에 볶은 해산물(5)을 넣고 쌈장, 고춧가루, 설탕, 참기름을 넣어 되직하게 볶아 쌈장을 완성한다.','곰취는 끓는 소금물에 데쳐 찬물에 식힌 후 물기를 제거하여 준비 한다.','곰취잎을 넓게 편 후 잡곡밥과 무채절임, 쌈장을 넣고 먹기 좋은 크기로 말아 완성한다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (7,'새우 두부 계란찜',4,1,'7.png','연두부 75g(3/4모), 칵테일새우 20g(5마리), 달걀 30g(1/2개), 생크림 13g(1큰술), 설탕 5g(1작은술), 무염버터 5g(1작은술), 시금치 10g(3줄기)','손질된 새우를 끓는 물에 데쳐 건진다.','연두부, 달걀, 생크림, 설탕에 녹인 무염버터를 믹서에 넣고 간 뒤 새우(1)를 함께 섞어 그릇에 담는다.','시금치를 잘게 다져 혼합물 그릇(2)에 뿌리고 찜기에 넣고 중간 불에서 10분 정도 찐다.',null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (8,'부추 콩가루 찜',4,1,'8.png','조선부추 50g, 날콩가루 7g(1과1/3작은술), 저염간장 3g(2/3작은술), 다진 대파 5g(1작은술), 다진 마늘 2g(1/2쪽), 고춧가루 2g(1/3작은술), 요리당 2g(1/3작은술), 참기름 2g(1/3작은술), 참깨 약간','부추는 깨끗이 씻어 물기를 빼고 5cm 길이로 썬다.','부추에 날콩가루를 넣고 고루 섞이도록 버무린다.','찜기에 면보를 깔고 부추를 넣은 후 김이 오르게 쪄서 부추를 파랗게 익힌다.','양념장 재료를 섞어 양념장을 만든다.','찐 부추와 양념장을 곁들인다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (9,'연근 구기자 물김치',6,1,'9.png','물 200ml(1컵), 식초 15g(1큰술), 동치미국물 40g(2과2/3큰술), 연근 30g(4cm), 무 20 g(3×3×1cm), 사과 30g(1/5개), 배추 10g(1장), 구기자 10g(5개), 오이 5g(2cm), 돌미나리 5g, 쪽파 5g','연근은 껍질을 벗기고 얇게 썰어 식초물에 10분 정도 담구어 녹말을 빼내고, 갈변을 방지한다.','사과, 배추, 오이, 무는 나박 썰기를 하고 쪽파와 미나리 줄기는 3cm 길이로 썬다.','구기자는 깨끗이 씻어 냄비에 물300ml를 넣고 한소끔 끓여 식힌다.','동치미 국물과 구기자 달인물을 2 : 1 의 비율로 섞고 준비한 연근(1)과 썰어 놓은 재료(2)를 넣는다.','우려낸 구기자를 넣어 1~2일 정도 익히면 아삭하게 먹을 수 있다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (10,'방울토마토 소박이',6,1,'10.png','방울토마토 150g(5개), 양파 10g(3×1cm), 부추 10g(5줄기), 고춧가루 4g(1작은술), 멸치액젓 3g(2/3작은술), 다진 마늘 2.5g(1/2쪽), 매실액 2g(1/3작은술), 설탕 2g(1/3작은술), 물 2ml(1/3작은술), 통깨 약간','고춧가루, 멸치액젓, 다진 마늘, 매실액, 설탕, 통깨, 물을 섞어 양념장을 만든다.','다듬은 부추와 양파는 물기를 빼고 2cm 정도의 크기로 썰어 준다.','양념장(1)에 부추와 양파(2)를 섞어버무린다.','깨끗이 씻은 방울토마토는 꼭지를 떼고 윗부분에 칼로 십자모양으로 칼집을 낸다.','칼집을 낸 방울토마토에 양념속(3)을 사이사이에 넣어 마무리 한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (11,'순두부 사과 소스 오이무침',6,1,'11.png','오이 70g(1/3개), 다진 땅콩 10g(1큰술), 순두부 40g(1/8봉지), 사과 50g(1/3개)','사과, 순두부를 믹서에 넣고 곱게 갈아 소스를 만든다.','오이는 소금으로 문질러 씻어 반을 갈라 씨를 제거하고 어슷썰기를 한다.','썰어 놓은 오이에 순두부사과 소스를 넣고 버무려준다.','그 위에 다진 땅콩을 뿌려 마무리한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (12,'사과 새우 북엇국',3,1,'12.png','북어채 25g(15개), 새우 10g(3마리), 사과 30g(1/5개), 양파 40g(1/4개), 표고버섯 20g(2장), 물 300ml(1과1/2컵)','북어채를 잘게 손으로 찢어 찬물에 헹구어 준비한다.','양파, 표고버섯, 사과는 채를 썰고 새우는 등쪽의 두세 마디에 꼬챙이를 넣어 내장을 뺀 후 헹구어 준비한다.','찬물에 북어채, 새우, 표고버섯, 양파를 넣고 20분 정도 끓인다.','사과를 넣어 북어의 씁쓸한 맛을 없앤다.','그릇에 담아낸다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (13,'사탕절편 떡국',3,1,'13.png','닭 150g, 대파 15g(7cm), 마늘 10g(2쪽), 물 500ml(2과1/2컵), n깨 10g(2작은술), 후추약간, 멥쌀가루 400g(2컵), 녹차가루 3g(1작은술), 백련초 3g(1작은술), 단호박 가루 3g(1작은술), 쇠고기 50g, 애호박 20g(2cm), 달걀 50g(1개), 식용유 5g(1작은술), 간장 2g(1/3작은술), 참기름 5g(1작은술), 소금 약간','닭은 손질하여 찬물에 대파, 마늘, 후추를 넣고 센불에서 10분 정도 끓이다가 중간 불로 15분 정도 더 끓여 식힌 다음 체에 거른 육수에 깨를 넣어 불린다.','쌀가루는 2등분하여 반은 체에 내리고, 반은 다시 3등분하여 녹차가루, 백련초가루, 단호박가루를 섞어 체에 내린다.','찜기에 1/3정도의 물을 넣고 끓이고 4가지색의 쌀가루를 면보에 나누어 올려 센불로 찐다. 김이 올라 쌀가루 사이로 구멍이 생기면 꺼낸다.','3가지 색을 섞은 떡은 가늘고 길게 둥글려 흰색 떡에 3가지 색의 떡을 붙인다.','떡이 한 가닥으로 만들어지면 젓가락 같은 도구로 앞뒤로 밀고 당기면서 떡을 둥글리며 썰어서 3색의 중심을 눌러 사탕처럼 만든다.','달걀을 노른자와 흰자로 분리하여 지단을 부치고, 애호박은 돌려 깍기한 후 프라이팬에 기름을 두르고 볶는다.','고기는 얇게 썰어 고기 양념을 하\n고 기름에 볶아 고명을 준비한다.','닭육수에서 깨를 건져 내고 육수\n를 다시 끓이다가 떡을 넣어 끓인다.','그릇에 떡국을 담고 고명을 올려\n준다',null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (14,'두부 표고 완자탕',3,1,'14.png','파 20g(1/6개), 멸치 15g(7마리), 다진 마늘 10g(2쪽), 파 10g(5cm), 간장 4g(1작은술), 식초 2g(1/3작은술), 물 300ml(1과1/2컵), 두부 90g(1/3모), 달걀 25g(1/2개), 표고버섯 10g(1장), 밀가루 10g(2작은술), 표고버섯 10g(1장), 파 10g(5cm)','멸치는 머리와 내장을 제거하여 찬물에 넣고 약한 불에서 끓이다가 중간 불에서 10분 정도 끓인다.','육수가 끓으면 멸치를 건져낸 후 간장, 양파, 다진 마늘을 넣고 끓인다.','고명으로 사용할 표고버섯과 파는 완자 크기로 썬다.','두부는 곱게 으깨어 물기를 꽉 짜고 표고버섯은 기둥을 떼어내고 잘게 다진다.','두부와 표고버섯을 고루 섞어 둥글려 완자 모양으로 빚어 밀가루를 입힌 후 달걀물을 입힌다.','끓는 육수에 달걀물을 입힌 완자를 넣고, 완자가 익어 동동 떠오르면 고명으로 준비한 표고버섯, 파, 남은 달걀물을 넣고 끓인다.','마지막에 식초를 넣는다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (15,'황태해장국',3,1,'15.png','황태(채) 15g(10개), 콩나물 30g(1/6봉지), 무 30g(5×3×2cm), 저염된장 10g(2작은술), 물 300ml(1과1/2컵), 청양고추 5g(1/2개), 다진 마늘 2g(1/3작은술)','황태는 손질하여 물에 헹궈 건져 놓는다.','콩나물은 다듬어 씻고 청양고추는 어슷썰기 한다.','냄비에 물을 붓고 황태와 무를 넣고 끓인다.','육수에서 무를 건져내고 저염 된장을 푼다.','콩나물, 다진 마늘, 청양고추를 넣고 뚜껑을 덮어 김이 나게 끓여준다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (16,'된장국',3,1,'16.png','두부 20g(2×2×2cm), 애느타리버섯 20g(4가닥), 감자 10g(4×3×1cm), 양파 10g(2×1cm), 대파 10g(5cm), 된장 5g(1작은술), 물 300ml(1과1/2컵)','감자, 양파를 잘 익도록 얇게 썬다.','애느타리버섯은 썰어 달궈진 팬에 굽는다.','대파를 송송 썬다.','냄비에 물을 붓고 된장을 푼 뒤 감자, 양파, 두부를 넣어 재료가 투명해지게 끓인다.','된장국의 재료를 건져서 국물 한 국자와 믹서에 넣어 갈은 다음 된장국에 다시 넣어 한 번 더 끓인다.','구운 애느타리버섯과 대파를 국에 넣어 끓인 후 그릇에 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (17,'치커리샐러드',6,4,'17.png','치커리 30g(10줄기), 적양배추 15g(5×3cm), 양파 10g(2×1cm), 당근 5g(3×1×1cm), 올리브유 10g(2작은술), 식초 5g(1작은술), 설탕 5g(1작은술), 마늘 5g(1쪽)','마늘은 곱게 다진다.','올리브유, 식초, 설탕, 다진 마늘을 섞어 거품기로 충분히 저어주 어 올리브마늘 드레싱을 만든다.','치커리는 싱싱하게 찬물에 담갔다가 물기를 뺀 후 한입 크기로 자르고, 적양배추, 양파, 당근은 곱게채를 썬다.','접시에 준비한 치커리, 적양배추, 양파, 당근을 담고 올리브마늘 드레싱을 뿌린다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (18,'그린매쉬드포테이토',6,4,'18.png','감자 80g(1/2개), 시금치우유 소스 5g(1작은술), 아몬드 2g(1알), 설탕 2g(1/3작은술), 크랜베리 3g, 치커리 약간, 시금치 10g, 우유 10g(2작은술)','시금치는 끓는 소금물에 데쳐 찬물에 헹구어 물기를 짜고 우유를 넣고 블렌더에 곱게 갈아 체에 거른다.','감자는 껍질을 벗기고 찜기에 넣어 센불에서 20분 정도 삶다가 젓가락으로 찔러서 들어가면 약한불로 줄여 뜸을 들인 후 꺼내서 으깬다.','아몬드는 잘게 다진다.','치커리는 씻어서 물기를 빼고 곱게 다진다.','으깬 감자, 다진 치커리, 시금치 우유소스, 설탕을 넣고 골고루 섞어 준다.','접시에 감자(5)를 담고 아몬드와 크랜베리를 올리고 시금치우유 소스를 곁들인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (19,'버섯구이와 두부타르타르 소스',8,5,'19.png','연두부 30g(1/4모), 다진 양파 10g(2작은술), 다진 오이피클 10g(2작은술), 올리브유 2g(1/3작은술), 식초 5g(1작은술), 레몬즙 3g(2/3작은술), 머스터드 3g(2/3작은술), 꿀 2g(1/3작은술), 흰 후추 약간, 새송이버섯 70g(7개), 올리브유 10g(2작은술), 치커리 10g(3줄기)','곱게 다진 양파와 오이피클은 물기를 짠다.','연두부에 다진 양파, 다진 오이피클, 올리브유, 머스터드, 후추, 꿀, 식초, 레몬즙을 넣어 두부타르타르 소스를 만든다.','치커리는 찬물에 담갔다가 물기를 뺀다.','새송이버섯은 0.5cm 두께로 버섯길이 그대로 썬다.','달궈진 프라이팬에 올리브유를 두르고 새송이버섯을 노릇하게 구워준다.','접시에 새송이버섯과 치커리를 담고 두부타르타르 소스를 곁들인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (20,'간장레몬 소스',8,1,'20.png','저염간장 5g(1작은술), 식초 15g(1큰술), 설탕 10g(1큰술), 레몬즙 5g(1작은술)','저염간장, 식초, 레몬즙, 설탕을 혼합하여 간장레몬 소스를 만들어 준다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (21,'비빔 메밀냉채',2,1,'21.png','메밀국수 200g, 빨강 파프리카 45g(1/3개), 주황 파프리카 45g(1/3개), 당근 20g(5×3×2cm), 오이 20g(4cm), 깻잎 4g(2장), 적양배추 15g(3×2×1cm), 비타민 15g, 겨자가루 50g(3과1/3큰술), 식초 125g(2/3컵), 설탕 10g(2작은술), 저염간장 10g(2작은술), 소금 약간','비타민은 깨끗이 씻어 물기를 빼고 깻잎은 씻어 가늘게 채썬다.','노랑 파프리카와 주황 파프리카는 씨를 빼고 5cm 길이로 채썬다.','오이는 소금으로 문질러 씻은 후 5cm 길이로 돌려 깎아 채를 썰고, 적양배추와 당근도 5cm 길이로 채를 썬다.','겨자가루, 식초, 설탕, 소금, 저염간장을 섞어 냉채소스를 만들어 냉장실에 보관한다.','끓는 물에 메밀국수를 넣고 뚜껑을 닫고 끓어오르면 1/2∼1컵 정도의 찬물을 부어 거품을 가라앉히고, 다시 끓으면 같은 방법을 한번 정도 더 되풀이한 다음 찬물로 맑게 헹구고 체에 건져서 물기를 제거한다.','그릇에 메밀국수를 담고 준비한채소들을 얹은 다음 차게 해 둔 냉채소스를 곁들인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (22,'사과 레몬 대구 구이',4,1,'22.png','대구(손질된 것) 90g(2토막), 밀가루 10g(2작은술), 식용유 10g(2작은술), 사과 50g(1/3개), 레몬즙 25g(1과2/3큰술), 후추 약간, 사과 10g(1/2쪽), 레몬 15g(1쪽)','사과는 갈아서 거르고, 레몬은 짜서 즙을 낸다.','냄비에 사과즙과 레몬즙을 넣고, 후추를 넣어 약한불에서 끓인다.','물기를 뺀 대구에 만들어 놓은 사과 레몬 소스(2)를 반만 넣어 1시간 정도 재운다.','대구(3)에 밀가루를 묻힌 후 프라이팬에 식용유를 두르고 아래 윗면을 노릇하게 굽는다.','사과는 얇게 썰고, 레몬은 반달 모양으로 썰어 달궈진 팬에 식용유를 두르고 굽는다.','접시에 구운 대구(4), 사과, 레몬(5)을 접시에 담고 남은 사과레몬 소스를 곁들인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (23,'유자 소스 동태살 구이',4,1,'23.png','동태살 60g(2토막), 올리브유 8g(1과2/3작은술), 식초 10g(2작은술), 바질 약간, 달걀 60g(1개), 청피망 10g(1/8개), 홍피망 10g(1/8개), 미니새송이버섯 20g(2개), 양파 20g(1/6개), 당근 10g(5×3×1cm), 호박 10g(폭5×두께1cm), 올리브유 약간, 유자청 20g(1과1/3큰술), 물 10ml(2작은술), 발사믹식초 20g(1과1/3큰술), 물 10ml(2작은술)','손질한 동태살을 물에 헹군 뒤 물기를 뺀다.','그릇에 바질 잎을 잘게 다지고 올리브유와 식초를 함께 섞어 동태살을 30분 정도 재운다.','동태살에 달걀물을 입혀 달궈진 프라이팬에 노릇하게 굽는다.','청피망, 홍피망, 미니새송이버섯, 양파, 당근, 호박을 마름모꼴로 썬다.','달궈진 팬에 올리브유를 두르고 준비한 채소를 넣어 투명하게 굽는다.','접시에 구운 야채를 담고, 동태살을 그 위에 올리고 발사믹 소스와 유자 소스\n를 뿌린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (24,'비네그레트 드레싱 관자요리',4,4,'24.png','조개관자 100g(3개), 그린올리브 10g(2개), 올리브유 15g(1큰술), 레몬즙 10g(2작은술), 다진 마늘 5g(1쪽), 빨강 파프리카 10g(1/10개), 노랑 파프리카 10g(1/10개), 청 피망 10g(1/8개), 양파 10g(1/8개), 홍초 7g(1/2큰술), 설탕 5g(1작은술), 핫소스 5g(1작은술), 흰 후추 약간, 바질 약간','노랑 파프리카, 빨강 파프리카, 청피망, 양파는 0.3cm 크기로 썬다.','그릇에 바질, 다진 마늘, 올리브유, 핫소스, 레몬즙, 홍초, 설탕, 흰 후추를 섞는다.','(2)에 썰어놓은 재료(1)를 섞어 비네그레트 드레싱을 만든다.','관자는 막과 끝 쪽의 하얀 부분을 제거하고 찬물에 씻은 후 잔칼집을 넣는다.','달군 팬에 올리브유를 두르고 겉은 노릇하고 속은 촉촉할 정도로 굽는다.','접시에 만들어 놓은 비네그레트 드레싱(3)을 몰드를 이용해 만들고 그 위에 구운 관자를 올린다.','올리브는 얇게 썰어 관자 위에 얹는다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (25,'곤드레도우와 레몬허니 소스 피자',7,5,'25.png','곤드레나물 30g, 피자치즈 30g(2큰술), 리코타치즈 100g, 파인애플 40g(링1/2개), 단호박 50g(8×5cm), 느타리버섯 50g(6가닥), 올리브유 약간, 곤드레나물 20g, 중력분 150g, 따뜻한 물 80ml(5과1/3큰술), 꿀 30g(2큰술), 레몬즙 15g(1큰술)','곤드레나물은 씻어 1시간 정도 불리고, 불린 물 그대로 뚜껑을 덮고 30분 정도 삶은 후 찬물에 행궈 물기를 꼭 짠다.','반죽에 넣을 곤드레나물은 다져서프라이팬에 볶아 식힌다.(기름을 사용하지 않는다)','밀가루에 따뜻한 물, 다진 곤드레나물(2)을 섞어 반죽하여 실온에서 발효시킨 후 밀대로 고루 얇게 민다.','프라이팬에 식용유를 두르고 곤드레도우를 펼친 후 약한 불에서 형태가 처지지 않게 굽는다.','파인애플은 8등분으로 나눈다.','달군 프라이팬에 올리브유를 두르고 얇게 썬 단호박을 굽는다.','프라이팬에 식용유를 두르고 느타리버섯과 토핑용 곤드레나물을 함께 볶는다.','레몬즙과 꿀을 섞어 소스를 준비한다.','구운 반죽 위에 레몬허니 소스를 고루 바르고 피자치즈를 돌려가며 뿌린 후 느타리버섯, 곤드레나물, 파인애플을 얹는다.','200도로 예열된 오븐에 피자를 넣고 10~15분 정도 색이 나게 굽고 리코타치즈를 올린다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (26,'청포묵 사과오렌지 젤리',7,5,'26.png','사과 200g(1개), 오렌지 200g(1개), 청포묵 가루 30g(2큰술), 물 100ml(1/2컵), 플레인 요거트 100g(1개)','곤드레나물은 씻어 1시간 정도 불리고, 불린 물 그대로 뚜껑을 덮고 30분 정도 삶은 후 찬물에 행궈 물기를 꼭 짠다.','오렌지는 깨끗이 씻어서 껍질을 벗긴뒤 2/3는 즙을 짜고 1/3는 과육만 따로 발라낸다.','사과는 깨끗이 씻어 2/3는 과육을 갈아 즙을 짜고 1/3은 먹기 좋은 작은 크기로 자른다.','청포묵 가루를 물에 잘 섞는다.','냄비에 준비된 과즙(100~120ml)을 넣고 끓이다가 청포묵가루(3)를 넣고 잘 저어가면서 투명하게 익힌다.','준비해 둔 컵이나 원형 틀에 (4)를 붓고 잘라 놓은 과일을 넣어 굳힌다.','과일젤리를 그릇에 담고 그 위에 요거트를 가볍게 부은뒤 기호에 따라 과일이나 허브로 장식 한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (27,'오렌지 당근펀치',9,4,'27.png','당근 100g(1/2개), 오렌지 100g(1/2개), 물 50ml(1/4컵)','오렌지는 깨끗이 씻어 껍질을 벗기고 과육을 준비한다.','당근은 깨끗이 씻어 작은 토막으로 썰어 놓는다.','당근, 오렌지, 물을 믹서에 곱게 갈아 체에 거른다.','체에 걸러낸 당근즙과 오렌지즙을섞어 살얼음이 생길만큼 시원하게 냉동한 후 컵에 담아낸다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (28,'누룽지 요거트 파르페',7,5,'28.png','밥 210g(1공기), 오렌지 40g(1/5개), 사과 30g(1/5개), 요거트 200g(1컵), 블루베리 30g(2큰술)','프라이팬에 밥을 얇게 펴 약한 불에서 뚜껑을 덮어 굽는다.','노릇하게 누룽지가 되면 식혀서 굵게 부순다.','오렌지는 깨끗이 씻어 껍질을 벗겨 적당하게 자르고 사과는 깨끗이 씻어 물기를 닦아 굵게 자른다.','컵에 요거트, 오렌지, 요거트, 누룽지, 요거트, 사과, 요거트, 누룽지 순으로 담고 위에 누룽지와 블루베리로 장식한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (29,'채소 자장면',2,2,'29.png','중화면 200g, 감자 80g(1/2개), 양파 80g(1/3개), 애호박 30g(1/2개), 검은콩 2g(1/2작은술), 새송이버섯 30g(3개), 옥수수통조림 10g(2작은술), 설탕 20g(1과1/2큰술), 저염간장 15g(1큰술), 자장분말 30g(2큰술), 녹말가루 30g(2큰술), 오이 30g(1/5개), 완두콩 10g(2작은술)','검은콩은 물에 담가 2시간 정도 불린다.','완두콩은 끓는 물에 데친다.','감자, 양파, 애호박은 1.5cm로 깍둑썬다.','믹서에 불린 검은콩을 간다.','면은 끓은 물에 삶아 체에 건져 물기를 뺀다.','새송이버섯은 슬라이스하고 오이는 채 썬다.','팬에 썰어둔 3의 채소를 볶다가 저염간장, 자장분말, 설탕을 넣어 소스를 만든다.','소스에 검은콩, 옥수수를 넣어 끓인다.','녹말 물을 넣어 농도를 조절한다.','그릇에 면을 담고 소스와 채 썬 오이, 완두콩을 올려 완성한다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (30,'칠곡석류국수',2,1,'30.png','소면 160g, 저염소금 4g(1작은술), 식초 8g(1/2작은술), 석류 200g(1/2개), 잣 4g(1작은술), 아몬드 4g(1작은술), 해바라기씨 4g(1작은술), 호두 4g(1작은술), 호박씨 4g(1작은술), 오이 20g(1/4개)','잣, 아몬드, 해바라기씨, 호두, 호박씨는 다진다.','끓는 물에 저염소금과 식초를 넣은 후 소면을 삶은 후 체에 건져 물기를 뺀다.','석류는 물 600g와 함께 믹서에 갈아 준 다음 체에 걸러 즙을 낸다.','준비 된 그릇에 면을 담고 차갑게 식힌 석류즙을 붓는다.','견과류, 채 썬 오이를 고명으로 올려 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (31,'닭가슴살 브로콜리 만두',2,1,'31.png','만두피 4g(2장), 브로콜리 100g(1/4개), 숙주 100g, 표고버섯 20g(2개), 닭 가슴살 100g, 참기름 2g(1/2작은술), 저염간장 4g(1작은술), 소금 0.5g, 후춧가루 0.1g','브로콜리, 숙주, 표고버섯은 다진다.','닭 가슴살은 다진 후 소금과 후춧가루로 밑간 한다.','다진 채소와 닭가슴살, 참기름, 저염간장을 섞어 만두소를 만든다.','준비한 만두피에 만두소를 넣은 후 만두 모양으로 빚는다.','만두를 찜통에 넣어 찌고 그릇에 담는다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (32,'함초 냉이 국수',2,1,'32.png','소면 50g ,함초 3g(1/2작은술), 노루궁뎅이버섯 25g(1/2개), 다시마 17g(15cm), 파 140g(1/2개), 양파 150g(1/2개), 무 250g(1/3개), 모시조개 150g(3/4컵), 냉이 35g, 간장 30g(2큰술), 달걀 50g(1개), 청고추 20g(1개), 실고추 2g','함초, 노루궁뎅이버섯, 다시마, 파, 양파, 무를 끓는 물에 넣어 끓인다.','향이 강한 모시조개와 냉이를 10분 뒤에 첨가한다.','모든 재료를 넣은 육수는 30분 끓인 후, 간장으로 색을 낸다.','소면은 따로 삶는다.','청고추는 슬라이스하고, 황?백 지단을 부친다.','그릇에 삶은 소면을 담고 육수를 붓고 지단, 청고추, 실고추를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (33,'부대된장찌개',3,1,'33.png','다시마 1g, 두부 10g, 떡국 떡 10g, 스팸(마일드) 10g, 다진 마늘 5g, 무 20g, 김치 15g, 소시지 10g(1/2개), 우민찌 5g(1작은술), 양파 5g, 저염된장 15g(1큰술), 베이컨 5g, 대파 5g, 청양고추 5g, 홍고추 1g','김치, 베이컨, 스팸, 소시지, 양파, 두부, 무는 두께 0.5cm로 썬다.','다시마와 물을 끓여 다시마물을 만든다.','뚝배기 그릇에 소시지, 베이컨, 두부, 스팸, 무, 우민찌, 김치를 담고 다시마물 300g을 넣어 끓인다.','부대찌개가 끓어오르면 저염된장을 풀고 양파, 대파, 다진 마늘, 떡국 떡을넣어 끓인다.','재료가 다 익으면 홍고추와 청양고추를 넣어 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (34,'닭가슴살 오꼬노미야끼',4,3,'34.png','카놀라유 2g, 달걀 60g(1개), 닭 가슴살 40g, 마요네즈 5g(1작은술), 천일염 0.2g, 숙주나물 40g, 양배추 30g(1/10개), 양파 10g(1cm), 흰 후춧가루 0.01g, 데리야끼소스 5g, 일식돈가스 소스 5g, 쪽파 2g','김치, 베이컨, 스팸, 소시지, 양파, 두부, 무는 두께 0.5cm로 썬다.','닭 가슴살은 오븐에 구워 1×1×1cm으로 썬다.','양배추는 5cm길이로 채 썰고 양파는 0.5cm두께로 반달썰기 한다.','달걀은 풀어준다.','팬에 카놀라유를 두르고 양배추, 양파, 숙주를 넣어 천일염, 흰 후춧가루를 넣고 볶는다.','팬에 풀어놓은 계란을 넣어 동그랗게 만들어 익히다가 닭 가슴살과 볶은 야채를 넣고 오믈렛모양으로 만든다.','접시에 오믈렛을 담고 마요네즈와 데리야끼소스, 일본식 돈까스 소스를 뿌린 후 송송 썬 쪽파를 뿌려 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (35,'제육볶음 또띠아 피자',5,5,'35.png','양배추 130g(1개), 양파 150g(1개), 청피망 150g(1개), 올리브오일 5g(1작은술), 돼지고기 40g, 또띠아 130g(1과1/2개), 저염치즈 30g, 월계수잎 1g(1개), 고추장 25g(2큰술), 꿀 10g(1과1/2작은술), 볶은 깨 1.5g, 참기름 10g(1과1/2작은술), 다진 마늘 3g, 식초 10g(1과1/2작은술), 양조간장','볶은 깨, 참기름, 고추장, 꿀, 양조간장, 식초, 다진 마늘을 섞어 제육양념을 만든다.','돼지고기는 다진 후 끓는 물에 월계수 잎을 넣고 데친다.','데친 돼지고기는 제육양념에 재운다.','양배추는 결을 따라 채 썬다.','양파와 피망은 3×3cm 크기로 자른다.','팬에 올리브오일을 두르고 썰어놓은 양배추를 넣고 볶다가 재운 돼지고기와 물을 넣고 조린다.','또띠아에 양배추, 제육볶음, 양파, 피망을 넣은 후 저염치즈를 올리고 접어 올리브오일을 두른 팬에 익힌다.','완성된 또띠아를 접시에 담아 완성한다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (36,'치즈 크러스트 튜나',4,4,'36.png','참치 80g, 바질 4g(3잎), 발사믹크림 10g(1작은술), 아스파라거스 40g(3개), 올리브오일 6g(1작은술), 버터 15g(1큰술), 그라나파다노 치즈 40g, 후추 2g(1/2작은술), 영콘 5g, 은행 5g(1알), 방울토마토 20g(2개), 당근 5g(1/30개)','후추, 올리브오일과 다진바질을 섞어 참치를 재운다.','당근은 모서리 부분을 다듬는다.','가열된 팬에 버터를 녹이고 손질한 당근, 은행, 아스파라거스, 영콘을 볶는다.','참치는 가열된 팬에 굽는다.','그라나파다노 치즈를 갈아 구워낸 참치 겉면에 입혀 크러스트를 만든다.','접시에 발사믹크림을 뿌린 후 아스파라거스를 깔고 참치를 올린다.','영콘, 은행, 방울토마토, 당근으로 장식한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (37,'돼지 보쌈',4,1,'37.png','목살 100g, 마늘 10g(2개), 저염된장 10g, 대파 25g(1개), 양파 10g(1/15개), 청주 15g(1큰술), 생강 10g(1/2개), 부추 25g, 홍파프리카 10g(1/15개), 황파프리카 10g(1/15개), 냉이 40g, 양파즙 10g(2작은술), 사과즙 10g(2작은술), 배즙 30g(2큰술), 저염된장 10g(2작은술), 다진 마늘 10g(2작은술), 매실청 10g(2작은술), 참기름 5g(1작은술), 깨소금 3g(1/2작은술)','소스팬에 저염된장, 양파즙, 사과즙, 배즙, 다진 마늘, 매실청, 깨소금, 참기름을 넣어 졸인다.','파프리카는 4×0.3×0.3cm로 채 썬다.','부추는 4cm길이로 자른다.','냉이는 손질하여 끓는 물에 데쳐 찬물에 식히고 수분제거 후 4cm로 썬다.','목살은 찬물에 30분 담가 핏물을 제거한다.','냄비에 물과 저염된장, 청주, 대파, 생강, 양파, 마늘을 넣어 끓이다가 핏물 뺀 고기를 넣고 35분 삶는다.','고기가 다 익으면 1cm로 썰고 부추, 파프리카, 냉이, 저염된장소스를 곁들인다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (38,'오색 완자탕수',5,1,'38.png','당근 10g(1/12개), 돼지고기 등심 160g, 마늘즙 5g(1작은술), 생강즙 5g(1작은술), 식용유 10g(2작은술), 양파 10g(1/30개), 찹쌀떡 40g(3개), 후춧가루 2g(1/2작은술), 소금 5g(1작은술), 머스터드 10g(1/2큰술), 물엿 20g(4작은술), 저염간장 5g(1작은술), 레몬 60g(1개), 코코넛가루 5g(1작은술), 시금치가루 2g(1/2작은술), 복분자가루 2g(1/2작은술), 볶은 흑임자가루 5g(1작은술), 볶은 참깨가루 5g(1작은술)','돼지고기, 양파, 당근은 다진다.','1에 마늘즙, 생강즙, 후춧가루, 소금, 머스터드를 넣고 치댄다.','고기반죽 가운데에 찹쌀떡을 넣어 완자모양으로 빚는다.','빚은 완자를 기름에 튀긴다.','물엿, 저염간장, 레몬을 넣고 끓여 탕수소스를 만든다.','튀긴 완자에 탕수소스를 충분히 묻힌다.','소스를 묻힌 완자 각각에 볶은 참깨가루, 볶은 흑임자 가루, 시금치가루, 코코넛가루, 복분자가루를 묻혀 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (39,'양배추감자전',5,1,'39.png','감자 100g(1개), 양배추 150g(1/2개), 당근 15g(1/10개), 두부 20g(1/20모), 돼지고기 30g, 청양고추 5g(1개), 부침가루 45g(3큰술), 달걀 60g(1개), 식용유 15g(1큰술), 오렌지즙 15g(1큰술), 간장 2g(1/2작은술), 식초 10g(2작은술)','오렌지즙과 간장, 식초를 섞어 소스를 만든다.','감자를 믹서에 갈아준다.','양배추는 채 썬다.','고기, 당근, 청양고추, 두부는 다진다.','준비해둔 재료를 모두 섞고 부침가루와 계란을 넣어 반죽한다.','가열된 팬에 기름을 두르고 반죽을 부어 굽는다.','전과 소스를 함께 곁들인다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (40,'채소크로켓',5,3,'40.png','감자 150g(1개), 양송이버섯 45g(2개), 달걀 50g(1개), 양파 20g(1/5개), 당근 20g(1/5개), 밀가루 10g(2작은술), 빵가루 10g(2작은술), 식용유 400ml(2컵), 새싹채소 약간, 레몬 1개, 설탕 20g(1과1/3큰술)','손질한 당근, 양파, 양송이버섯을 곱게 다진다.','감자는 껍질을 벗겨 4등분하여 냄비에 감자가 잠기게 물을 넣고 센불에서 20분 정도 삶다가 젓가락으로 찔러 들어가면 물을 반 정도 버리고 약한 불로 줄여서 물이 없어질 때까지 뜸을 들여 익혀 으깬다.','다진 양송이, 당근, 양파와 으깬 감자를 함께 섞어 치대어 준다.','크로켓반죽을 지름 3cm 정도로 둥글려 만든 후 밀가루, 풀어놓은 달걀, 빵가루 순으로 묻힌다.','튀김 팬에 180~200도의 기름에크로켓을 넣어 가라앉았다가 올라와 노릇해지면 뒤집어서 돌려가며튀기고 기름을 빼준다.','레몬 1개로 즙을 내어 소스 팬에레몬즙과 설탕을 한소끔 끓여 레몬 소스를 만든다.','접시에 크로켓과 레몬 소스를 곁들인다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (41,'머쉬룸 치킨 브리또',4,6,'41.png','닭가슴살 30g, 느타리버섯 20g(3가닥), 토마토 20g(1/10개), 양상추 15g(1/3장), 오이 20g(3cm), 양파 15g(1/8개), 빨강 파프리카 20g(1/6개), 노랑 파프리카 20g(1/6개), 올리브유 15g(1큰술), 또띠아 1장, 소금 약간, 후추 약간, 플레인요거트 30g(2큰술), 레몬즙 5g(1작은술)','레몬즙을 짜서 플레인요거트와 섞어 소스를 만든다.','닭가슴살은 길게 옆으로 저미어 소금과 후추에 재운다.','양상추는 한입 크기로 자른다.','토마토는 끓는 물에 데쳐 껍질을 벗기고 다진다.','오이, 양파, 노랑 파프리카, 빨강 파프리카는 얇게 채를 썬다.','프라이팬에 또띠아를 약한 불에 부드럽게 구워준다.','달군 프라이팬에 올리브유를 두르고 느타리버섯과 닭가슴살을 볶는다.','또띠아에 레몬요거트 소스를 넣고 양상추, 토마토, 닭가슴살, 느타리 버섯, 오이, 양파, 파프리카를 올리고 풀어지지 않게 말아준다.','브리또를 한입 크기로 자르고 접시에 담는다.',null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (42,'유자 얼갈이 배추김치',6,1,'42.png','미나리 70g, 얼갈이배추 200g(1개), 천일염 10g(2작은술), 배 50g(1/6개), 쇠고기(홍두깨살) 20g(5cm), 다시마 10g(10cm), 마늘 5g(1개), 대파 10g(1/3개), 갓 35g, 홍고추 50g(5개), 사과 50g(1/4개), 배 50g(1/4개), 생강 10g, 마늘 10g(2개), 식초 30g(2큰술), 양파 30g(1/6개), 유자 50g(1/4개), 청각 15g(10cm), 대파 10(1/3개)','홍고추, 대파, 사과, 다진 마늘, 생강, 양파, 배, 청각, 갓, 식초, 유자를 믹서에 갈아 소스를 만든다.','대파, 마늘, 다시마, 쇠고기로 육수를 만들어 1의 소스와 섞어 양념을 만든다.','배는 채 썰고 양념에 절인다.','미나리는 잎을 떼고 양념에 절인다.','얼갈이배추는 물로 씻은 후 소금물에 절인다.','절인 얼갈이배추를 물로 씻은 후 식초 물에 재워 배추에 남은 소금기를 뺀다.','양념에 재운 배를 절인 얼갈이배추로 감싼 후, 미나리로 묶어 양념에 재워 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (43,'전복김치',6,1,'43.png','배추 100g(1/6개), 참전복 100g(2마리), 쪽파 25g(5개), 레몬(껍질) 20g(1/5개), 함초 100g(1/2컵), 생강 10g, 마늘 10g(2개), 고춧가루 25g(2큰술), 멸치가루 100g(1/2컵), 멸치액젓 25g(2큰술), 새우젓 5g(1작은술), 다진 마늘 20g(1과1/3큰술), 찹쌀가루 15g(1큰술), 순무 70g','찹쌀가루와 물을 1:3비율로 섞어 끓여서 찹쌀 풀을 만들고 순무는 믹서에 간다.','고춧가루, 찹쌀 풀, 순무 간 것, 다진 마늘, 새우젓, 멸치액젓, 멸치가루를 넣고 양념장을 만든다.','물에 마늘, 생강, 함초를 넣고 육수를 만든다.','배추를 육수에 담가 절인다.','참전복은 회를 뜬다.','쪽파는 4cm길이로 썰고 레몬껍질은 채 썰어 전복, 배추와 함께 양념장에 버무려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (44,'단호박 들깨 꽁치조림',4,1,'44.png','꽁치 160g(1/2마리), 감자 80g(1/2개), 느타리버섯 60g(10개), 레몬즙 2g(1/2작은술), 단호박 30g(1/10개), 멸치육수 300g(1과1/2컵), 생강즙 2g(1/2작은술), 다진 마늘 20g(1과1/2큰술), 간장 5g(1작은술), 들깨가루 50g(1/4컵), 대파 10g(1/3개), 청양고추 10g(1개), 팽이버섯 10g(1/10개)','멸치육수를 끓인다.','멸치육수에 다진 마늘, 생강즙, 간장, 들깨가루를 넣어 조림양념을 만든다.','꽁치는 내장을 제거하고 6cm로 썰어 레몬즙에 절인다.','감자와 단호박은 반달모양으로 썬다.','느타리버섯과 팽이버섯은 찢는다.','청양고추와 대파는 어슷하게 썬다.','뚝배기에 감자를 깔고 꽁치, 느타리버섯, 단호박을 올린 뒤 조림양념을 얹어 조린다.','조림 위에 대파, 청양고추, 팽이버섯을 올려 완성한다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (45,'석류 보쌈김치',6,1,'45.png','배추 70g(1/10개), 석류즙 10g(2작은술), 소금 5g(1/2작은술), 무 10g(3cm), 미나리 10g, 쪽파 10g(1개), 다진 마늘 5g(1작은술), 다진 생강 5g(1작은술), 새우젓국 15g(1큰술)','배추를 소금물에 하루 동안 절이고 물기를 뺀다.','석류는 즙을 낸다.','무는 채 썰고, 쪽파와 미나리는 4cm로 자른다.','무채와 미나리, 쪽파, 다진 마늘, 다진 생강, 새우젓국을 넣어 섞어 소를 만든다.','절인 배추에 소를 넣고 오므려 싼다.','석류 즙에 소를 채운 배추를 담가 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (46,'고추장 라따뚜이',4,5,'46.png','애호박 70g(1과1/2개), 양송이버섯 60g(3개), 가지 70g(1/2개), 저염살라미 25g, 사과 60g(1/3개), 양파 40g(1/5개), 마늘 10g(2개), 토마토 600g(3개), 설탕 10g(2작은술), 바질 50g, 고추장 15g(1큰술)','양파와 마늘은 다져서 볶다가 토마토 과육과 설탕, 바질을 넣어 토마토소스를 만든다.','가지, 양송이버섯, 애호박, 사과는 썰고 살라미는 데친다.','토마토소스에 고추장을 섞고 오븐용 팬에 넓게 펴준 뒤 애호박, 가지, 양송이버섯, 살라미를 팬에 겹치게 편다.','180℃로 예열한 오븐에 넣고 30분 구워 완성한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (47,'애호박들깨볶음',5,1,'47.png','애호박(150g), 소금(0.5g), 양파(20g), 대파(10g), 홍고추(10g), 들기름(20g), 다진 마늘(5g), 건새우(20g), 들깨가루(30g)','애호박은 반달 모양으로 썰어 준다.','썰어 놓은 호박에 소금을 넣고 살짝 절여 물기를 제거하고 준비한다.','양파는 채를 썰고, 대파는 1/4로 자르고, 홍고추는 어슷썰어 자연스럽게 씨를 제거해 놓는다.','팬에 들기름을 넣고, 마늘을 먼저 볶는다.','볶아진 팬에 건새우를 넣어 볶아준다.','건새우가 볶아지면, 썰어 놓은 호박을 넣어 볶다가 양파와 대파를 넣어 볶으면서 들깨 가루와 넣어 살짝 볶으면서 마지막에 썰어 놓은 홍고추를 넣어 한 번만 더 볶아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (48,'고구마바나나샐러드',6,4,'48.png','고구마(100g), 바나나(100g), 요거트(30g), 어린잎(20g), 잣(5g), 연유(20g)','고구마는 찜통에 약 20분 정도 쪄서 껍질을 벗겨 준비한다.','뜨거운 고구마가 한김 빠지면, 곱게 으깨 놓는다.','으깨진 고구마에 바나나를 썰어 요거트와 함께 넣는다.','3번에 다시 연유를 넣어 골고루 섞는다.','잣은 종이를 깔고 곱게 다져 준비한다.','어린잎은 물에 담그어, 건져 물기를 제거해 놓고, 으깬 고구마에 다진 잣을 넣어 샐러드를 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (49,'닭고기월남쌈',5,6,'49.png','닭고기살(100g), 로즈마리(5g), 양파(20g), 소금(0.5g), 후춧가루(0.02g), 오이(30g), 파프리카(30g), 당근(30g), 라이스페이퍼(20g), 녹말가루(30g), 식용유(20g), 다진 마늘(10g), 고춧가루(10g), 설탕(20g), 식초(20g), 레몬즙(10g)','닭고기살에 로즈마리를 뿌려 약 3시간 이상 숙성을 시킨다.','냄비에 물을 1/3쯤 넣고, 양파채를 썰어 넣어 끓으면, 숙성된 닭고기살을 넣고 약 20분 정도 삶아 건진다.','삶아 건진 닭고기살을 한 김 빼고, 길게 손으로 찢어 소금과 후춧가루에 살짝 무치고, 오이와 파프리카는 씨를 제거 하고 채를 썰고, 당근도 오이채의 길이에 맞게 채를 썰어 준비해 놓는다.','마늘을 다지고, 고춧가루와 설탕, 식초, 레몬즙을 넣어 소스를 만든다.','뜨거운 물에 라이스페이퍼를 살짝 넣어 바로 건진다.','건져 놓은 라이스페이퍼에 준비한 닭고기살과 파프리카, 오이, 당근 넣고 돌돌 말아, 녹말가루를 살짝 입혀, 팬에 굴리듯 익혀 완성하고, 준비해 놓은 소스와 함께 제공한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (50,'생선카레튀김',5,6,'50.png','생선살(150g), 생강(10g), 정종(10g), 녹말가루(10g), 깻잎(10g), 가루(20g), 밀가루(10g), 카레가루(10g), 녹말가루(10g), 달걀(50g), 마요네즈(20g), 요구르트(20g), 설탕(10g), 식초(10g), 양상추(30g)','생선살에 생강즙과 정종을 넣고 약 30분 정도 숙성을 시켜 비릿한 맛 제거 및 생선 살의 탱탱함을 살려준다.','콩가루와 밀가루, 카레가루, 녹말가루, 달걀을 넣고 골고루 섞어 튀김 반죽을 만들어 놓는다.','깻잎은 반으로 접어 채를 썰어 물에 잠시 담그어 놓는다.','깻잎(③)은 물기를 제거하고 튀김반죽(②)을 골고루 입힌다.','숙성시킨 생선살(①)에 녹말가루를 살짝 입히고 튀김 반죽(②)을 골고루 입힌 뒤, 튀김반죽을 입힌 깻잎(④)을 얹어 튀김 기름 170℃ 온도에 넣어 약 2분 정도 튀겨 기름을 자연스럽게 빼 놓는다.','마요네즈와 요구르트, 설탕, 식초를 넣어 골고루 섞어 튀김소스를 만들고, 튀김을 접시에 담아 양상추와 함께 얹어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (101,'미니버섯탕수',5,2,'101.png','미니버섯(120g), 소금(0.3g), 녹말가루(50g), 달걀흰자(30g), 튀김기름(300g), 저염간장(30g), 홍초(20g), 설탕(20g), 브로컬리(20g), 오이(20g), 당근(20g), 홍파프리카(20g), 노란파프리카(20g), 물녹말(녹말가루 10g, 물 10g)','미니버섯을 깨끗이 씻어 소금을 살짝 뿌려 놓는다.','녹말가루에 물을 반쯤 넣고, 가만히 가라앉혀 윗물은 따라 버리고, 딱딱하게 된 녹말을 만들어 놓는다.','브로컬리는 끓는 물에 데쳐 작게 썰고, 오이는 반달로 썰고, 당근은 은행잎 모양으로 썰어 준비하고, 파프리카는 속씨를 제거하고, 삼각지게 썰어 준비한다.','간장과 홍초, 설탕을 넣어 골고루 섞어 탕수육소스를 만들어 놓는다.','소금을 뿌려 놓은 미니 버섯에 만들어 놓은 된 녹말과 달걀흰자를 넣어 골고루 섞는다.','튀김 기름의 온도가 170~180℃가 되면, 녹말 입힌 미니버섯을 바삭 하게 튀겨 주고, 다시 팬에 만들어 놓은 탕수육소스를 바글바글 끓이다가, 썰어 놓은 채소를 넣고 살짝 익힌 후, 물녹말을 한 숟가락 정도 넣어 끓인 후 튀겨진 미니버섯 위에 올려 완성해 준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (102,'연어오븐구이',4,4,'102.png','연어(150g), 양파(50g), 토마토(100g), 파프리카(50g), 당근(30g), 마늘(20g), 청피망(30g), 레몬(1/4개), 소금(0.3g), 후춧가루(0.01g), 생크림(20g), 화이트크림(50g), 버터(20g)','연어는 소금, 후춧가루, 레몬으로 마리네이드 한다.','양파, 마늘은 입자있게 다진다.','토마토는 씨를 제거하고 입자있게 썰고, 파프리카, 피망은 채 썬 뒤 볶는다.','화이트크림, 생크림을 골고루 섞어 크림소스를 만든다.','팬에 버터를 넣고 양파, 마늘을 볶다가 만들어 놓은 크림소스를 넣고 졸인다.','접시에 볶은 야채를 담고, 200℃ 오븐에서 10분 정도 구운 연어를 담은 뒤 크림소스를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (103,'연어초밥',1,3,'103.png','연어(100g), 쌀(150g), 당근(20g), 표고버섯(3장), 겨자가루(10g), 새싹(10g), 파슬리(5g), 식초(10g), 설탕(20g), 소금(0.2g)','연어는 끝을 뾰족하게 살려 슬라이스한다.','쌀은 깨끗이 씻어 30분 이상 불려 밥을 지어 식힌다.','냄비에 식초, 설탕, 소금 약간과 물을 동량으로 넣고 끓인 뒤 식혀 촛물을 만들어 밥에 넣고 골고루 섞는다.','당근과 표고버섯은 입자있게 다져 살짝 볶아 식혀놓은 초밥에 넣고 잘 섞어준다.','와사비 가루에 30℃정도의 물을 넣고 섞은 뒤 발효 시키고, 초밥 형태를 만들어 그 위에 와사비를 바르고 연어를 올린 후 접시에 담는다.','새싹과 파슬리는 찬물에 담았다 건져 물기를 빼고, 연어 초밥 옆에 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (104,'원소병',7,1,'104.png','찹쌀가루(200g), 치자(10g), 오미자(10g), 대추(5알), 귤병(20g), 유자청(30g), 꿀(50g), 녹말(50g), 잣(10알)','찹쌀가루는 체에 내려 2등분한다.','찹쌀가루는 오미자와 치자를 우린 뜨거운 물로 익반죽하여 비닐봉투에 담아 숙성시킨다.','대추는 씨를 발라내 곱게 다지고 귤병, 유자청, 꿀을 섞어 원소병 소를 만든다.','굴병과 꿀을 섞어 원소병 소를 준비한다.','익반죽을 지름 3cm 크기로 동그랗게 만들고 안에 소를 넣어 다시 동그랗게 만든다.','녹말가루를 입혀 끓는 물에 넣은 뒤 떠오르면 건져 찬물에 헹궈 물기를 빼고 그릇에 담아 꿀물을 붓고 잣을 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (105,'음메꼬꼬돌돌',4,1,'105.png','소고기(120g), 달걀(1개), 닭고기(가슴살, 100g), 미나리(50g), 찹쌀가루(50g), 홍고추(1개), 소금(0.3g), 후춧가루(0.01g), 통후추(5알), 저염간장(20g), 설탕(20g), 식초(10g)','소고기는 넓게 펴서 소금, 후춧가루로 밑간을 하고 굽는다.','닭가슴살은 소금, 후춧가루로 밑간을 하여 굽고 길이대로 썬다.','미나리는 끓는 물에 넣고 데쳐 찬물에 헹군다.','홍고추는 씨를 제거 하고 길게 썰어 준비한다.','달걀은 황백으로 나눠 지단을 부쳐 길게 썰어 놓는다.','밑간한 소고기와 닭살 에 찹쌀가루를 뭍혀 홍고추와 달걀 황백지단을 넣어 돌돌 말아 미나리로 띠를 둘러 팬에 기름을 살짝 둘러 익힌다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (106,'전복리조또',1,4,'106.png','쌀(100g), 전복(1개), 당근(20g), 양파(30g), 양송이버섯(3개), 우유(200g), 올리브오일(10g), 소금(0.2g), 후춧가루(0.01g), 버터(10g)','쌀은 깨끗이 씻어 30분 정도 불린다.','전복은 수저로 떼어 내어 소금으로 세척한다.','준비된 전복에 버터를 두르고 굽는다.','당근. 양파 . 양송이는 입자 있게 다진다.','냄비에 올리브 오일을 넣고 불린 쌀을 볶는다.','쌀이 어느 정도 볶아지면 다져 놓은 야채를 넣어 볶다가 우유를 넣어 끓이고, 쌀이 퍼지면 구워 놓은 전복을 넣어 다시 끓인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (107,'초계탕',3,1,'107.png','닭고기(다리, 2개), 양파(50g), 파프리카(50g), 적양배추(20g), 오이(50g), 마늘(30g), 겨자가루(20g), 대파(20g), 소금(0.3g), 설탕(20g), 식초(10g)','냄비에 마늘과 대파를 넣고 끓이다가 닭다리를 넣고 삶는다.','닭을 삶아 놓은 육수는 걸러 기름을 제거 하고 차갑게 식힌다.','삶아 놓은 닭고기는 결대로 찢는다.','양파, 오이와 파프리카는 채썬다.','적채는 채를 썰어 찬물에 담궈 건져 물기를 빼 놓는다.','차갑게 걸러 놓은 닭 육수에 발효된 겨자와 소금 .설탕, 식초를 넣어 육수 간을 하고, 그릇에 닭살과 오이 적채, 파프리카 양파를 올려 차가운 육수를 넣어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (108,'콩나물부추무침',6,1,'108.png','콩나물(150g), 부추(50g), 양파(30g), 당근(20g), 파(10g), 감자(50g), 소금(0.3g), 식용유(20g)','감자는 채를 썰어 물에 담궈 전분을 제거하고, 양파와 당근 파는 채를 썬다.','콩나물은 머리와 꼬리를 손질한다.','물이 끓으면 손질한 콩나물을 넣는다.','콩나물이 익으면 체에 건져 찬물에 헹군다.','부추는 약 6cm 길이로 썬다.','팬에 기름을 두르고 콩나물을 넣고 살짝 볶다가 썰어 놓은 야채를 넣고 볶으면서 소금 간을 하고 마지막에 부추를 넣고 마무리 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (109,'포카치아 샌드위치',7,4,'109.png','포카치아빵(1개), 토마토(50g), 생치즈(20g), 루꼴라(20g), 올리브오일(20g)','토마토는 슬라이스로 썰어 팬에 오일을 두르고 익힌다.','포카치아빵은 반으로 갈라 비지소스를 바른다.','생치즈는 동그랗게 원형으로 찍어, 빵에 구운 토마토와 함께 올리고 접시에 담는다.','루꼴라는 찬물에 담궈 건져 포카치아빵 옆에 함께 놓는다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (110,'해물아란치니',5,4,'110.png','오징어(100g), 새우(3마리), 토마토(50g), 양파(30g), 마늘(20g), 샐러리(20g), 밥(100g), 달걀(1개), 어린잎(10g), 소금(0.2g), 레몬(1/4개), 빵가루(20g)','새우는 껍질을 벗겨 다진다.','오징어는 썰어서 다진다.','양파, 샐러리, 마늘은 다져 팬에 볶아 식힌다.','토마토는 껍질을 벗겨 다진다.','다진 토마토를 팬에 볶다가 다진 새우와 오징어, 밥을 넣어 볶고, 3번을 넣고 볶아 동그랗게 모양을 만든다.','동그란 밥에 레몬을 섞은 달걀노른자를 묻히고 빵가루 옷을 입혀 팬에 기름을 둘러 굴려가며 익힌 후 접시에 담고 어린잎을 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (111,'닭고기 완자삼계죽',1,1,'111.png','닭고기(1마리), 인삼(1뿌리), 찹쌀(50g), 대추(10알), 마늘(30g), 대파(30g), 양파(30g), 통후추(10알), 저염간장(10g)','닭은 깨끗이 씻고 포를 뜬다.','닭고기는 15분 정도 삶아 식으면 곱게 다져 다진 마늘, 대파, 저염간장을 넣고 완자를 만든다.','인삼은 뇌두를 제거하고 깨끗이 씻는다.','찹쌀은 약 30분 정도 충분히 불린다','대추는 소금물에 깨끗이 씻고 씨를 제거한다.','믹서에 인삼과 대추, 불린 찹쌀, 물을 정도 넣고 곱게 간 뒤, 냄비에 담아 죽을 쑤다가 다 익으면 만들어 놓은 완자를 넣고 한소끔 더 끓인다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (112,'대하 마늘볶음밥',1,2,'112.png','대하(3마리), 쌀(100g), 당근(20g), 깻잎(2장), 양파(30g), 숙주(50g), 대추(2알), 청고추(1개), 파(10g), 마늘(10g), 생강(5g), 저염간장(10g), 식용유(10g)','새우는 내장을 제거하고 껍질을 벗겨 깨끗이 씻는다.','찜기에 새우를 넣고, 파채와 생강, 마늘을 올려 김이 오른 찜통에서 약 5분 정도 쪄낸다.','당근, 양파, 파는 다진다.','당근, 양파, 마늘은 다지고 숙주는 꼬리를 다듬는다.','다듬어진 숙주는 끓는 물에 살짝 데친다.','팬에 기름을 두르고 야채와 마늘을 넣고 볶다가 밥과 쪄 놓은 새우, 간장소스를 넣고 보슬보슬하게 볶는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (113,'두부 카프리제',6,5,'113.png','소고기(100g), 돼지고기(100g), 표고버섯(2개), 마(100g), 연근(20g), 감자(60g), 깻잎(3장), 애호박(1/3개), 마늘(20g), 두유(100g), 설탕(20g), 소금(0.2g), 저염간장(20g)','토마토는 깨끗이 씻어 슬라이스한다.','두부는 원형틀을 이용해서 토마토와 같은 크기로 만들고 소금을 살짝 뿌린 뒤 물기를 제거한다.','팬에 올리브오일을 두르고 두부를 살짝 굽는다.','어린잎은 찬물에 담근다.','발사믹소스에 설탕과 레몬즙을 넣고 골고루 섞어 소스를 만든다.','두부와 준비한 토마토를 접시에 돌려 담고 어린잎을 위에 올린 뒤 먹기 직전에 발사믹소스와 파마산치즈를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (114,'해물볶음밥',1,1,'114.png','볶음밥 쌀(100g), 아스파라거스(5g), 새송이버섯(10g), 달걀(40g), 문어(20g), 새우살(20g), 주꾸미(15g), 미나리볶음고추장 무(20g), 우엉(10g), 미나리(5g)','쌀은 씻어서 체에 건져 1시간 이상 불린 후 동량의 물을 부어 밥을 짓는다.','아스파라거스, 새송이버섯은 작게 깍둑 썰고, 무와 우엉, 미나리는 다진다.','식용유(10g)를 두른 팬을 중간 불로 달궈 달걀을 넣고 스크램블로 볶는다.','문어, 새우살, 주꾸미는 끓는 물에 살짝 데쳐 작게 자른다.','식용유(15g)를 두른 팬을 중간 불로 달궈 밥을 넣어 볶다가 문어, 새우살, 주꾸미, 스크램블 에그를 넣고 조금 더 볶는다.','무와 우엉에 고추장과 참기름, 물(40g)을 넣고 묽게 졸인 후 불을 끄고 미나리를 넣고 섞어 미나리볶음고추장을 만들어 밥에 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (115,'깐풍주먹밥',1,2,'115.png','칵테일새우(10g), 다진 쇠고기(15g), 후춧가루(1g), 참기름(7g), 찹쌀현미밥(200g), 밀가루(30g), 파인애플(10g), 부추(10g), 소스 다진 마늘(4g), 다진 붉은 고추(7g), 다진 풋고추(7g), 식초(10g), 함초가루(10g), 설탕(15g)','칵테일새우는 잘게 다진다.','다진 쇠고기에 후춧가루와 참기름(3g)으로 밑간한 후 볶는다.','찹쌀현미밥에 참기름(4g)을 넣어 밑간하고 식힌 후 새우와 쇠고기를 넣어 뭉쳐준다.','마늘과 고추는 볶다가 식초와 함초가루, 설탕, 물(30g)을 넣고 졸여 소스를 만든다.','밀가루는 반죽한 뒤 얇게 밀어 삼각형으로 잘라 튀긴 후 기름을 뺀다.','위에 주먹밥을 올리고 파인애플을 올린 후 소스를 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (116,'새싹참치김밥',1,1,'116.png','재료 파프리카(15g), 파인애플(15g), 달걀(30g), 김(2g), 밥(150g)\n새싹채소(10g), 참치(12g), 저염간장(5g), 마요네즈(2.5g), 설탕(0.5g)','소스를 만든다.','파프리카와 파인애플을 먹기 좋게 썬다.','스크램블 에그를 만든다.','김발 위에 ⅔크기로 자른 김을 놓고 밥을 고루 편 뒤 새싹채소, 스크램블 에그, 파프리카, 기름 뺀 참치, 파인애플을 올리고 소스를 고르게 뿌린다.','반으로 접어 먹기 좋게 썰어 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (117,'족발수육',4,1,'117.png','양념족발 200g, 고구마 150g, 가지 150g, 맥주 400g, 백김치 50g, 백김치, 참기름 15g, 통깨 3g','조미된 족발은 뜨거운 맥주에 데쳐내 기름기를 제거한다.','고구마는 편으로 썰어 냉수에 헹궈 기름 없는 팬에 구워준다.','가지는 편으로 썰어서 수분을 제거한다.','가지는 편으로 썰어 살짝 구워준다.','백김치는 물에 헹궈서 손으로 꼭 짠 후 송송 썰어서 양념을 해 무쳐준다.','무쳐준 김치와 함께 구워진 채소와 족발수육을 담아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (118,'함초떡갈비',4,1,'118.png','갈은 소고기 150g, 갈은 돼지고기 150g, 당근 25g, 새송이버섯 20g, 함초 30g, 양파 25g, 샐러리 10g, 대파 10g, 다진마늘 10g, 참기름 15g, 통깨 5g, 함초소금 1g, 발사믹식초 30g, 설탕 15g, 흰후추 1g','함초는 송송 다져준다.','당근, 새송이, 샐러리, 양파를 송송 다져준다.','볼에 소고기, 돼지고기, 다져 놓은 채소와 다진마늘, 다진대파, 참기름을 넣고 반죽해준다.','여기에 함초 다진 것을 넣고 다시 반죽해 준다.','떡갈비 모양으로 만들어준 후 팬에 노릇하게 구워준다.','소스를 만들어 구워진 떡갈비를 졸여준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (119,'돼지수육맑은전골',3,1,'119.png','통삼겹 250g, 된장 10g, 통후추 2g, 다진대파 5g, 팽이버섯 10g, 당근 20g, 배추 30g, 청경채 20g, 애호박 25g, 숙주 25g, 청양고추 20g, 천연다시다 15g, 물 300g, 다진마늘 5g, 어간장 15g, 겨자 5g, 식초 15g, 깨 5g','당근, 청경채, 배추, 애호박, 팽이버섯은 먹기 좋은 크기로 잘라준다.','흑돼지고기, 저염된장, 후추를 넣어서 불순물을 제거하면서 고기를 삶아준다.','천연다시다로 육수를 만들어 체에 걸러준다.','손질한 야채들과 청양고추를 잘라 함께 육수에 데쳐 국물에 매운 맛을 낸다.','곁들이장을 만들어 준다.','냄비에 데쳐준 채소와 국물을 붓고 고기를 먹기좋게 썰어 소스랑 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (120,'열무김치파스타',2,5,'120.png','파스타면 50g, 열무김치 100g, 오이 20g, 청홍고추 각각 15g, 노란 파프리카 30g, 양파 30g, 당근 25g, 생들기름 30g, 통깨 2g, 청양고추 30g','뜨거운 물에 파스타면을 삶아낸 뒤 물기를 빼준다.','송송 썬 청양고추를 생들기름에 볶아주다 면을 볶는다.','볶아준 청양고추에 삶아진 면을 볶아준다.','열무김치는 송송 썰어서 들기름에 살짝 볶아준다.','오이는 돌려깎기 해서 채 썰어주고 청고추, 2가지색 파프리카, 당근도 채 썰어 각각 볶아 준다.','청양고추에 볶아진 파스타면을 볶은 채소와 한 번 더 볶아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (121,'전복죽',1,1,'121.png','전복 100g, 당근 15g, 건조미역 10g, 찹쌀 50g, 흑임자 3g, 참기름 15g, 청주 15g, 흰후추 2g','찹쌀은 불려주고 전복은 손질해 내장과 분리해 준 뒤 청주를 넣어서 전복 내장을 믹서에 갈아준다.','전복 몸에 칼집을 내준 후 참기름을 두른 팬에 구워준다.','당근과 미역은 송송 잘라준다.','전복내장을 먼저 참기름에 충분히 볶아준다.','내장을 볶아주다가 불린 찹쌀을 넣고 충분히 볶아준다.','죽이 완성될 때 당근, 미역을 넣고 죽을 끓여 주고 전복은 고명으로 올려준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (122,'주꾸미연포탕',3,1,'122.png','주꾸미 200g, 무 30g, 양파 50g, 대파 20g, 미나리 20g, 단호박 25g, 청고추 25g, 해물육수 400g, 청양고추 20g, 마늘 10g, 흰후추 1g','주꾸미는 세척해 물기를 빼준다.','무와 단호박은 먹기 좋게 썰어준다.','청고추, 미나리, 양파를 먹기 좋게 썰어준다.','청양 고추를 어슷하게 썰고 마늘은 편으로 썰어 국물을 끓여준다.','국물이 만들어지면 무, 단호박을 넣고 끓여준다.','국물에 대파를 넣어주고 모든 재료를 넣어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (123,'달콤스테이크',4,4,'123.png','소 채끝살 200g, 감자 70g, 시금치 25g, 당근 30g, 레드와인 200cc. 망고 50g, 딸기잼 30g, 볶은소금 0.5g, 후추 2g, 무염버터 5g, 설탕 10g, 레몬즙 5g, 다진양파 15g','망고는 손질 후 버터로 살짝 볶고 레드와인을 넣고 졸이다가 믹서로 갈아주고 딸기잼으로 간과 농도를 맞추어 레드와인 소스를 만든다.','소 채끝살은 손질 후 만들어진 레드와인 소스에 마리네이드 해준다.','감자는 껍질을 제거 후 먹기 좋은 크기로 잘라서 뜨거운 물에 데쳐내 버터에 볶아준다. 당근은 먹기좋은 크기로 잘라 뜨거운 물에 데쳐 버터에 볶아주고, 시금치도 데친 후 수분을 제거하고 버터에 볶는다.','마리네이드 한 고기를 구워준다.','마리네이드 하고 남은 망고소스를 다시 팬에 졸여 소스를 만든다.','접시에 준비된 채소와 안심을 담고 소스를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (124,'삼색샌드위치',7,4,'124.png','식빵(100g), 토마토(20g), 어린이치즈(20g), 양상추(30g), 감자(30g), 올리고당(20g), 달걀(60g), 당근(20g), 오이(20g), 양파(20g), 소금(0.3g)','식빵은 가장 자리를 잘라 밀대를 이용하여 얇게 밀어 준비한다.','감자는 삶은 뒤 곱게 으깨어 올리고당을 넣고 골고루 섞는다.','달걀은 약 13분 정도 삶아 껍질을 벗기고, 반으로 갈라 썰어놓는다.','당근과 양파 오이도 얇게 썰어놓는다.','토마토는 포를 떠서 준비한다.','으깬 감자(②)에 준비한 달걀(③)과 채소(④)를 넣고 소금을 약간 넣은 뒤 골고루 섞어, 밀어 놓은 식빵에 토마토, 치즈, 양상추와 함께 넣어 돌돌 말아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (125,'황태탕수육',5,2,'125.png','황태채(100g), 밀가루(30g), 찹쌀가루(10g), 녹말가루(10g), 삼색분말(각 10g), 달걀(50g), 튀김기름(200g), 파프리카(30g), 양파(30g), 당근(30g), 오이(30g), 파인애플(30g), 저염간장(20g), 설탕(20g), 식초(10g), 물녹말(녹말가루 10g, 물 10g)','황태는 가위로 약 3cm 길이로 잘라 스프레이로 물기를 준다.','밀가루를 세 군데로 나눠 각각 찹쌀가루와 녹말가루, 삼색 가루를 넣어 세 가지의 색을 만든다.','만들어 놓은 밀가루에 달걀을 넣어 골고루 섞는다.','튀김 반죽(③)에 황태(①)를 넣어 섞은 후, 튀김 기름 170℃ 의 온도에서 약 1분 정도 튀겨 기름을 빼 놓는다.','파프리카는 속씨를 제거하고, 양파와 당근, 오이, 파인애플과 함께 썰어 준비한다.','저염간장에 설탕과 식초를 넣어 골고루 섞은 후 냄비에서 바글바글 끓이다가 물녹말을 넣고, 썰어놓은 채소를 넣어 한 번 더 끓인 후 황태 탕수육(④)에 곁들여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (126,'버섯만두찜',2,1,'126.png','밀가루(100g), 시금치가루(10g), 호박가루(10g), 백년초가루(10g), 물 (40g),식용유(3g), 소금(0.5g), 양파(20g), 양송이버섯(30g), 새송이버섯(20g), 표고버섯(30g), 두부(20g), 소금(0.5g), 새우(20g), 마늘(10g), 우유(200g), 생크림(20g)','밀가루를 세 개로 나눠 호박가루와 백년초가루, 시금치가루를 각각 넣고 물, 식용유, 소금을 넣어 반죽 한 후 비닐봉지에 담아 1~2시간 정도 숙성 시킨다.','양파, 마늘, 버섯들은 입자있게 다져 준비한다.','두부는 소창을 이용하여 물기를 짜낸다.','새우는 껍질과 내장을 제거하고 다져, 마늘을 넣고 골고루 섞어준다.','다진 채소(②), 으깬 두부(③), 새우 (④)를 넣고 섞어서 만두소를 만들어 준다.','숙성된 만두 반죽(①)을 얇게 밀어 꽃 모양으로 찍어 만두소(⑤)를 넣은 뒤, 반죽을 맞잡아 모양을 만든다. 우유와 생크림을 끓인 뒤 만들어 놓은 만두를 넣고 은근히 찜을 하듯이 익혀 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (127,'조개크림파스타',5,4,'127.png','스파게티(100g), 올리브오일(3g), 소금(0.3g), 양송이(20g), 새우(50g), 파슬리가루(0.3g), 버터(20g), 양파(20g), 마늘(20g), 밀가루(20g), 육수(100g), 우유(100g), 생크림(20g), 조개(30g), 물(100g)','스파게티는 끓는 물에 소금을 넣고 약 10분 정도 삶아 건져 올리브 오일에 살짝 발라 준비한다.','양송이는 껍질을 벗겨 편으로 썰어 놓는다.','마늘과 양파는 굵게 다져놓는다.','조개는 끓는 물에 데쳐 해감을 씻고, 삶은 물을 소창에 걸러 육수를 만들어 놓는다.','냄비에 버터를 넣고, 다진 마늘과 양파를 넣어 볶다가 밀가루를 넣고 은근히 볶는다.','볶고 있는 채소(⑤)에 육수(④)를 부어 한소끔 끓인 뒤, 우유와 생크림을 넣고 다시 끓으면 새우와 삶은 조개를 넣고 살짝 끓인 후, 삶아놓은 스파게티면 (①)을 넣고 한 번 더 끓이고 그 위에 파슬리 가루를 살짝 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (128,'닭날개튀김',5,4,'128.png','닭봉(120g), 오렌지(30g), 레몬(20g), 생강즙(10g), 카레가루(30g), 튀김기름(400g), 양파(20g), 땅콩(20g), 마요네즈(20g), 파스리가루(0.3g), 요거트(30g), 어린잎(10g)','닭날개는 끝을 잘라 뒤로 뒤집어 봉을 만든다.','오렌지즙과 레몬즙을 짜서 섞어 주고, 생강을 갈아 소창에 걸러 즙을 낸다.','닭봉(①)에 생강즙, 오렌지 ? 레몬즙 (②)을 발라 숙성시킨 후 다시 카레 가루를 입힌다.','땅콩은 물기 없이 입자있게 다진다.','양파를 입자있게 다져 다진 땅콩과 마요네즈, 파슬리가루, 요거트를 넣고 골고루 섞어 소스를 만들어 놓는다.','카레가루를 입힌 닭봉은 튀김기름 170~180℃ 온도에서 약 3분 정도 튀겨 기름을 빼고, 접시에 어린잎을 담고 만들어 놓은 소스와 닭봉을 함께 제공하여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (129,'해산물리조또',1,4,'129.png','보리쌀(50g), 당근(20g), 양파(20g), 마늘(10g), 대파(10g), 버터(10g), 오징어(50g), 새우(50g), 시금치(20g), 소금(0.2g), 생크림(20g), 우유(100g), 치즈(50g), 파슬리가루(0.3g), 조개(30g), 다시마(10g)','보리는 깨끗이 씻어 물에 약 30분 이상 불려 놓고, 당근, 양파, 마늘, 대파는 입자있게 다져 준비한다.','시금치는 끓는 물에 소금을 넣고 데친 후 생크림을 넣고 함께 갈아서 준비한다.','오징어는 껍질을 벗겨 안쪽에 칼집을 내어 새우와 함께 데치고, 조개는 해감 후 다시마를 넣고 삶은 뒤 소창에 걸러 육수를 만들어 놓는다.','냄비에 버터를 넣고, 다진 마늘과 양파 당근을 볶다가 불린 보리를 넣어 다시 볶는다.','볶아지는 냄비에 조개 삶은 육수를 넣어 끓인다.','끓여지는 냄비에 데친 조개와 해물, 치즈, 우유를 넣어 어우러지게 저어가며 졸이듯 끓이다가 마지막에 시금치와 생크림 갈은 것(②)을 넣고 살짝 끓인 후 파슬리 가루를 살짝 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (130,'떡갈비찜',4,1,'130.png','다진 돼지고기(50g), 다진 쇠고기(30g), 가지(10g), 가래떡(60g), 유자청(15g), 간장(5g), 연근(4g), 다진 파(5g), 다진 마늘(5g), 다진 양파(10g), 소금(1g), 후춧가루(1g), 참기름(3g)','돼지고기와 쇠고기는 고기 밑간을 넣고 반죽을 만든다.','가지를 길고 얇게 썬다.','깨끗이 씻은 떡을 가지로 돌돌 말고 그 위에 고기를 말아 떡갈비를 만들고 팬에서 겉면이 노릇해질 때까지만 익힌 뒤 김 오른 찜기에 넣어 10분~15분 정도 찐다.','유자청과 간장을 섞고 팬에서 농도를 맞춰주며 살짝 졸여 유자소스를 만든다.','연근은 모양대로 얇게 썰어 기름에 튀겨 연근칩을 만든다.','떡갈비에 유자소스를 바르고 연근칩을 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (131,'단호박제육볶음',5,1,'131.png','돼지고기(불고기용, 100g), 단호박(50g), 죽순(15g), 양파(10g), 대파(10g), 마른 표고버섯(10g), 저염간장(5g), 고추장(10g), 고춧가루(5g), 된장(5g), 물(150g), 다진 마늘(3g), 부순 참깨(1g), 참기름(1g)','돼지고기는 핏물을 제거하고 된장육수에 살짝 데친다.','데친 돼지고기에 양념장을 넣고 재운다.','단호박은 도톰하게 썰고, 죽순, 양파는 채 썰고, 대파는 어슷 썰고, 마른 표고버섯은 불린 뒤 먹기 좋은 크기로 썬다.','팬에 올리브유를 두르고 재운 돼지고기와 된장육수(50g)를 넣고 볶는다.','반 정도 익었을 때 단호박과 죽순, 양파, 대파, 표고버섯, 다진 마늘을 넣고 볶는다.','부순 참깨와 참기름을 넣어 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (132,'차돌박이볶음',5,1,'132.png','차돌박이(100g), 파프리카(15g), 양파(10g), 부추(5g), 해초(50g), 발사믹식초(5g), 매실청(5g), 올리브유(5g), 마요네즈(10g), 연겨자(5g), 유자청(10g), 식초(5g), 설탕(1.5g), 후춧가루(0.1g), 저염 간장(3g), 배(10g), 양파(5g), 설탕(2g), 식초(5g)','차돌박이는 고기 밑간에 재워둔다.','파프리카, 양파는 깨끗이 씻어 곱게 채 썰고, 부추도 비슷한 길이로 썬다.','해초는 깨끗이 손질하여 해초 밑간에 재운다.','3가지 소스를 만든다.','차돌박이를 팬에 볶아 준비한다.','볶은 차돌박이와 해초, 부추, 파프리카, 양파를 접시에 담고 삼색소스를 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (133,'토마토오리볶음',5,1,'133.png','오리고기(120g), 가지(25g), 양파(20g), 파프리카(20g), 새송이버섯(10g), 브로콜리(25g), 부추(7g), 방울토마토(15g), 후춧가루(2g), 맛술(8g), 다진 마늘(3g), 토마토(50g), 양파(10g), 풋고추(5g), 다진 마늘(2g), 고추장(10g), 물엿(4g)','오리고기에 고기 밑간을 해 재운다.','가지, 양파, 파프리카, 새송이버섯은 깍둑 썰고, 브로콜리는 먹기 좋은 크기로 썰고, 부추는 5㎝ 길이로 썰고, 방울토마토는 꼭지만 따서 씻은 뒤 4등분한다.','토마토, 양파, 풋고추는 갈아둔다.','팬에 기름을 두르고 다진 마늘을 넣고 볶다가 고추장과 갈아놓은 토마토, 양파, 풋고추와 물엿을 넣고 볶으면서 농도를 맞춰 토마토고추장소스를 만든다.','오리고기와 가지, 양파, 파프리카, 새송이버섯, 브로콜리를 같이 볶는다.','접시에 담은 뒤 부추와 방울토마토를 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (134,'효도강정',7,1,'134.png','볶은현미 25g, 볶은율무 25g, 볶은수수 25g, 혼합견과 50g, 흑임자 10g, 올리고당 25g, 설탕 25g, 기름 10g','모든 재료를 한데 섞어준다.','소스를 만들어준다.','준비된 틀에 비닐을 깔고 기름을 발라준다.','소스가 끓어오르면 모든 재료를 넣어 버무려 준다.','준비된 용기에 만들어진 재료를 쏟아 다져준다.','식으면 잘라서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (135,'관자브로콜리스프',3,4,'135.png','관자 100g, 양파 25g, 브로콜리 40g, 시금치 10g, 생크림 25g, 우유 200g, 버터 15g, 파마산가루 3g, 다진마늘 5g, 흰후추 1g, 마늘칩 2g','관자 50g은 편으로 썰어준다.','편으로 썰어준 관자를 다진마늘, 흰후추, 버터에 볶아준다.','남은 관자 50g은 국물을 만들어준다.','브로콜리와 시금치는 뜨거운 물에 데쳐낸 후 국물 낸 볶은관자와 브로콜리, 시금치는 믹서에 간다.','팬에 넣고 끓이고 우유를 넣고 한 번 더 끓여준다.','생크림과 파마산치즈로 농도를 맞춘 후 그릇에 담고 마늘칩을 올려서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (136,'블루베리양갱',7,1,'136.png','흰앙금 100g, 블루베리 30g, 설탕 30g, 한천 20g, 물100g','블루베리는 믹서에 갈아서 체에 내려준다.','물에 끓여주면서 흰앙금과 설탕을 풀어준다.','여기에 다시 한천가루를 넣어 끓여준다.','여기에 블루베리를 넣어 끓인다.','몰드에 넣어서 시원한 곳에서 식혀준다.','접시에 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (137,'장어찜',4,1,'137.png','장어 250g, 우유 100g, 후추 1g, 우엉 25g, 인삼 20g, 미나리 20g, 팽이 15g, 양파 40g, 청고추 17g, 홍고추 15g, 맛간장 7g','장어 살 쪽에 칼집을 내어 우유와 후추로 마리네이드 해서 비린내를 제거한다.','우엉, 인삼, 홍고추는 채 썰어 냉수에 담가둔다.','미나리, 팽이는 먹기 좋게 썰어준다.','양파, 청고추는 가늘게 채 썰어준다.','장어는 찜기에 쪄준다.','모든 채소를 한데 섞어 샐러드소스로 버무려 샐러드를 만들어주고 장어와 함께 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (138,'해물순두부된장찌개',3,1,'138.png','바지락(5g), 주꾸미(60g), 마른 미역(1g), 마른 표고버섯(10g), 순두부(80g), 대파(5g), 멸치(2g), 된장(7g), 콩가루(10g)','물(250g)에 멸치를 넣고 육수를 낸다.','바지락은 해감해 준비하고 주꾸미는 손질한다.','마른 미역과 마른 표고버섯은 물에 불린다.','육수에 된장을 풀고, 바지락과 주꾸미를 넣어 끓인다.','해물이 어느 정도 익으면 미역, 표고버섯을 넣고 끓인다.','끓어오르면 순두부를 넣고 콩가루를 넣어 더 끓이다가 송송 썬 대파를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (139,'호박 고구마 스프',3,4,'139.png','고구마 70g(1/2개), 단호박 30g(4×6cm), 우유 100ml(1/2컵), 설탕 2g(1/3작은술), 물 50ml(1/4컵)','고구마는 씻어서 작게 자르고, 단호박은 물에 씻어 씨를 제거한뒤, 고구마와 단호박을 찜기에 10~20분 동안 익힌다.','고구마와 단호박이 다 익으면 껍질을 제거하고 으깨어 체에 거른다.','냄비에 체에 거른 고구마와 단호박(2), 우유와 설탕을 넣고 잘 저어주며 끓인다.','스프의 농도를 보면서 물을 조금씩 넣어가며 걸쭉하게 끓여준다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (140,'시금치 리조또',1,4,'140.png','밥 180g(1컵), 시금치 50g(1/2개), 마 10g(5cm), 두유 150g(3/4컵), 소금 1g, 버터 8g(1과1/2작은술), 후춧가루 1g','시금치는 뚜껑을 열고 데친 후, 물기를 뺀다.','마, 시금치, 두유를 함께 갈아 체에 거른다.','가열된 팬에 버터를 두르고 약불에서 2와 밥을 넣어 밥의 색을 입힌다.','소금, 후춧가루로 간을 한 뒤 접시에 담아 완성한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (141,'폴렌타 샐러드',6,4,'141.png','미니파프리카 20g(2개), 모짜렐라치즈 25g, 샐러드채소 20g, 토마토 20g(1/6개), 폴렌타 20g(1과1/2큰술), 레디쉬 10g(1개), 우유 30g(2큰술), 요거트 30g(2큰술)','토마토는 4등분하고, 레디쉬는 슬라이스 한다.','모짜렐라치즈는 동그랗게 자른다.','미니파프리카는 반으로 잘라 씨를 뺀다.','폴렌타는 우유와 함께 끓인다.','미니파프리카에 4를 채운다.','접시에 모짜렐라치즈와 속을 채운 파프리카를 번갈아가며 담고, 샐러드채소와 토마토, 레디쉬는 섞어서 한쪽에 담는다.','요거트를 뿌려 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (142,'새우탬벨',7,4,'142.png','보리새우 400g(2컵), 버터 5g(1작은술), 양파 40g(1/4개), 마늘 10g(2개), 바질 5g(3잎), 후춧가루 4g(1작은술), 달걀(흰자) 1 0g(2개), 망고 100g(1개), 황파프리카 140g(1과1/2개), 방울토마토 10g(1개), 레디쉬 5g(1/2개), 어린잎채소 30g, 두릅 15g(1개)','황파프리카와 망고를 믹서에 갈아 체에 내린다.','방울토마토는 2등분해주고, 레디쉬는 슬라이스 한다.','두릅은 뜨거운 물에 데쳐 찬물에 식힌다.','리새우, 양파, 마늘은 다져서 후춧가루, 바질, 달걀흰자를 넣어 섞는다.','원형 틀에 버터를 발라 4번을 채우고 찜통에 넣어 찐다.','접시에 1을 깔고 어린잎 채소를 올린다.','그 위에 새우탬벨을 올린 후 방울토마토, 레디쉬, 어린잎채소, 두릅으로 장식해 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (143,'구운 바나나',7,6,'143.png','바나나 100g(1개), 설탕 5g(1/2작은술), 다진 호두 15g(1큰술)','바나나는 껍질을 벗겨 2등분한다.','가열된 팬에 기름을 두르지 않고 바나나를 굽는다.','구워진 바나나의 겉면에 설탕을 뿌리고 가열된 팬에 굽는다.','완성된 바나나를 접시에 담고, 다진 호두를 뿌린다. (기호에 따라 초코시럽, 캬라멜시럽 등을 뿌려 먹는다.)',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (144,'과일무스 테린',7,4,'144.png','딸기 100g(5개), 키위 100g(1개), 매실원액 15g(1큰술), 젤라틴 20g, 망고 20g(1/5개), 우유 45g(3큰술)','망고와 우유를 섞어 믹서에 갈아 팬에 넣고 끓인다.','딸기와 키위는 0.5×0.5×0.5cm로 썬다.','젤라틴은 녹여서 매실원액과 섞는다.','3과 4를 섞어서 틀에 넣어 굳힌다.','3의 위에 망고소스를 뿌려 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (145,'비타민이유식',3,6,'145.png','멜론 300g, 브로콜리 30g, 감자 60g, 요거트 15g, 설탕 5g','브로콜리는 데쳐낸 후 송송 다져준다.','감자는 삶아준 후 체에 내려준다.','멜론은 씨를 제거하고 껍질을 벗긴 후 믹서에 갈아 체에 내려준다.','체에 내린 감자와 브로콜리 그리고 멜론즙을 함께 섞어준다.','설탕으로 간을 해주고 볼에 담고 요거트로 장식을 해 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (146,'토마토라면',2,1,'146.png','애호박(30g), 양파(20g), 청양고추(5g), 대파(5g), 토마토(300g), 라면스프(3g), 라면(100g), 다시마(2.5g), 멸치(2.5g), 무(10g)','냄비에 육수 재료를 넣고 10분간 끓여 건더기를 건진다.','애호박은 돌려 깎아 채 썰고, 양파도 채 썰고, 청양고추와 대파는 어슷 썬다.','토마토는 200g은 잘게 다지고, 100g은 두툼하게 썬다.','육수에 라면스프와 라면을 넣고 살짝 익힌 뒤 양파, 애호박, 다진 토마토를 넣고 끓인다.','면이 다 익으면 두툼하게 썬 토마토를 넣고 10초간 더 끓인다.','대파와 청양고추를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (147,'녹차귀리라떼',9,4,'147.png','브로콜리 60g, 귀리 30g, 닭육수 250ml, 우유150ml, 녹차가루 10g, 아몬드슬라이스 20g, 무염버터 5g, 흰후추 3g, 소금 0.5g, 우유 50ml, 생크림 50ml, 다진양파 15g','귀리는 불려준 뒤 닭육수에 삶아준다.','브로콜리는 잘 손질하여 잘게 썰어 놓는다.','양파는 채 썰어 버터로 볶다가 1의 브로콜리와 귀리, 아몬드슬라이스를 넣고 같이 볶아준다.','어느 정도 볶아지면 우유를 넣고 다시 한 번 볶아준다.','닭육수를 넣고 귀리가 익을 때 까지 푹 익힌 후 믹서에 갈아 체에 걸러준다.','마지막으로 생크림을 넣고 농도를 조절하고 녹차가루를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (148,'블루베리냉스프',7,4,'148.png','검은콩두유 50g, 꿀 15g, 딸기 20g, 블루베리 20g, 저지방우유 50g, 볶은현미 20g, 바나나 50g, 브로콜리 15g, 라이스페이퍼 1장, 건조체리 15g','브로콜리는 먹기 좋게 잘라서 데쳐준다.','건조체리는 손질해 씨를 제거하고 송송 다져서 먹기 좋게 잘라준다.','라이스페이퍼를 뜨거운 물에 데쳐내 체리를 말아 체리 만두를 만든다.','만들어진 체리 만두를 팬에 살짝 구워서 라이스페이퍼를 고소하게 만든다.','블루베리, 딸기, 바나나, 검은콩두유와 우유를 한데 섞어 믹서에 갈아준다.','갈아둔 스프를 담고 브로콜리와 체리 만두를 올리고 먹기 전에 볶은 현미를 올려준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (149,'마마무스프',3,5,'149.png','무(50g), 마(50g), 우유(50g), 생크림(20g), 시금치(30g)\n대파(10g), 양파(20g), 육수(50g), 소금( 0.2g), 버터(10g)','양파와 파는 다져 준비한다.','무는 채를 썰어 놓는다.','시금치는 끓는 물에 소금을 넣고 데쳐, 우유와 함께 갈아 준비한다.','마는 강판에 갈아 시금치 우유(③)에 섞는다.','다져 놓은 양파와 파는 냄비에 버터를 넣고 볶는다.','볶아지는 채소(⑤)에 무(②)와 육수를 붓고 끓여서 무가 익으면 충분히 식힌 뒤, 준비한 우유(④)와 함께 믹서에 갈고, 생크림을 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (150,'크림치즈떡볶이',1,1,'150.png','떡볶이떡(100g), 펜네(20g), 양파(20g), 버터(10g), 밀가루(10g), 육수(100g), 생크림(20g), 우유(50g), 모짜렐라치즈(30g), 파슬리가루(0.3g)','펜네는 10분정도 삶아 데치고, 떡볶이 떡은 뜨거운 물에 살짝 불려 놓는다','양파는 채를 썰어 준비한다.','냄비에 버터를 넣고 밀가루를 넣어 볶는다.','볶아지는 밀가루에 준비한 육수를 넣는다.','육수가 은근히 끓으면 우유와 생크림 넣어준다.','끓고 있는 냄비에 떡볶이떡, 삶은 펜네와 양파를 넣어 끓인 후 모짜렐라치즈를 넣고 치즈가 녹으면 파슬리가루를 살짝 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (51,'민들레 샐러드 ',6,5,'51.png','민들레 잎 40g, 비트 5g(1작은술), 오렌지(껍질) 40g(1/5개),간장 20g(1과1/3큰술), 다진 홍고추 10g(1개), 레몬즙 60g(4큰술), 설탕 6g(1작은술)','간장, 레몬즙, 설탕, 다진 홍고추를 섞어 드레싱을 만든다.','민들레 잎을 씻어 4×4cm로 썬다.','비트는 채 썰고 물에 담가 색을 뺀다.','오렌지는 씻어 껍질만 발라 채 썬다.','민들레 잎, 비트, 오렌지 껍질을 섞어 접시에 담고 드레싱을 곁들인다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (52,'토마토 가지 카프레제',6,4,'52.png','가지 100g(1개), 토마토 200g(1과1/2개), 무순 20g, 마늘 10g(2개), 올리브오일 5g(1작은술) 올리브오일 25g(2큰술), 발사믹식초 60g(4큰술), 후춧가루 2g(1/2작은술)','가지 100g(1개), 토마토 200g(1½개), 무순 20g, 마늘 10g(2개), 올리브오일 5g(1작은술),올리브오일 25g(2큰술), 발사믹식초 60g(4큰술), 후춧가루 2g(1/2작은술)','올리브오일, 발사믹식초, 후춧가루를 섞어 차게 식혀 드레싱을 만든다.','가지와 토마토는 5mm두께로 썬다.','가지와 토마토는 120도 오븐에 20분 굽고, 구운가지는 물기를 제거한다.','마늘은 채 썬다.','팬에 올리브오일을 두르고 약불에서 마늘을 볶다가, 가지를 넣고 굽는다.','접시에 토마토, 가지를 번갈아 담고 무순으로 장식한다.','드레싱을 곁들인다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (53,'버섯샐러드',6,5,'53.png','느타리버섯 50g(10개), 표고버섯 50g(3개), 양상추 40g(5장),양조간장 2g(1/2작은술), 설탕 5g(1작은술), 식초 2g(1/2작은술),방울토마토 24g(3개)','냄비에 양조간장, 물, 설탕, 식초를 넣고 원래 분량의 1/3 될 때까지 졸여 소스를 만든다.','양상추는 4×4cm로 찢은 후 찬물에 담근다.','방울토마토는 4등분으로 자른다.','느타리버섯은 손으로 찢고. 표고버섯은 두께 1.5cm 정도로 자른다.','끓는 물에 버섯을 데치고, 찬물에 씻어 물기를 제거한다.','물에 담가 놓았던 양상추의 물기를 제거하고, 완성그릇에 담은 후 그 위에 버섯을 올린다.','소스와 방울토마토를 올려 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (54,'우렁된장소스 배추롤',6,1,'54.png','돼지고기(50g), 배춧잎(5장), 부추(30g), 쌀(100g), 당근(20g),표고버섯(2개), 양파(50g), 애호박(1/2개), 우렁이(100g),된장(30g)','끓는 물에 배춧잎을 데친다.','당근, 호박, 표고버섯, 양파는 입자있게 다진다.','돼지고기를 썰어 불린 쌀, 다진 야채와 함께 밥을 짓는다.','데친 배춧잎에 지어놓은 밥을 올려 돌돌만다.','말아 놓은 배춧잎을 부추로 묶는다.','찜통에 김이 오르면 ?번을 넣고 약 5분 정도 찐다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (55,'인삼떡갈비',4,1,'55.png','소고기(100g), 돼지고기(100g), 대추(3알), 양파(30g),마늘(20g), 배(1/4개), 애호박(1/2개), 단호박(1/4개),파프리카(50g), 인삼(1뿌리), 양송이(5개), 배추잎(5장), 저염간장(20g), 설탕(20g), 소금(0.2g), 후춧가루(0.01g), 두부(50g)','대추는 돌려 깍아 씨를 제거 하고 곱게 다진다.','다진 소고기와 돼지고기에 대추와 소금, 후춧가루를 넣고 치댄다.','애호박과 단호박, 파프리카는 입자있게 썰어 접시에 넣고 잘 치댄다.','양송이는 편으로 썰어 팬에 익히고, 인삼을 뇌두를 자르고 깨끗이 씻어 팬에 볶아 잘게 썰어 접시에 넣는다.','재료가 골고루 섞인 떡갈비를 갈비 모양으로 만든다.','떡갈비를 팬에 굽고, 접시에 배춧잎을 깔고 익힌 양송이를 올리고 떡갈비를 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (56,'호박잎 삼계탕',3,1,'56.png','호박잎(5장), 닭고기(가슴살, 120g), 찹쌀(100g), 대추(3알),미나리(20g), 인삼(1뿌리), 소금(0.2g), 후춧가루(0.01g)','찹쌀은 깨끗이 씻어 30분 정도 불린다','불린 찹쌀은 냄비에 넣고 질게 밥을한다.','닭가슴살은 넓게 펴서 소금, 후춧가루를 뿌린다.','호박잎과 미나리는 끓는 물에 살짝 데치고, 대추는 돌려 깎아 씨를 제거하고 인삼은 뇌두를 제거한 뒤 채를 썰어둔다.','닭 가슴살위에 찹쌀밥과 준비한 야채와 대추를 올려 돌돌 말아 질게 된 찹쌀밥에 넣고 약 20분 정도 더 쪄낸다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (57,'황태미역 곤약국',3,1,'57.png','황태채(100g), 곤약(100g), 건미역(20g), 들깨가루(20g),두부(50g), 된장(10g), 액젓(10g), 표고버섯(1개), 마늘(10g),참기름(5g)','된장에 두부를 넣고 골고루 섞는다.','표고버섯과 마늘은 함께 갈아둔다.','미역은 충분히 불린다.','냄비에 황태채와 갈아둔 표고버섯, 마늘을 넣고 은근히 끓여 육수를 만든다.','곤약은 납작납작하게 썰어 끓는 물에 데친다.','육수에서 황태를 건져 두부된장과 함께 갈아 육수에 붓고, 미역, 곤약, 들깨가루를 넣고 약 20분 정도 끓인 후 액젓으로 간을 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (58,'훈제오리가슴살 샐러드',6,5,'58.png','오리고기(훈제오리 가슴살, 150g), 발사믹소스(50g), 양파(30g), 파슬리(5g), 블루베리(20g), 레디쉬(1개)','훈제오리 가슴살을 슬라이스한다.','슬라이스한 훈제오리는 팬에 굽는다.','양파는 채썰고 찬물에 담근 뒤 건진다.','레디쉬는 채썰고 찬물에 담근 뒤 건진다.','먹기 직전에 발사믹소스를 만든다.','접시에 훈제오리와 양파채, 레디쉬, 블루베리를 담고 발사믹소스를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (59,'새우전복찜',4,1,'59.png','전복(2개), 새우(3마리), 시금치(30g), 해초(20g), 저염간장(20g), 레몬(1/4개), 설탕(20g), 소금(0.1g), 마늘(10g), 녹말(10g), 식용꽃(60g)','전복은 수저로 떼어내어 소금으로 비벼 깨끗이 씻는다.','시금치는 데쳐 다지고, 새우는 껍질을 벗겨 전복, 해초와 함께 다진다.','3번을 잘 섞어 전복 껍질에 넣는다.','찜통에 김이 오르면 속을 채운 전복 껍질을 넣고 약 10분 정도 찐다','저염간장, 레몬, 설탕, 다진마늘을 넣고 살짝 끓여 소스를 만든다.','간장소스에 전분을 풀어 농도를 맞추고, 전복찜에 여러번 바르고 식용꽃을 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (60,'검은콩국수',3,1,'60.png','검은콩(200g), 메밀면(120g), 오이(30g), 방울토마토(1개), 땅콩(20g), 잣(10g), 참깨(5g)','검은콩은 깨끗이 씻어 약 12시간 정도 충분히 불린다.','불린 검은콩은 20분 정도 삶아 깨끗이 씻는다.','삶은 검은콩은 믹서기에 곱게 갈아 차갑게 식힌다.','오이는 씨를 제거하고 깨끗이 씻어 채썬다.','물을 끓여 메밀면을 삶고, 찬물에 여러번 헹구어 건져 물기를 뺀다.','메밀면을 그릇에 담고 차가운 콩 국물, 땅콩, 잣, 오이, 방울토마토 및 통깨를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (61,'산마샐러드',6,5,'61.png','산마(100g), 참나물(20g), 돈나물(20g), 토마토(100g), 레디쉬(1개), 어린잎(10g), 저염간장(20g), 식초(10g), 설탕(20g), 겨자가루(10g)','어린잎은 찬물에 담근다','마는 껍질을 벗겨 동글동글하게 썬다','썰어 놓은 마는 팬에 기름을 살짝 두르고 앞뒤로 굽는다.','썰어 놓은 마는 팬에 기름을 살짝 두르고 앞뒤로 굽는다.','저염간장에 식초, 설탕, 발효겨자를 넣고 골고루 섞어 소스를 만들고, 접시에 구운 마와 손질한 야채를 넣고 만들어 놓은 소스와 어린잎을 올린다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (62,'닭고기김치찌개',3,1,'62.png','닭가슴살(60g), 애호박(30g), 미나리(20g), 청양고추(3g), 두부(60g) 김치(120g), 참기름(20g), 느타리버섯(10g), 달걀(50g), 다시마(5g), 무(40g), 대파(5g), 양파(10g), 마른 고추(3g), 멸치(10g) 마늘(10g), 청주(10g), 물(300g)','육수 재료를 넣고 중간 불로 끓인 뒤 체에 걸러 육수를 만든다.','닭가슴살은 채 썬 뒤 물에 넣고 삶는다.','애호박은 반달 썰고, 미나리는 5㎝ 길이로 썰고, 청양고추는 잘게 썬 뒤 찬물에 담가 씨를 빼고, 두부는 한입 크기로 썰어 물에 담가둔다.','김치를 한입 크기로 썬 뒤 참기름에 볶다가 육수를 붓는다.','두부, 애호박, 느타리버섯, 미나리, 닭가슴살을 넣어 끓어오르면 달걀물과 청양고추를 넣고 조금 더 끓여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (63,'백김치콩비지찌개',3,1,'63.png','풋고추(10g), 백김치(100g), 콩비지(100g) 양념 참기름(8g), 후춧가루(0.2g), 다진 마늘(10g), 간장(2g)','풋고추는 잘게 다진다.','백김치는 먹기 좋은 크기로 썬다.','냄비에 백김치를 볶다가 김치가 익으면 참기름, 후춧가루, 다진 마늘을 넣고 볶는다.','물(200g)을 넣고 끓인다.','물이 끓으면 콩비지와 간장, 풋고추를 넣어 약한 불에서 15분 정도 끓여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (64,'해물김치찌개',3,1,'64.png','바지락(100g), 주꾸미(100g), 김치(150g), 무(50g), 마늘(10g) 대파(10g), 양파(40g), 두부(50g), 참기름(5g), 배즙(50g), 팽이버섯(10g), 다시마(5g), 멸치(10g), 물(300g)','냄비에 육수 재료를 넣고 끓이다가 물이 끓어오르면 다시마를 건지고 조금 더 끓여 육수를 우려낸다.','바지락은 해감하고, 주꾸미는 내장과 입, 눈을 제거하고 4cm 크기로 잘라 준비한다.','김치는 국물을 꽉 짜서 한입 크기로 썰고, 무는 편 썰고, 마늘은 다지고, 대파는 어슷 썰고, 양파는 굵게 채 썰고, 두부는 납작하게 썬다.','냄비에 참기름을 두르고, 양파와 김치가 투명해질 때까지 볶다가 육수를 붓고 바지락을 넣어 끓으면 주꾸미를 넣어 더 끓인다.','김칫국물과 배즙을 2:1로 섞은 뒤 찌개에 넣어 간을 맞춘다.','두부, 팽이버섯을 넣고 한소끔 끓여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (65,'쑥갓부대찌개',3,1,'65.png','통조림 햄(55g), 애호박(35g), 두부(40g), 팽이버섯(40g), 청양고추(10g) 김치(65g), 다시마(5g), 쑥갓(7g), 설탕(0.5g), 고춧가루(1g), 다진 마늘(5g), 고추장(5g)','통조림 햄을 썰어 끓는 물에 데친다.','애호박은 반달모양으로 썰고, 두부는 도톰하게 썰고, 팽이버섯은 밑동을 자르고 3등분하고, 청양고추는 어슷 썬다.','김치는 씻어서 잘게 썬다.','양념장을 만든다.','냄비에 물(200g)과 다시마를 넣고 살짝 끓여 다시마육수를 만든다.','육수에 손질한 재료를 담고 양념장 반을 넣고 중간 불에 끓이다가 쑥갓과 남은 양념장을 넣고 약한 불에 조금 더 끓여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (66,'들깨순두부찌개',3,1,'66.png','굴(40g), 멸치(2g), 표고버섯(10g), 느타리버섯(40g), 무(20g) 양파(10g), 미나리(10g), 대파(3g), 붉은 고추(2g), 순두부(100g), 다진 마늘(1g), 들깻가루(10g), 국간장(1.5g), 소금(0.5g)','굴은 깨끗이 씻은 뒤 김 오른 찜기에 찐다','굴을 쪄낸 물(250g)에 멸치, 표고버섯 밑동을 넣고 끓인 뒤 멸치와 표고버섯 밑동을 건져내 육수를 만든다.','느타리버섯은 밑동을 제거한 후 씻어 세로로 찢고, 표고버섯은 0.5㎝ 두께로 썬다.','무는 나박 썰고 양파는 채 썰고, 미나리는 3㎝ 길이로 썰고, 대파와 고추는 송송 썬다.','육수에 굴, 다진 마늘, 무, 양파, 버섯을 넣고 끓인다.','들깻가루와 순두부를 넣고 한소끔 끓인 뒤 국간장과 소금으로 간을 맞추고 대파, 붉은 고추, 미나리를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (67,'토마토스프 파스타',2,4,'67.png','홀토마토 200g, 토마토 100g, 다진양파 30g, 다진마늘 20g, 먹물파스타 25g, 치즈 25g 파슬리가루 1g, 함초소금 1g, 올리브오일 30g, 양파 20g, 가지 20g, 파프리카 20g, 애호박 20g','토마토홀과 토마토는 송송 다져주고, 마늘, 양파를 냄비에서 볶은 후 믹서에 갈아 토마토 스프를 만들어준다.','만들어진 스프를 볶아서 신맛을 날려준다.','먹물파스타면은 삶은 뒤 오일에 버무려주고 볶아준다.','양파, 애호박, 가지, 2가지색 파프리카를 먹기 좋게 잘라 팬에 볶아준다.','접시에 볶아진 채소와 파스타면을 서로 다시 볶아준다.','치즈를 곱게 다져주고 접시에 파스타면을 올린 뒤, 토마토스프와 치즈가루를 뿌려 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (68,'오징어구이',4,6,'68.png','오징어 300g, 미니파프리카 40g, 양파 50g, 청고추 15g, 홍고추 15g, 다진마늘 15g, 고춧가루 15g, 홀토마토 50g, 고추장 15g, 설탕 15g 올리고당 15g, 후추 1g, 참기름 15g, 볶은 현미 15g','오징어는 솔방울 모양으로 잘라준다.','미니 파프리카, 양파, 청홍고추는 적당한 크기로 잘라준다.','다진마늘을 볶다가 오징어를 넣어 볶는다.','홀토마토와 양념장 재료를 넣어 볶는다.','팬을 약간 태우는 듯 해서 불맛과 매운맛을 더해준다.','접시에 담아주고 볶은 현미를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (69,'배숙구이',4,6,'69.png','배 750g, 후르츠칵테일 150g, 생강청 50g, 방울토마토 60g, 탄산수 200g','뚜껑을 만들 배의 윗동을 자르고, 수저로 배 속을 판다.','탄산수와 생강청을 미리 30분 전에 섞어준다.','방울토마토를 먹기 좋게 잘라준 후 속을 파낸 배에 후르츠 칵테일과 방울토마토를 넣어준다.','과일로 채워진 배에 미리 만든 생강탄산수를 부어준다.','배를 뚜껑을 덮어 호일로 싼 후 팬에 구워준다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (70,'웰빙스테이크',4,4,'70.png','쇠고기등심 240g, 시금치 50g, 마늘 15g, 양파 50g, 건바질 2g 감자 60g, 레몬 25g, 파슬리가루 1g, 르네디종 홀그레인머스터 15g, 사과 80g, 버터 15g','쇠고기는 칼집을 살짝 넣어준 후 건 바질을 뿌려 1시간 정도 숙성시킨다.','감자는 껍질을 벗긴 후 먹기 좋게 잘라 뜨거운 물에 70% 정도 익혀준다.','익혀준 감자를 버터를 살짝 바른 후 팬에 파슬리가루를 뿌려 구워준다.','시금치는 데쳐내 물기를 제거하고 다진 양파와 함께 버터에 볶아준다.','사과는 사방 1cm 크기로 자른 후 레몬즙을 살짝 뿌려준 후 버터에 볶아 소스를 만들어 준다.','숙성된 소고기를 팬에 구워주고 곁들이 채소와 소스를 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (71,'오징어콩순대',4,5,'71.png','오징어 1마리(220g), 옥수수 30g, 귀리밥 50g, 강낭콩 20g 당근 20g, 미니파프리카 20g, 피망 20g, 대파 10g, 양파 25g 카레가루 25g, 흰후추 1g, 다진마늘 5g, 참기름 15g, 밀가루 15g, 레몬즙 15g','오징어는 내장을 빼서 흐르는 물에 깨끗이 씻은 후, 다리는 송송 다져주고 레몬즙을 살짝 뿌려준다.','강낭콩은 먼저 삶아준다.','피망, 당근, 양파, 대파, 파프리카는 송송 다져준다.','잘라준 오징어다리는 다진마늘과 살짝 볶아준다.','볼에 귀리밥을 넣고 카레가루를 넣고 모든 재료를 섞어 소 재료를 만든다.','오징어 안쪽에 밀가루를 묻혀주고 소를 채워 팬에 구워준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (72,'토마토소고기장조림',4,5,'72.png','소고기 우둔살 200g, 메추리알 100g, 방울토마토 100g, 마늘 30g, 꽈리고추 50g, 양파 45g, 맛간장 30g, 흰후추 1g, 어간장 15g, 설탕 15g','소고기는 사방 2cm 정도의 크기로 잘라서 물에서 80% 정도까지 익혀준 후 냉수에 깨끗하게 세척해 준다.','양파는 먹기 좋게 자르고 물 400g과 함께 간장 물을 만들어준다.','간장 물에 데쳐 놓은 소고기부터 졸여주기 시작한다.','메추리알을 넣고 함께 졸여준다.','방울토마토, 양파, 마늘, 꽈리고추까지 넣고 마지막으로 졸여준다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (73,'맛간장삼치구이',4,1,'73.png','삼치 200g, 생강 50g, 대파 100g, 통깨 1g, 버터 10g, 맛간장 30g, 생강청 25g, 커피 1g','소스 재료를 이용해 맛 간장으로 만든 데리 야끼소스를 만들어준다.','참치는 손질해 수분을 빼준 후 흰 후추로 밑간을 해준다.','생강은 아주 곱게 채 썰어 냉수에 헹군다.','대파도 아주 가늘게 채 썰어서 냉수에 담가 매운맛을 빼준다.','버터를 올린 팬에 삼치를 약불에서 구워준다.','구워진 참치를 소스에 졸여주고 대파채를 올린다. 삼치에 소스를 뿌리고 생강채를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (74,'삼겹살꼬치구이',4,5,'74.png','삼겹살 200g, 방울토마토 100g, 마늘기름 15g, 후추 1g, 로즈마리 1g, 통후추 2g 대파 20g, 마늘 10g, 꽈리고추 25g, 대파 25g, 고춧가루 1g, 레몬즙 2g','삼겹살은 길이로 잘라서 마늘기름, 통후추, 로즈마리에 마리네이드 해준다.','대파는 흰 부분만 잘라 구워주고, 꽈리고추도 함께 구워준다.','대파는 가늘게 채 썰어 물에 담가준다.','물에 담가진 대파를 물기를 빼고 양념해준다.','삼겹살을 꼬치에 끼워 굽고 구워진 채소, 대파채와 함께 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (75,'새우아욱죽',1,1,'75.png','귀리밥 100g, 아욱 30g, 건새우 25g, 칵테일새우 25g, 저염 된장 30g','저염 된장을 물 300cc에 풀어준 뒤 건새우를 담가 30분 정도 담가준 뒤 살짝 끓여준다.','새우를 풀어준 된장 물을 체에 걸러준다.','아욱은 뜨거운 물에 데쳐서 먹기 좋게 썬다.','냄비에 밥과 된장 물을 풀어 끓인다.','어느 정도 끓으면 칵테일새우와 건져 놓았던 새우를 다시 넣어준다.','불을 끄기 전에 아욱을 넣어 한 번 더 끓여준 후 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (76,'까르보나라뇨끼',2,4,'76.png','감자 220g, 깻잎 10g, 베이컨 25g, 백일송이 25g 다진마늘 15g, 다진양파 25g, 다진대파 25g, 흰후추 3g, 버터15g, 우유 200g 생크림 30g, 설탕 10g, 치즈가루 15g','감자를 슬라이스 하여 찜통에 찐 후 체에 으깬다. 깻잎을 잘게 채 썰어서 냉수에 담가 향을 빼준다.','베이컨을 한 번 데쳐내 송송 썰어준 후 다진 마늘과 볶아준다.','으깬 감자와 깻잎을 다져서 반죽을 만들고 엄지손가락 크기로 떼어 밀가루를 뿌리고, 둥글게 빚은 후 포크로 자국을 내 뇨끼를 만든다.','만들어진 뇨끼를 삶아 건져준다.','팬에 버터를 넣고 다진양파, 다진마늘, 다진 대파, 볶은 베이컨, 새송이, 흰후추를 볶다가 우유와 생크림, 설탕을 넣고 끓여준다.','뇨끼를 넣어 한 번 더 끓여준 뒤 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (77,'호박죽',1,1,'77.png','단호박 200g, 찹쌀가루 100g, 브로콜리 50g, 양파 60g, 볶은 현미 25g 버섯마늘소금 2g, 흰후추 1g, 치즈가루 15g','단호박은 껍질을 까고 작게 잘라주고, 양파도 작게 잘라준다.','브로콜리는 뜨거운 물에 데쳐내 준 후 송송 잘라준다.','찹쌀가루는 물 100g에 풀어준다.','단호박과 양파는 물 300g에 삶아준다.','단호박과 양파가 익으면 믹서에 갈아서 다시 끓여준 뒤 찹쌀가루물을 넣어 끓여준다.','호박죽이 끓어오르면 치즈가루를 넣어준 후 볶은 현미랑 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (78,'라이스버거떡갈비',4,5,'78.png','밥 200g, 맛간장 15g, 전분가루 15g, 팽이버섯 20g, 흰후추 1g, 달걀 60g, 다진소고기 50g, 다진돼지고기 50g, 다진양파 30g, 다진쪽파 15g, 맛간장 10g, 후추 1g,토마토 80g, 미나리 20g, 맛간장 5g, 청고추 15g, 홍고추 15g','팽이버섯을 송송 다진 후 라이스버거 재료로 라이스버거를 만들어준다.','만들어준 버거는 팬에 구워준다.','토마토와 미나리를 먹기 좋게 잘라서 겉절이를 만들어준다.','떡갈비 재료로 떡 갈비를 만들어준다.','만들어진 떡갈비를 구워준다.','접시에 토마토 겉절이를 담고 라이스버거와 떡갈비를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (79,'치즈감자크로켓',5,3,'79.png','감자(150g), 생크림(20g), 당근(20g), 양파(20g), 오이(20g) 소금(0.5g), 모짜렐라치즈(50g), 밀가루(20g), 달걀(50g) 빵가루(50g), 튀김기름(400g)','감자는 껍질을 벗겨 삶는다.','오이와 당근은 어슷썰기를 하고 양파는 채를 썰어놓는다.','썰어 놓은 채소에 소금과 물을 넣고 살짝 절여, 물기를 짜놓는다.','삶아 놓은 감자를 채에 내리고 생크림을 넣어 섞는다.','생크림을 넣은 감자에 절여 놓은 채소와 모짜렐라치즈를 넣고 골고루 섞는다.','섞여진 감자를 크로켓 모양을 만들어 밀가루, 달걀물, 빵가루를 묻혀 튀김기름 170~180℃ 온도에서 바삭하게 튀겨 냅킨에 올려 기름을 제거하고, 접시에 담아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (80,'코코넛밀크카레밥',1,6,'80.png','두부(100g), 소금(0.3g), 코코넛밀크(20g), 당근(20g) 양파(20g), 브로컬리(20g), 돼지고기(50g), 감자(20g) 버터(10g), 카레가루(30g), 물(250g)','두부는 소창에 넣고, 짜서 물기를 제거하고, 으깨어 놓는다.','으깬 두부에 소금과 코코넛 밀크를 넣고 골고루 섞는다.','섞여진 두부를 김이 오른 찜통에 넣고 약 5분 정도 찐다.','당근과 양파는 사각지게 썰고, 브로컬리는 데쳐 당근 크기로 썰어 놓는다.','돼지고기와 감자는 당근 크기로 썰어 주고, 냄비에 버터를 녹여 돼지고기를 먼저 볶다가 양파와 당근, 감자, 브로컬리를 넣고 다시 볶아 준 뒤, 쪄놓은 두부를 넣어 한 번 더 볶아준다.','볶아지는 냄비(⑤)에 카레 가루를 넣고 살짝 더 볶아준 뒤, 물을 넣고 자작하게 끓여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (81,'햄버거스테이크',4,4,'81.png','다진 돼지고기(60g), 다진 소고기(60g), 다진 마늘(10g) 로즈마리(2g), 빵가루(20g), 후춧가루(0.2g), 파프리카(20g), 양파(20g), 플레인요거트(20g), 설탕(10g) 매실액(10g), 식초(5g), 녹말가루(10g), 어린잎(5g)','돼지고기와 소고기를 섞어, 매실액을 넣고 30분 정도 냉장고에서 숙성을 시킨다.','숙성된 돼지고기와 소고기에 다진마늘, 로즈마리, 빵가루, 후춧가루를 넣고 골고루 섞는다.','파프리카는 반으로 잘라 그 안에 씨를 수저를 이용해서 파낸다.','속을 파낸 파프리카에 양념한 고기를 넣고, 꼭꼭 눌러 두툼하게 잘라 구워 접시에 담는다.','양파는 입자있게 다져 팬에 기름을 넣고 은근히 볶아 양파 향을 낸다.','볶아진 팬(5번)에 준비한 플레인요거트와 설탕, 매실액을 넣고 끓이다가, 식초와 녹말을 넣고 한 번 더 끓여 소스를 완성한다. 햄버거스테이트(4번)에 소스를 얹고, 어린잎을 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (82,'냉토마토파스타',2,4,'82.png','토마토(50g), 브로컬리(20g), 펜네(100g), 올리브오일(10g) 후춧가루(0.1g), 마늘(10g), 양파(20g), 당근(20g), 방울토마토(50g) 올리브오일(10g), 육수(400g), 설탕(10g) 소금(0.3g), 레몬즙(10g), 월계수잎(1장)','마늘은 곱게 다지고 양파, 당근, 방울토마토는 입자있게 다진다.','토마토는 씨와 껍질을 제거하고 채를 썰어놓는다.','브로컬리를 끓는 물에 데쳐 찬물에 헹구어 작게 썰어 준비한다.','펜네는 끓는 물에 약 10분 정도 삶아 건진다.','건져진 펜네는 올리브오일을 넣어 무친 후 그릇에 담아놓는다.','냄비에 오일을 넣고 마늘과 양파를 볶다가 당근과 방울토마토를 넣어 볶으면서 육수를 붓고 설탕과 소금, 레몬즙, 월계수잎을 넣고 끓인 뒤 월계수잎을 건져내고, 차갑게 식힌 후 그릇에 담겨 있는 펜네에 토마토채(2번)와 브로컬리(3번)를 함께 넣어 담아 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (83,'닭고기또띠아',1,4,'83.png','또띠아(50g), 닭고기살(100g), 느타리버섯(20g), 사과(20g) 오이(20g), 파프리카(20g), 애호박(20g), 양파(20g), 식초(10g), 아몬드(10g), 우유(20g), 머스터드(20g), 올리고당(20g)','닭고기살은 끓는 물에 데쳐 손으로 찢고, 느타리버섯도 데쳐 손으로 찢어 준비한다.','사과는 씨를 제거하고 약 6cm 길이로 채를 썰고, 오이와 파프리카도 같은 길이로 채를 썰어 놓는다.','애호박은 반달로 썰어 식초에 살짝 절여서 볶고, 양파는 채를 썰어 물에 잠시 담가 놓는다.','아몬드는 우유를 넣어 갈아 준비한다.','머스터드에 올리고당을 넣어 잘 섞어 준다.','또띠아를 팬에 기름 없이 굽고, 그 안에 닭고기 살과 느타리버섯, 오이, 사과, 파프리카와 호박을 넣어 속이 보이도록 말아놓고, 4번과 5번은 섞어서 소스를 만들어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (84,'닭고기스테이크',4,4,'84.png','닭고기살(120g), 소금(0.5g), 후춧가루(0.1g), 생강(5g) 정종(5g), 우유(50g), 오이(20g), 토마토(20g) 두부(80g), 흑임자(20g), 우유(50g)','닭고기살은 소금과 후춧가루, 생강즙과 정종을 뿌린 후 우유를 살짝 발라 숙성을 시킨다.','오이는 길게 껍질째 썰어 놓는다.','토마토는 반으로 잘라 편으로 썰어 준비한다.','두부는 소창으로 물기를 꼭 짜 놓는다.','물기를 제거 시킨 두부에 흑임자를 넣고 골고루 섞은 뒤 냄비에 넣고 우유와 함께 은근히 끓여 속을 만든다.','팬에 토마토를 먼저 구워 접시에 담고, 숙성된 닭고기를 구워 올린 뒤, 그 위에 오이로 원형기둥을 만들고 구운 닭고기를 다시 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (85,'오징어순대',1,4,'85.png','통오징어(100g), 양파(20g), 당근(20g), 부추(20g) 견과류(20g), 두부(50g), 대파(10g), 마늘(10g), 소금(0.5g) 녹말가루(10g), 정종(10g), 레몬(10g), 생강(5g)','통오징어는 다리를 떼어내고 내장을 제거시켜 통째로 깨끗이 씻어 준비 한다.','양파와 당근, 부추, 생강은 입자있게 썰고, 견과류는 다져 준비한다.','두부는 물기를 짠 후 수저로 으깨어 놓는다.','잘게 썰은 오징어 다리와 썰어 놓은 채소, 견과류(2번), 곱게 다진 대파와 마늘, 그리고 소금과 녹말가루를 두부 3번과 함께 골고루 섞어 순대속을 만든다.','손질된 오징어 속 안에 준비한 속을 채워 넣는다.','오징어순대에 레몬즙과 정종, 생강즙을 섞어 바른 뒤 찜통에 김이 오르면 오징어순대를 넣어 약 10분 정도 쪄서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (86,'연어차우더스프',3,4,'86.png','모시조개(50g), 연어(100g), 청피망(20g), 당근(20g) 양파(20g), 감자(50g), 밀가루(10g), 버터(5g), 육수(200g) 월계수잎(1장), 통후추(3알), 생크림(30g), 통마늘(10g','모시조개는 물에 소금을 넣고, 담그어 해감을 한다.','연어는 사각지게 썰어 준비한다.','당근, 양파, 감자는 사각크기로 썰어 놓고, 청피망은 채를 썰어 당근과 비슷한 길이로 잘라둔다.','냄비에 버터와 밀가루를 넣고 볶다가 채소를 넣어 같이 볶는다.','볶아지는 냄비에 모시조개와 육수를 넣고 끓인다.','거품을 걷어내고, 월계수 잎과 통후추, 통마늘을 넣고 끓이다가 연어와 생크림을 넣어 한 소큼 끓으면 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (87,'시금치브로컬리 파스타',2,4,'87.png','새우(대하, 3마리), 스파게티(100g), 시금치(30g), 브로콜리(50g), 바질(10g), 생크림(50g), 올리브오일(10g), 소금 (0.2g)','시금치와 브로콜리는 끓는 물에 소금을 넣고 살짝 데친다.','데친 시금치, 브로콜리와 바질을 믹서에 갈아 준다.','새우는 껍질을 벗겨 손질한다','끓는 물에 스파게티를 10분 정도 삶아 건진다.','삶아진 스파게티는 팬에 올리브오일을 넣고 볶는다.','갈아 놓은 시금치소스에 생크림을 넣고 한소끔 끓이면서 볶은 파스타를 넣은 뒤 새우를 올린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (88,'연근부각',5,1,'88.png','연근(60g), 식초(10g), 천일염(0.1g), 계피가루(20g), 식용유(200g)','연근은 껍질을 벗긴다.','껍질벗긴 연근은 얇게 썬다.','물 200g에 식초 10g을 섞는다','식촛물에 썬 연근을 담근다.','연근을 체에 건져 물기를 뺀다.','연근을 바삭하게 튀긴 뒤 천일염을 살짝 뿌리고, 계피가루를 묻힌다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (89,'컬리플라워소스',9,5,'89.png','콜리플라워(50g), 감자(30g), 양파(20g),우유(200g), 소금(0.2g), 후춧가루(0.01g)','콜리플라워는 팬에 볶는다.','감자와 양파를 썰어 콜리플라워와 함께 볶는다.','3번에 우유를 넣는다.','4번을 믹서로 곱게 간 뒤, 끓인다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (90,'콜라비오미자 물김치',1,6,'90.png','콜라비(1/2개), 오미자(20g), 무화과(20g), 파프리카(50g), 피망(30g), 쪽파(10g), 양파(30g), 건새우(10g), 다시마(10g), 소금(0.3g)','다시마와 건새우를 넣고 은근히 끓여 차갑게 식힌 뒤 육수를 만든다.','차갑게 식힌 육수는 체에 걸려내고 오미자를 넣고 소금으로 간을 한다.','콜라비, 피망, 파프리카는 납작하게 썬다.','육수는 체에 거른다','오미자를 넣고 소금으로 간을 한다.','통에 썰어놓은 야채와 무화과를 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (91,'표고버섯 감자찜',4,1,'91.png','표고버섯(3개), 감자(200g), 고수(10g), 당근(30g), 양파(30g), 홍고추(1개), 녹말(20g)','표고버섯은 따뜻한 물에 불린다.','감자는 강판에 간다.','고수는 잘게 다진다.','당근은 곱게 다지고, 양파와 홍고추도 다진다.','감자에 다진 당근과 양파, 홍고추를 섞는다.','불린 표고버섯은 기둥을 자르고 바닥에 녹말가루를 묻혀 5번을 넣고 김이 오른 찜통에 약 10분 정도 찐다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (92,'찬밥이용닭죽',1,1,'92.jpg','찬밥 60g, 닭다리살 80g, 감자 30g, 통마늘 15g, 양파 10g, 당근 8g, 부추 5g, 물 700g, 소금 0.75g, 후춧가루 0.3g','닭다리는 기름기를 제거하고 냄비에 물 3컵 반을 부어 통마늘과 삶아 육수를 만든다.','삶은 마늘을 체에 걸러 으깬 뒤 다시 육수에 넣는다.','닭 육수 2컵 반에 찬밥을 넣고 밥알이 무르도록 끓인다.','삶은 닭다리 살을 발라 잘게 찢어 넣는다.','감자, 양파, 당근, 부추는 잘게 다진다.','4에 5를 넣고 끓인 뒤 소금, 후춧가루로 간 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (93,'감자느타리버섯국',3,1,'93.jpg','감자 30g, 느타리버섯 15g, 두부 8g, 파 5g, 물 300g, 국멸치 5g, 홍고추 3g, 건다시마 3g, 다진 마늘 3g, 소금 0.5g','물 1컵 반에 국멸치와 건다시마를 넣어 멸치다시마국물을 만든다.','국물을 우린 다시마는 채썬다.','느타리버섯은 끓는 물에 데친 후 찢는다.','감자와 두부는 3~4cm 가량으로 채를 썰고 홍고추와 대파는 어슷썬다.','멸치다시마국물 1컵에 감자를 넣고 끓인 뒤 느타리버섯을 넣어 한소끔 끓이고 두부, 파, 다진 마늘, 홍고추를 넣고 소금으로 간 한다.','채 썬 다시마를 고명으로 얹는다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (94,'강된장부추비빔밥',1,1,'94.jpg','꽁보리밥 210g(보리쌀 90g), 부추10g, 콩나물 30g, 김 0.5g, 햇된장 12g, 고춧가루 1.7g, 다진 파 9g, 참기름 1.75g, 다진 돼지고기 우둔 25g, 건표고버섯 8g, 물 150g, 양파 25g, 청양고추 10g, 홍고추 10g, 애호박 25g, 감자 50g, 참기름 1.75g','된장에 고춧가루, 다진 파, 참기름을 넣어 양념된장을 만든다.','표고버섯을 물에 담가 불리고 버섯 불린 물은 따로 받아둔다.','불린 표고버섯, 양파, 고추, 애호박을 다지고 감자는 강판에 간다.','냄비에 참기름을 두르고 고기와 양념된장을 볶다가 다진 채소와 표고버섯 불린 물 3/4컵을 넣고 한소끔 끓인 뒤 간감자를 넣고 한번 더 끓인다.','된장이 끓는 동안 부추를 3cm 길이로 썰고 콩나물은 아삭하게 찐다.','보리밥에 부추, 콩나물, 김을 얹어 강된장과 함께 낸다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (95,'민어매운탕',3,1,'95.jpg','민어 50g, 쇠고기 양지15g, 다진 마늘 1.25g, 후추 0.25g, 참기름 0.5g, 무 40g, 애호박 20g, 애느타리버섯 20g, 풋 고추 5g, 홍고추 2.5g, 쑥갓 10g, 대파 5g, 생강즙 0.5g, 물 300g, 소금 0.5g, 간 홍고추 10g, 간 양파 10g, 다진 마늘 2g, 국간장 2.5g, 간장 2.5g, 맛술 5g, 굵은 고춧가루 5g, 고운 고춧가루 1.25g','양념장 재료를 모두 섞어 냉장고에서 하루 숙성시킨다.','민어는 비늘을 긁고 지느러미, 내장을 제거하여 흐르는 물에 씻어 5cm 길이로 토막 낸다.','소고기는 채 썰어 다진 마늘, 후추로 밑간한다.','무는 나박 썰기, 애호박은 반달 썰기, 애느타리는 한입 크기로 찢고 고추와 대파는 어슷 썬다.','냄비에 참기름을 두르고 소고기를 볶다가 물 1컵 반과 무를 넣고 양념장을 풀어 끓인다.','무가 반 정도 익으면 민어와 채소를 넣고 한소끔 끓인 뒤 어슷 썬 대파와 생강즙을 넣어 살짝 끓이고 소금 간하고 쑥갓을 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (96,'양념된장',8,1,'96.jpg','햇된장 12g, 고춧가루 1.7g, 다진 파 9g, 참기름 1.75g','된장에 고춧가루, 다진 파, 참기름을 넣어 양념된장을 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (97,'양배추롤',4,5,'97.png','현미(50g), 멥쌀(50g), 다시마(2g), 새우가루(15g), 양배추(50g) 얇게 썬 쇠고기(부채살, 80g), 송송 썬 붉은 고추(5g) 달래무침 달래(10g), 간장(10g), 참기름(5g)','현미와 쌀을 씻어 30분간 불린 뒤 물기를 빼고, 다시마를 우려낸 물(불린 쌀 동량)로 밥을 지어 식힌 후 새우가루를 넣어 섞는다.','양배추는 15~20분 정도 쪄서 준비한다.','얇게 저민 쇠고기를 팬에 올려 익힌다.','달래는 0.5㎝ 정도로 송송 썰어 간장, 참기름에 버무린다.','김발에 양배추, 고기, 밥 순서대로 올려 돌돌 말아 양배추롤을 만든다.','롤을 한입 크기로 썰어 담고 달래 무침을 얹은 뒤 송송 썬 붉은 고추를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (98,'콩고기샐러드',6,5,'98.png','콩고기(30g), 아보카도(10g), 바나나(10g), 가지(10g) 연근(10g), 방울토마토(10g), 만두피(20g), 저염간장(2.5g), 물(25g), 설탕(3g), 저염소금(1g), 식초(5g), 로즈마리(1g), 통후추(1g) 올리브유(15g), 꿀(5g)','콩고기를 15분~20분 정도 물에 불려 물기를 완전히 제거한 뒤 저염간장양념으로 버무려 볶는다.','아보카도, 바나나, 가지, 연근은 깍둑 썰고, 방울토마토는 반을 가른다.','팬에 식용유(5g)를 둘러가며 방울토마토, 가지, 연근을 각각 볶아 건진다.','만두피를 작은 체에 넣고 바구니 모양으로 만들어 튀긴다.','콩고기와 아보카도, 바나나, 방울토마토, 가지, 연근을 튀긴 만두피에 담은 뒤 허브오일드레싱을 곁들여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (99,'바나나크림파스타',2,4,'99.png','바나나(150g), 아보카도(110g), 토마토(100g), 저염베이컨(46g, 3장) 바질가루(1g), 마늘(10g), 양파(20g), 휘핑크림(80g), 저염치즈(40g) 우유(200g), 소금(2g), 스파게티면(60g)','바나나를 반으로 잘라 반은 편 썰고 반은 으깨고, 아보카도는 껍질과 씨를 제거 한 후 1/3은 편 썰고 2/3는 으깬다.','토마토는 끓는 물에 데쳐 껍질을 제거하고 얇게 썬다.','베이컨 2장은 채 썰고, 1장은 구운 뒤 비슷한 크기로 채 썬다.','베이컨을 구운 기름에 편 썬 바나나, 아보카도, 토마토를 넣고 바질가루를 뿌려 굽는다.','팬에 채 썬 베이컨과 다진 마늘, 다진 양파를 볶은 후 휘핑크림, 저염치즈를 넣고 볶다가 으깬 아보카도, 바나나, 우유를 넣어 농도를 맞추고 소금으로 간해 바나나크림을 만든다.','접시에 구운 바나나, 아보카도, 토마토를 깔고 삶은 스파게티면을 담은 후 바나나크림을 뿌리고 베이컨을 올려 장식해 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (100,'닭갈비볶음면',2,5,'100.png','마늘(20g), 깻잎(2g), 쪽파(1g), 파프리카(60g), 양파(40g), 대파(10g) 방울토마토(50g), 닭가슴살(30g), 이태리시즈닝(1g), 라면(110g), 카레가루(2g), 고춧가루(1g), 고추장(10g), 참기름(2g)','마늘 5g은 다지고, 나머지 마늘(15g)은 편 썰어 노릇하게 튀긴다.','깻잎은 채 썰고, 쪽파는 송송 썰고, 파프리카는 주사위 모양으로 썰고, 양파와 대파는 채 썰고, 방울토마토는 반을 갈라 준비한다.','닭가슴살은 어슷하게 납작 썰어 이태리시즈닝에 재운 뒤 팬에 구워 준비한다.','다진 마늘, 양파, 대파를 팬에 넣고 향을 내다 파프리카와 방울토마토, 양념을 넣고 볶은 뒤 한 김 식혀 믹서에 곱게 갈아 소스를 만든다.',' 팬에 소스와 구운 닭가슴살을 넣어 볶다가 삶은 라면을 넣고 재빠르게 볶는다.','튀긴 마늘과 깻잎, 쪽파를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (151,'로제소스라면',2,5,'151.png','새우(10g), 조개(20g), 홍합(20g), 새송이버섯(15g), 양파(8g) 토마토(100g), 라면(50g), 우유(200g), 생크림(100g), 월계수잎(5g) 정향(5g), 파르메산 치즈가루(5g), 파슬리가루(8g)','새우, 조개, 홍합은 손질한다.','버섯은 먹기 좋은 크기로 썰고, 양파는 채 썰고, 토마토는 씨를 제거해 다진다.','라면은 끓는 물에 데친 뒤 체에 밭쳐 물기를 제거한다.','냄비에 식용유(10g)를 두른 뒤 새우와 조개, 홍합을 넣어 살짝 볶아 건진다.','같은 냄비에 토마토, 우유, 생크림을 넣은 뒤 월계수잎과 정향을 넣고 끓인다.','끓으면 데친 라면, 새송이버섯, 홍합, 새우, 조개, 양파를 넣고 끓여 다 익으면 파르메산 치즈가루를 뿌린 후 그 위에 파슬리가루를 뿌려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (152,'삼겹살라면',2,5,'152.png','라면(100g), 쪽파(3g), 돼지고기(삼겹살, 60g), 대파(20g), 얇게 썬 생강(5g), 가다랑어포(3g), 저염간장(3g), 맛술(8g), 흑설탕(3g)','돼지고기를 차가운 물로 헹구고 냄비에 물(300g), 대파, 생강과 같이 넣고 끓여 돼지고기가 익으면 면포에 거른다.','냄비에 물(300g)을 넣어 끓으면 가다랑어포를 넣고 1분간 끓이고 불을 꺼 가다랑어포가 가라앉으면 면포에 거르고, 다시 물(300g)을 넣어 면포에 걸러낸 가다랑어포를 넣어 약한 불로 10분간 끓인 뒤 가다랑어포가 가라앉으면 면포에 거른다.','돼지고기 육수와 가다랑어포 육수를 섞은 뒤 200g을 따로 덜어 조림양념을 넣고 끓이다가 돼지고기를 넣고 조린다.','라면은 삶아 찬물에 헹궈 건지고, 쪽파는 송송 썬다.','육수를 뜨겁게 끓인 뒤 그릇에 라면사리와 함께 담고, 돼지고기조림, 쪽파를 올리고 팬에 남은 조림 소스를 끼얹어 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (153,'유자샐러드라면',2,5,'153.png','라면(55g), 양상추(40g), 케일(5g), 파프리카(20g), 비타민(5g), 식초(2g), 레몬즙(5g), 유자청(15g), 올리브유(1g)','끓는 물(600g)에 라면을 넣어 데친다.','면은 찬물에 헹궈 물기를 뺀다.','양상추, 케일, 파프리카는 얇게 채 썰고, 비타민은 먹기 좋은 크기로 자른다.','유자드레싱을 고루 섞은 뒤 라면, 채소를 버무려 마무리한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (154,'매실동치미',6,1,'154.png','무 50g, 연근 25g, 사과 25g, 배 30g, 함초소금 2g, 매실청 30g, 생강청 15g, 함초소금 1g, 청양고추 10g','무는 모양 틀로 자른다.','무와 연근을 손질해 놓은 후 소금에 살짝 절여준다.','사과와 배는 먹기 좋게 잘라 레몬즙에 뿌려 갈변을 막아준다.','물에 청양고추를 넣어 끓여서 식힌다.','식힌 물에 국물 재료를 넣어 국물을 만든다.','만들어진 국물에 절여진 무, 연근, 사과, 배를 넣어주어 완성한다. 24시간 이후부터 시원하게 먹는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (155,'조기까스',5,5,'155.png','조기 1마리(250g), 허브크러스트 100g, 흰 후추 1g, 화이트와인 15g, 마늘오일 15g, 전분 15g 소스 : 고추장 15g, 저염간장 15g, 화이트와인 15g, 버터 5g 다진양파 15g, 흰후추 1g, 마늘오일 15g','다진마늘을 버터에 충분히 볶아준다.','화이트와인을 뿌려주고 소스재료로 소스를 만들어준다.','찜기에 살짝 져 준다. 이때 80% 정도까지만 익혀준다.','쪄준 조기는 와인과 후추로 밑간을 해준 후 전분을 발라준다.','전분를 바른 조기에 허브크러스트를 두툼하게 올려준다.','팬에 기름을 두르고 조기를 한쪽부터 구운 뒤, 뒤집어서 다시 구워주고 소스를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (156,'돼지머리수육맑은전골',3,1,'156.png','돼지머리 200g, 우동면 100g, 미나리 20g, 청고추 15g, 일본 된장 30g, 다진마늘 10g, 다진대파 10g, 청주 15g, 무 25g, 해물육수 300g, 청양고추 20g, 맛간장 15g','무, 청고추, 미나리, 대파는 먹기 좋게 썰어준다.','돼지머리는 냉수에 데친다. 냉수일 때부터 돼지머리를 넣어야 물이 끓어오르면 불순물이 제거된다.','일본 된장을 풀어 체에 걸러준다.','돼지머리를 살짝 졸여준다.','냄비에 국물을 끓여주다가 채소를 넣어 끓인다.','국물에 우동면을 데쳐낸 뒤 완성한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (157,'파인애플볶음밥',1,2,'157.png','밥 150g, 칵테일새우 50g, 파인애플 통조림 100g, 양파 60g, 청고추 15g 노란파프리카 20g, 빨간파프리카 20g, 마늘 15g, 계란 60g, 마늘기름 30g 흰후추 1g, 레몬소금 1g, 맛간장 15g, 통깨 10g','양파, 2가지색 파프리카, 청고추는 작은 깍두기 모양으로 잘라준다.','파인애플도 먹기 좋게 썰어준 뒤 레몬소금을 살짝 뿌려준다.','계란은 풀어서 팬에 스크램블을 만들어준다.','마늘을 다진 후 마늘기름으로 칵테일 새우를 볶아준다.','볶아진 칵테일새우에 잘라준 채소를 넣어 다시 볶아준다.','여기에 밥을 넣어서 볶아주고 파인애플과 맛간장, 통깨를 넣어서 볶아준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (158,'코다리맑은찜',4,1,'158.png','코다리 250g, 콩나물 50g, 미나리 20g, 함초 25g, 무 30g, 함초소금 1g, 간편어간장 15g, 함초소금 1g, 생강청 15g, 흰후추 1g, 청주 15g 레몬즙 5g, 다진마늘 15g, 연겨자 7g, 통깨 10g','코다리는 어간장, 청주, 흰후추, 생강청에 살짝 재워준다.','함초는 손질해 잘라준다.','무는 소금에 살짝 절여서 수분과 염분을 제거해준다.','무와 함초를 고루 섞어준다.','미나리와 콩나물은 손질해준 후 찜기에 깔고 코다리를 쪄준다.','소스를 만든 뒤 채소를 깔고 코다리를 올리고 미나리, 콩나물을 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (159,'해물들깨탕',3,1,'159.png','주꾸미 80g, 전복 100g, 칵테일새우 50g, 양파 560g 청고추 17g, 홍고추 17g, 계란 60g, 청주 15g, 들깨가루 100g, 저염간장 15g, 다진마늘 15g, 다진대파 7g','주꾸미, 전복, 칵테일새우는 각각 물에 데쳐서 준비한다','이때 데치고 남은 물을 국물에 이용해주고 여기에 청주를 넣어준다.','양파, 청고추, 홍고추는 먹기좋게 썰어준다.','계란을 황백으로 부쳐서 먹기좋게 썰어준다.','만들어진 국물에 거피한 들깨가루와 국물재료를 넣어 끓여서 준비한다.','준비된 재료를 냄비에 넣고 국물을 부어 끓여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (160,'토마토젤리',7,6,'160.png','토마토(120g), 판젤라틴(10g), 레몬(10g), 올리고당(20g) 블루베리(20g), 설탕(20g)','판젤라틴을 얼음물에 담군 후 흐물흐물 해질 때까지 불려 둔다.','토마토는 물을 넣고 갈아 준비한다.','갈아 놓은 토마토에 올리고당과 레몬즙을 넣어 골고루 섞는다.','레몬즙을 넣은 토마토를 은근히 끓인다.','끓고 있는 토마토에 불린 젤라틴을 넣고 녹여주고, 젤라틴이 녹으면 불을 끄고, 접시에 담아 냉장고에 약 20분 정도 굳힌다.','팬에 설탕을 넣고 설탕이 녹으면, 블루베리를 넣어 은근히 졸여진 후 굳어진 토마토젤리 위에 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (161,'채소어묵',5,3,'161.png','생선살(100g), 맛술(10g), 생강(10g), 소금(0.2g) 밀가루(20g), 양파(20g),당근(20g), 샐러리(10g), 마늘(10g) 옥수수(20g), 어린이치즈(20g), 튀김기름(400g)','생선살은 가시를 발라내고 곱게 으깨어 놓는다.','으깬 생선살에 맛술 과 생강즙, 소금을 넣어 골고루 치댄다.','잘 치댄 생선살에 밀가루를 넣어 다시 치대어 준다.','양파와 당근, 샐러리, 마늘은 곱게 다지고, 옥수수는 알맹이를 준비한다.','생선살에 다진 채소와 어린이 치즈를 다져 섞는다.','채소를 다져 섞은 생선살을 동글동글 하게 완자를 빚어 튀김기름에 약 150℃ 온도에서 은근히 5분 정도 튀겨 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (162,'오렌지삼겹찜',4,5,'162.png','삼겹살(100g), 로즈마리(5g) 고구마(30g), 생크림(10g), 감자(20g), 튀김기름(200g) 브로컬리(30g), 올리브오일(10g), 오렌지(50g), 설탕(10g), 정종(10g), 저염소금(5g) 와사비(5g)','삼겹살은 로즈마리를 뿌려 숙성시킨다.','고구마는 삶아 준비하고, 감자는 웨지 감자형으로 썰어 익힌 후 기름에 튀겨 놓는다.','삶아진 고구마를 으깨어 생크림을 넣어 골고루 섞는다.','오렌지는 즙을 짜 놓는다.','숙성된 삼겹살은 오븐에 굽고, 브로컬리는 살짝 데쳐 올리브오일에 볶아놓는다.','팬에 오렌지즙과 설탕, 정종, 소금을 넣고 바글바글 졸인 후 와사비를 넣어 소스를 만들고, 오븐에 구어진 삼겹살을 잘라 접시에 담고 그 위에 소스를 살짝 올리고, 한쪽에는 감자튀김(2번), 고구마무스(3번), 브로컬리(5번)를 곁들여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (163,'오렌지소스',8,1,'162.png','오렌지(50g), 설탕(10g), 정종(10g), 저염소금(5g) 와사비(5g)','팬에 오렌지즙과 설탕, 정종, 소금을 넣고 바글바글 졸인 후 와사비를 넣어 소스를 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (164,'삼색딤섬',4,2,'164.png','밀가루(200g), 백년초가루(20g), 뽕잎가루(20g) 치자가루(10g), 미나리(20g), 두부(30g), 오징어(30g) 다진 소고기(60g), 양파(20g), 부추(30g), 숙주(30g) 대파(10g), 마늘(10g), 참기름(10g), 후춧가루(0.05g) 통깨(5g)',' 밀가루를 세등분하여 각각 백년초, 뽕잎, 치자 가루를 넣고 물을 넣고 반죽을 한 뒤 비닐봉투에 넣어 숙성을 시킨다.','두부는 소창에 물기를 짜고, 양파, 파, 마늘은 다지고, 부추는 송송 썰어 준비 하고, 숙주는 뜨거운 물에 데쳐 곱게 다진다.','오징어는 껍질을 벗겨 입자있게 다져 놓는다.','다진고기에 준비한 두부와 양파, 파, 마늘, 부추, 숙주(2)와 오징어(3)를 넣어 섞은 후 참기름과 후춧가루, 통깨를 넣어 딤섬 속을 만든다.','숙성된 밀가루 반죽을 꺼내 밀대를 이용하여 넓게 밀어 준다.','밀어 놓은 반죽을 사각으로 자른 후 그 안에 딤섬 속을 넣어 미나리를 데쳐 끈을 만들어 딤섬 위쪽을 묶은 후 찜통에서 김이 오르면 약 10분 정도 쪄서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (165,'밥크로켓',5,3,'165.png','양파(20g), 대파(10g), 당근(20g), 마늘(10g) 식용유(10g), 메추리알(100g), 밥(100g), 소금(0.5g) 밀가루(20g), 녹말가루(10g), 달걀(50g), 빵가루(20g) 튀김기름(400g), 칠리소스(50g)','양파와 대파, 당근, 마늘은 입자있게 다져 준비한다.','팬에 기름을 두르고, 팬이 따끈해 지면 준비한 채소(①)를 넣어 재빠르게 볶아 식힌다.','메추리알은 찬물에 넣어 소금을 넣고 약 5분 정도 삶아 건져 찬물에 헹구어 껍질을 제거시켜 놓는다.','준비한 밥에 볶아 놓은 채소와 소금을 넣어 골고루 섞은 후 준비한 메추리알을 감싸 준다.','밥으로 감싼 메추리알을 밀가루와 녹말을 섞어 그 위에 굴리고, 다시 달걀물에 굴린 후 빵가루를 입혀준다.','튀김 기름이 약 170℃ 정도 되면, 만들어 놓은 메추리알을 넣어 골고루 색이 나도록 튀겨 완성하고, 칠리소소와 함께 제공한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (166,'가지토마토구이',4,5,'166.png','가지(80g), 올리브오일(10g), 소금(0.5g), 토마토(40g) 모짜렐라치즈(30g), 토마토소스(20g), 토마토(40g), 팽이버섯(20g), 후춧가루(0.02g)','가지는 약 10cm 길이로 길고, 납작하게 썰어 준비한다.','팬에 올리브 오일을 살짝 둘러 썰어놓은 가지를 소금을 넣고 살짝 익힌다.','토마토는 반은 토마토 형태로 납작하게 썰어 놓는다.','토마토반은 입자있게 다져 준비한다.','다진 토마토를 준비한 토마토소스에 섞어 살짝 어우러지게 끓여 준비한다.','구운 가지위에 토마토와 모짜렐라치즈를 올려 팬에 굽고, 별도로 팽이버섯에 후춧가루를 뿌려 살짝 구워 접시에 담고, 끓여 놓은 토마토소스를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (167,'함박스테이크',4,4,'167.png','다진소고기(120g), 다진돼지고기(120g), 양파(20g) 마늘(10g), 소금(0.3g), 후춧가루(0.02g), 달걀(20g) 녹말가루(5g), 빵가루(10g), 깻잎(5g), 올리브오일(10g) 메추리알(50g), 마른고추(5g), 대파, 마늘, 와인(20g), 저염간장(20g) 올리고당(20g), 설탕(10g) 토마토(20g)','마늘과 양파는 입자있게 다져 볶아서 준비한다.','다진 소고기와 돼지고기에 볶아놓은 마늘과 양파를 넣고, 소금과 후춧가루, 달걀물, 빵가루, 녹말가루를 넣어 골고루 치대어 숙성시킨다.','깻잎은 곱게 채를 썰어 찬물에 담그어 놓아, 싱싱해 지면 건져 숙성된 고기에 넣는다.','깻잎을 넣은 고기를 지름 4cm 크기의 함박스테이크 형태를 만들어 팬에 올리브오일을 넣고 익힌다.','냄비에 마른고추와 대파, 마늘, 와인, 간장, 올리고당, 설탕을 넣어 끓이다가, 남은 토마토를 곱게 다져넣고, 은근히 졸인 뒤, 채에 걸러 놓는다.','토마토는 원형을 살려 슬라이스하여 접시에 깔아준 뒤 익힌 함박스테이를 얹고 메추리알은 한 개씩 반숙 지단을 부쳐 익힌 함박스테이크 위에 올린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (168,'냉파스타',2,4,'168.png','스파게티(100g), 올리브오일(10g), 소고기(50g) 저염간장(10g), 설탕(10g), 마늘(10g), 깻잎(10g) 양파(20g), 파프리카(20g), 육수(400g), 설탕(10g) 식초(10g), 저염간장(10g)','스파게티는 약 10분 정도 삶아 건져 찬물에 헹궈 물기를 빼고 올리브오일을 발라 준비한다.','소고기는 넓게 편으로 펴서 간장, 설탕, 마늘을 넣어 양념을 한다.','양념된 소고기를 팬에 구워 냅킨위에 올려 기름을 빼놓는다.','깻잎과 양파, 파프리카는 길게 채를 썰어 준비한다.','팬에 기름을 넣고 팬이 뜨거울 때 양파를 넣어 재빠르게 볶아낸다.','준비한 육수에 설탕과 식초, 저염간장을 넣어 차갑게 냉장보관하고, 그릇에 스파게티를 담고, 그 위에 볶은 양파와 깻잎, 파프리카와 구운 고기를 올린 후 차가운 육수를 부어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (169,'과일겉절이',7,6,'169.png','사과(50g), 배(30g), 설탕(10g), 바나나(50g), 키위(30g) 파인애플(30g), 마(50g), 마늘(10g), 식용유(5g), 고춧가루(20g), 식초(10g) 저염간장(5g), 설탕(10g)','사과와 배는 껍질을 베이킹파우더에 깨끗이 씻어 납작하게 썰어 설탕물에 담그어 색이 변하지 않게 준비한다.','바나나는 동글하게 썰고, 키위는 껍질을 제거하고 은행잎 모양으로 썰고, 파인애플은 가운데 심을 제거하고 사각형 모양으로 썰어놓는다.','마는 껍질을 벗겨 동글하게 썰어 준비 한다.','마늘은 입자있게 다져, 팬에 식용유를 두르고 살짝 볶는다.','고춧가루에 볶은 마늘(4), 식초. 설탕, 간장, 고춧가루를 넣고, 골고루 섞어 양념장을 만든다.','설탕물에 사과와 배를 건지고, 준비한 과일과 마를 담은 후 먹기 직전에 만들어 놓은 양념장을 넣어 버무려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (170,'인삼갈비탕',3,1,'170.png','소고기(갈비, 300g), 인삼(2뿌리), 당면(50g), 표고버섯(1개), 달걀(1개), 대추(3알), 양파(50g), 파(30g), 마늘(30g), 설탕(10g), 저염간장(20g)','갈비는 찬물에 담궈 핏물을 뺀다.','끓은 물에 갈비를 데친다.','찬물에 표고버섯, 파, 마늘, 양파 및 인삼을 넣고 데친 갈비를 넣고 약 2시간 정도 끓여 갈비탕을 만든다.','저염간장에 설탕을 섞어 고기소스를 만든다.','당면은 뜨거운 물에 불려 갈비탕을 먹기 직전에 넣는다.','달걀은 황백으로 나눠 지단을 부쳐 완성된 갈비탕 위에 대추와 함께 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (171,'체리젤리를 곁들인 고구마무스',8,5,'171.png','체리(50g), 고구마(150g), 화이트 초콜릿(50g), 판젤라틴(1장), 피스타치오(20g), 헤이즐넛(20g), 캐슈넛(20g), 호두(20g), 아몬드(20g), 라즈베리(20g), 건포도(20g), 애플민트(2g)','고구마는 깨끗이 씻어 찜통에 쪄낸다','뜨거운 고구마는 식기 전에 으깬다.','화이트 초콜릿은 중탕으로 녹여 으깬 고구마와 섞는다','체리는 믹서에 곱게 간다.','젤라틴은 물에 불려 중탕으로 녹이고 갈아 놓은 체리에 섞어 굳힌다','견과류와 라즈베리, 건포도는 다져서 굳힌 체리젤리에 뿌리고 고구마 무스를 젤리 주위에 두르고 애플민트를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (172,'세 가지곡물콩라미수',9,5,'172.png','미숫가루(50g), 통조림콩(20g), 검은콩(20g), 바나나(1개), 흑임자(5g), 달걀(1개), 우유(200g), 애플민트(10g), 버터(20g), 설탕(10g)','미숫가루는 설탕을 넣고 체에 한 번 거른다.','달걀노른자에 설탕을 넣고 중탕으로 익힌다.','버터는 중탕으로 녹이고 검은콩은 불린 뒤 삶아 통조림콩, 버터와 함께 간다.','바나나는 곱게 으깨고 흑임자는 곱게 간다.','우유는 냄비에 넣고 따끈하게 데운다.','데워진 우유에 미숫가루와 모든 재료를 골고루 섞는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (173,'크림치즈 망고무스',8,5,'173.png','망고퓨레(50g), 라즈베리(10g), 피스타치오(30g), 크림치즈(50g), 요거트(50g), 생크림(50g), 판젤라틴(1장), 레몬(1/4개), 애플민트(10g), 설탕(20g)','냄비에 망고퓨레, 레몬, 설탕을 넣고 은근히 끓인다.','젤라틴은 찬물에 불린 뒤 중탕으로 녹여 망고퓨레에 넣고 틀에 굳힌다.','생크림은 차갑게 휘핑하여 요거트와 섞는다.','생크림을 섞은 요거트에 설탕, 크림치즈를 섞는다','냄비에 라즈베리, 설탕을 넣고 은근히 끓인다.','접시에 굳힌 망고무스에 담고 그 위에 라즈베리 소스와 크림치즈 소스, 다진 파스타치오를 올리고 애플민트로 장식한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (174,'토마토주스를곁들인컵토마토',7,6,'174.png','줄기토마토(3개), 토마토(100g), 오이(50g), 양파(30g), 올리브오일(10g), 설탕(30g)','토마토는 끓는 물에 살짝 데친다.','데친 토마토를 믹서에 곱게 갈고 설탕을 넣고 섞는다.','줄기토마토는 윗부분을 잘라내고 속을 파낸다.','오이와 양파는 입자있게 썬다.','팬에 올리브오일을 두르고 썰어 놓은 오이와 양파를 살짝 볶는다.','속을 파낸 줄기토마토에 볶아 놓은 야채와 5번을 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (175,'인절미 무스와 수정과 아이스크림',7,5,'175.png','홍시(1개), 콩가루(20g), 계피(10g), 생강(20g), 호두(10g), 곶감(2개), 자몽(1/6개), 판젤라틴(1장)','곶감은 씨를 발라낸다.','생강과 계피를 넣고 끓여 수정과를 만든 뒤 냉동한다.','홍시는 믹서로 곱게 갈고 틀어 넣어 굳힌다.','생크림은 차갑게 휘핑한다.','불려 놓은 젤라틴을 굳혀 콩가루를 섞어 인절미를 만든다','자몽을 껍질을 제거 후 갈아서 젤리를 만들고, 접시에 굳혀놓은 홍시와 아이스 수정과를 담는다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (176,'겨자아욱쌈밥',1,1,'176.png','현미(200g), 두부(100g), 아욱(100g), 날치알(50g), 단호박(1/6개), 새싹(20g), 된장(20g), 생크림(20g), 매실청(20g), 참기름(5g)','현미는 깨끗이 씻어 30분 이상 충분히 불린 뒤 밥을 짓는다','두부는 끓는 물에 데쳐 물기를 빼고 곱게 다져 된장, 생크림, 매실청을 넣고 골고루 섞는다.','데친 두부에 된장, 생크림 및 매실청을 골고루 섞는다.','아욱과 단호박은 각각 찐 후 식힌다.','찐 아욱 위에 현미밥을 올리고 두부소스, 날치알, 새싹 단호박을 올린다.','아욱에 올린 밥을 동그랗게 말아 접시에 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (177,'마늘드레싱',8,1,'177.png','사과식초 30g(2큰술), 설탕 15g(1큰술), 물 50ml(1/4컵), 다진 마늘 5g(1작은술)',' 그릇에 다진 마늘, 사과식초, 설탕, 물을 섞어 설탕이 녹을 때까지 저 어 드레싱을 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (178,'두부곤약조림',4,1,'178.png','곤약(100g), 두부(100g), 가지(20g), 애호박(20g), 꽈리고추(15g), 감자전분(6g), 저염간장(3g), 물(165g), 다진 마늘(2g) 유자청(10g), 고추기름(10g)','곤약과 두부는 사방 1㎝ 크기로 깍둑 썰고, 가지와 애호박은 조금 더 작은 크기로 썰고, 꽈리고추는 얇게 송송 썬다.','곤약을 끓는 물에 식초를 한두 방울 떨어뜨린 후 삶아 냄새를 제거한 후 찬물에 식힌다.','올리브유(10g)를 두른 팬에 두부를 올려 살짝 굽는다.','팬에 조림장을 넣은 후 약한 불에서 저어가며 끓이다가 조림장이 고루 섞이면 곤약과 두부, 가지, 애호박을 모두 넣고 조린다.','조림장이 반 이상 졸아들면 꽈리고추를 넣고 조금 더 조려 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (179,'양지해장국',3,1,'179.png','쇠고기육수(30g) 느타리버섯(10g), 애호박(20g), 청양고추(1g) 대파(10g), 방울토마토(80g), 콩나물(50g), 다진 마늘(8g), 저염국간장(2.5g), 소금(0.5g)','육수를 끓인 양지는 건져 얇게 썬다.','버섯은 잘게 찢고, 애호박은 반달모양으로 납작 썰고, 고추와 대파는 어슷하게 썬다.','방울토마토에 열십자로 칼집을 넣고 끓는 물에 데쳐 껍질을 벗긴다.','냄비에 식용유(10g)를 두른 뒤 다진 마늘을 넣고 볶아 향을 낸 뒤 방울토마토를 넣고 볶는다.','육수(300g), 콩나물, 쇠고기, 느타리버섯, 애호박을 넣고 국간장과 소금으로 간해 끓인다.','어슷 썬 청양고추와 대파를 넣어 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (180,'레몬들깨 소스를 품은 떡꼬치',7,6,'180.png','떡꼬치 쌀떡 90g, 호두 10g(1알), 잣 5g(5알), 식용유 30g(2큰술), 꼬치용 꼬치 6개, 들깨가루 45g(3큰술), 두유 45g(3큰술), 꿀 15g(1큰술), 물 15ml(1큰술), 참기름 7g(1과1/3작은술), 레몬즙 7g(1과1/3작은술), 검은깨 5g(1작은술)','들깨가루, 검은깨, 두유, 레몬즙, 꿀, 물, 참기름을 섞어 레몬들깨 소스를 만든다.','떡은 튀기다가 떡이 터지면서 기름이 튈 수 있으므로 팬에 기름을 두르듯이 넣고 160도 정도에서 노릇노릇하게 굽는다.','꼭지를 뗀 잣과 호두는 굵게 다진다.','떡은 꼬치에 꽂아 접시에 담고 레몬 들깨소스를 바르고 잣, 호두를 고명으로 뿌려준다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (181,'삼색매작과와 수정과겔',7,6,'181.png','밀가루 100g(1/2컵), 빨강 파프리카 40g(1/3개), 노랑 파프리카 40g(1/3개), 청 파프리카 40g(1/3개), 식용유 300g(1½컵), 홍초 75g(5큰술), 설탕 75g(5큰술), 대추 10개, 계피 20g(10cm), 생강 20g(3×2cm), 물 400ml(2컵), 황설탕 10g(2작은술), 알긴산 5g(1작은술), 염화칼슘 5g(1작은술)','홍초와 설탕을 중간 불에서 서서히 끓여 홍초 시럽을 만든다.','빨강 파프리카, 노랑 파프리카, 청파프리카를 각각 갈아 면보에 짜서 삼색 파프리카즙을 낸다.','밀가루를 체에 친 다음 4등분으로 나눈 후 밀가루, 3종류의 파프리카 즙을 이용해 총 4종류의 반죽을 만들고 밀봉하여 30분 정도 숙성 시켜 준비한다.','반죽은 밀대로 0.2cm 두께로 밀어 칼로 5×2cm 길이로 잘라 중심에 칼집을 세군데(川 내천자) 넣은 후 칼집 가운데 부분으로 한쪽 끝을 뒤집어 모양을 잡는다.','튀김팬에 식용유를 150도로 하여 바삭하게 튀긴다','튀긴 매작과를 홍초 시럽(1)에 버무려 준다.','생강은 껍질을 벗기고 물기를 제거한 후 얇게 저민다','냄비에 생강과 물 2컵을 넣고 약한불에서 30분 정도 정도 끓이다가 생강을 건진 후 준비한 계피, 대추를 넣고 30분 정도 더 끓인 후 고 운체에 거른다','수정과 물(8)에 황설탕, 알긴산을 넣고 잘 녹도록 다시 끓이면 걸쭉 해진다.','냄비에 물 500ml를 준비한 후 염화칼슘을 풀어 수용액을 만든다. 염화칼슘수용액에 수정과겔(9)을 스포이드나 숟가락으로 떨어 뜨려넣고 모양을 잡아주고 접시에 매작과와 수정과겔을 담고 홍초 시럽을 뿌린다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (182,'고구마 석류 과편',7,6,'182.png','고구마 200g(2개), 전분 30g(2큰술), 설탕 300g(1과1/2컵), 석류 200g(1/5개), 물 600ml(3컵)','구마는 깨끗이 씻어서 찜기에 고구마를 넣고 (작은 고구마 15~20분, 중간 고구마 30분, 큰고구마 40~45분정도) 찐다','다 익은 고구마는 껍질을 벗기고 고구마 둥근 모양을 살려 1.5cm로 자르고 고구마 속을 몰드나 숟가락으로 동그랗게 판다.','석류는 껍질을 벗겨 석류알만 준비한 후 물 3컵을 넣어 2컵 정도 나올 때까지 은근히 졸인다.','졸인 석류물에 설탕을 넣고 섞는다.','소스 팬에 석류물(4)을 끓이면서 전분을 조금씩 넣는다.','석류물이 끓어 거품이 생기면 숟가락으로 떠서 고구마 안에 넣고 굳힌다.','접시에 고구마 석류과편을 담고 석류를 곁들인다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (183,'고구마와 단호박 맛탕',7,1,'183.png','고구마 30g(1/5개), 단호박 30g(4ⅹ6cm), 옥수수유 200g(1컵), 설탕 15g(1큰술), 꿀 15g(1큰술), 물 5ml(1작은술), 검은깨 약간','고구마는 깨끗이 씻어서 한입 크기 정도로 잘라 타원형추 모양으로 다듬은 뒤 물에 헹궈 녹말을 빼주고 물기를 제거한다.','단호박은 씻어서 자르고 씨를 빼고 한입 크기 정도로 잘라 타원형 추 모양으로 다듬어 물기를 제거한다.','소스 팬에 설탕, 꿀, 물을 넣고 젓지 않은 상태로 약한 불에서 서서히 끓여 졸인다','시럽의 농도는 흐르는 정도, 색깔은 캐러멜색 정도로 만들고 검은깨를 넣는다.','튀김팬에 옥수수유를 붓고 고구마와 단호박을 180도 정도에서 노릇하게 튀긴다','단호박과 고구마 튀김은 뜨거울때 시럽에 버무린다','남은 시럽을 숟가락에 묻혀 들어올려 실이 생기게 한 다음 숟가락을 아래 위로 돌려가며 실을 감듯이 하여 볼을 만들어 곁들인다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (184,'키위 팬케이크',7,4,'184.png','핫케이크가루 200g(1컵), 우유 100ml(1/2컵), 달걀 50g(1개), 키위 60g(1개), 땅콩 10g(5알), 식용유 약간','우유에 달걀을 풀고 핫케이크가루를 넣어 저어준다','땅콩을 곱게 다져 반은 반죽에 섞고, 반은 곁들임으로 남긴다.','키위는 씻어서 껍질을 벗기고 0.7cm 정도로 둥글게 썬다','달군 프라이팬에 식용유를 두르고키친 타올로 살짝 닦아 낸다.','반죽을 약한 불에서 3분 정도 익히고 기포가 보글보글 생기면 뒤집어서 2분 정도 굽는다','팬케이크 위에 키위를 얹고 팬케이크로 덮어 접시에 담고 남은 땅콩가루를 뿌린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (185,'허니레몬 그린티 푸딩',7,4,'185.png','녹차티백 2개, 물 200ml(1컵), 꿀 50g(3⅓큰술), 레몬(1개), 설탕 30g(2큰술), 생강 8g(2×2cm), 한천 6g, 블루베리잼 15g(1큰술), 허브 약간','깨끗이 씻은 레몬은 반으로 잘라 레몬즙을 짠다.','생강은 껍질을 벗기고 씻어 강판에 갈은 후 즙을 짠다.','한천은 잠길 정도로 찬물에 불려놓는다','70도의 물에 녹차티백을 넣고 향을 우려낸다','불린 한천을 건져 녹차 우려낸 물에 넣어 잘 풀어주고 꿀과 설탕이 녹게 저은 후 레몬즙과 생강즙을 넣고 잘 섞는다','나중에 꺼내기 좋게 틀이나 볼에물을 뿌린 후 혼합물(5)을 붓고 한김 식으면 냉장고에서 1~2시간 정도 굳힌다.','틀에서 분리하여 접시에 담고, 푸딩위에 블루베리 잼과 허브로 장식한다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (186,'더덕생채를 곁들인 삼겹살 찜',4,1,'186.png','삼겹살 300g, 베이비채소 200g(1팩), 양파 70g(1/2개), 마늘 25g(5개), 사과 20g(1/10개), 버터 15g(1큰술), 청주 15g(1큰술), 식용유 10g(2작은술), 더덕 200g(3개), 소금 2g(1/2작은술), 배 50g(1/5개), 잣 15g(75개), 식초 2g(1/2작은술), 설탕 2g(1/2작은술), 대파 20g(1개)','더덕은 껍질을 벗겨 방망이로 두드려 찢고, 소금을 뿌려 쓴맛을 제거한다.','배, 잣, 식초, 설탕을 믹서에 갈아 소스를 만든 후, 일부를 더덕에 버무 린다.','남은 소스에 파를 넣어 믹서에 갈아 가열된 팬에 볶아 파 소스를 만든다','마늘, 양파, 사과는 다진다.','가열된 팬에 기름을 두른 후 삼겹살을 겉면만 익힌다.','삼겹살을 꺼낸 팬에 버터를 넣고 다진 마늘, 양파, 사과와 함께 볶는다.','6에 겉면을 익힌 삼겹살을 넣고, 청주와 물을 넣어 익힌다.','삼겹살을 썰고 베이비채소, 더덕생채를 곁들인 후 파 소스를 뿌려 완성한다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (187,'타르타르 소스를 곁들인 라이스버거',1,5,'187.png',' 현미밥 300g, 쇠고기(앞다리살) 150g, 양상추 100g(1개), 두부 150g(1/2개), 멸치가루 10g(2작은술), 달걀 30g(1/2개), 양송이버섯 30g(1개), 빵가루 50g(1/4컵), 식용유 20g(1큰술), 토마토 200g(1개), 양파 40g(1/4개), 단호박 150g(1/3개), 달걀 60g(1개), 양파 30g(1/5개), 레몬즙 10g(2작은술), 마요네즈 30g(2큰술)','달걀을 삶아 노른자는 체에 거른다. 흰자와 양파는 다져 마요네즈와 레몬 즙을 넣고 섞어 타르타르소스를 만든다.','현미밥에 멸치가루를 넣고 섞은 후 빵가루를 묻혀 동그랗게 모양을 잡아 기름에 굽는다.','양파는 링으로 썰고 나머지는 다져서 볶고, 두부는 물기를 짜서 으깬다','소고기와 멸치가루와 달걀물, 빵가루, 다진 양송이버섯, 양파, 두부를 넣 고 치댄다','치댄 반죽을 동그란 모양으로 빚어 가열된 팬에 익힌다','단호박은 삶아 으깬다','밥 위에 양상추를 깔고 고기를 얹은 뒤 소스를 뿌린 다음 토마토, 양파, 단호박과 밥을 올려 완성한다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (188,'새우단배추된장국',3,1,'188.png','마늘(0.3g), 양파(10g), 애호박(20g), 단배추(25g), 대파(5g) 두부(25g), 마른 새우(10g) 육수 무(15g), 멸치(2.5g), 다시마(2.5g), 물(300g), 된장(10g), 표고버섯가루(3g), 날콩가루(10g)','냄비에 육수 재료를 넣고 10분간 끓여 건진다.','마늘은 다지고, 양파는 채 썰고, 애호박은 반달모양으로 납작하게 썬다.','단배추는 5cm로 썰고, 대파는 어슷 썰고, 두부는 0.5cm 두께로 썬다.','된장에 표고버섯가루, 날콩가루, 육수(50g)를 넣어 섞는다.','육수에 된장을 풀고 다진 마늘, 호박, 양파, 단배추 순으로 넣어가며 끓인다.','끓으면 마른 새우, 대파를 넣어 살짝 더 끓여 마무리한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (189,'단호박 생선탕수',5,2,'189.jpg','동태살 120g, 단호박 10g, 당근 15g, 오이 15g, 양파 15g, 전분 30g, 계란 110g, 튀김가루 10g, 목이버섯 3g, 식초 15g, 키위소스 20g','따뜻한 물에 부린 목이버섯, 동태살, 당근, 오이, 양파를 먹기 좋은 크기로 썬다.','동태살에 소금과 흰후추로 밑간을 하고 녹말과 계란 흰자를 섞어 튀김옷을 만든다.','동태살에 튀김옷을 입혀 기름에 튀긴다.','물, 계란, 튀김가루를 섞어 튀김옷을 만든 뒤 단호박을 튀긴다.','프라이팬에 기름을 두르고 당근, 양파, 목이버섯을 볶는다','5에 키위소스, 식초를 넣고 전분물을 넣어 농도를 맞춘 뒤 튀긴 재료와 오이를 섞는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (190,'미역 미소국',3,3,'190.jpg','미소된장 3.5g, 건미역 2g, 가츠오부시 0.3g, 미향 0.3g','건미역을 물에 불린다.','불린 미역을 잘게 다진다.','냄비에 분량의 물을 넣고 가츠오부시를 우린다.','우려낸 육수에 미소된장을 푼다.','4에 미역을 넣고 한소끔 끓인다.','미향을 넣어 마무리 한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (191,'차가운 당근 수프',3,4,'191.jpg','당근 80g, 버터 2g, 양파다진것 10g, 생강다진것 1g, 마늘다진것 2g, 야채육수 50g, 오렌지주스 20g, 생크림 5g, 당근주스 30g, 소금적당량','버터를 녹인 냄비에 양파, 생강, 마늘 다진 것을 넣고 양파가 반투명해 질 때까지 볶는다.','1에 얇게 썬 당근을 넣고 볶는다.','2에 야채육수, 오렌지주스를 넣고 당근이 익을 때까지 끓인다','믹서에 3을 넣고 갈아준 뒤 차갑게 한다.','제공하기 직전에 크림을 넣어 섞은 뒤 당근주스를 넣는다.','소금, 후추로 마지막 간을 하고 차가운 볼에 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (192,'이태리식 해산물 샐러드',6,4,'192.jpg','새우 25g, 관자 20g, 오징어 40g, 양파다진것 5g, 파슬리다진것 2g, 마늘다진것 3g, 블랙올리브 5g, 올리브오일 3g, 케이퍼 3g, 레몬주스 4g, 후추적당량, 소금적당량, 양상추 40g"','새우는 껍질을 벗기고 내장을 제거한 뒤 뜨거운 물에 데쳐 찬물에 식힌다.','관자, 오징어는 깨끗하게 손질하고 한입 크기로 자른다.','양파, 파슬리, 마늘을 다지고, 블랙 올리브는 입자가 보이도록 자른다.','기름 두른 팬에 양파를 넣어 볶은 뒤 관자, 오징어를 넣어 볶는다.','데친 새우를 넣어 살짝 볶아준 뒤 볼에 옮겨 담는다.','볼에 올리브, 케이퍼, 파슬리, 마늘, 레몬주스, 올리브오일을 넣고 소금, 후추로 간을 한다.','접시에 양상추와 함께 담아낸다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (193,'봄주먹밥',1,1,'193.png','봄동 10g, 깻잎 6g, 낙지다리 6g, 참기름 3g 두릎 8g, 올리브유 4g, 미나리 3g, 데친꼬막살 12g, 올리브유 4g, 밥 100g, 참깨 3g, 참기름 10g, 다진양파 14g, 다진당근 14g, 다진애호박 14g, 물 150g, 된장 14g, 고춧가루 4g, 다진마늘 4g, 붉은고추 4g','봄동과 깻잎은 데친 뒤 체에 밭쳐 물기를 제거한다.','데친 꼬막살은 물기를 제거하고 다져 올리브유로 양념한 밥에 참께와 함께 버무린 후 한입 크기로 주먹밥을 만든다.','낙지 다리는 데처 찬물에 담가 식힌 뒤 참기름(3g)에 양념하고, 두릅은 데쳐 물기를 제거한 뒤 올리브유로 양념한다.','봄동에 꼬막밥을 넣고 만 뒤 껫잎으로 싸고 데친 미나리로 묶어 봄주먹밥을 만든다.','냄비에 참기름을 두르고 양파, 당근, 애호박을 볶은 뒤 물, 된장, 고춧가루, 다진마늘, 붉은고추, 청양고추, 두부를 넣고 조려 두부강된장을 만든다.','봄주먹밥에 낙지와 두릅, 두부강된장을 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (194,'효종갱',3,1,'194.jpg','배추(20g), 무(10g), 느타리버섯(20g), 쇠고기(양지 50g, 갈비 50g), 양파(40g), 마늘(10g), 물(300g), 저염간장(10g)','소고기는 핏물을 제거한 뒤 양파, 마늘을 넣고 물(300g)을 부어 1시간 이상 끓인 뒤 면포에 걸러 육수를 만든다.','삶은 소고기는 건져내 결 반대 방향으로 썬다.','배추, 무, 느타리버섯, 표고버섯은 먹기 좋은 크기로 썬다.','전복은 깨끗이 손질한다.','육수를 끓인 뒤 끓어오르면 무를 넣어 반투명해지면 배추, 버섯, 전복을 넣는다.','전복이 익으면 소고기를 넣고 저염간장으로 간을 해 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (195,'갯벌의 여왕 모시조개의 달콤한 유혹',4,1,'195.jpg','모시조개 200g(30개), 양파 15g(2*4cm), 마늘 10g(2쪽), 마른 홍고추 1g(1/5개), 올리브유 15g(1큰술), 화이트와인 15ml(1큰술), 쳥양고추 3g(1/3개), 저염치즈 10g(2작은술), 후추 약간, 바질 약간','양파는 잘게 썰고 청양고추는 어슷썰기를 한다.','마늘은 편으로 썰고 마른 홍고추도 둥글게 썰어 준비한다.','조개는 흐르는 물에 여러 번 씻어 해감을 시킨 후 물기를 제거한다.",','달궈진 팬에 올리브오일을 두르고 마늘, 마른홍고추, 양파를 넣어 볶아 향을 낸 후, 센불로 불을 키우고 모시조개를 넣는다.','조개가 입을 벌리면 바질과 화이트와인을 넣어 잡내를 없앤다','한소끔 끓여낸 후 붕간 불로 줄이고 저염치즈, 청양고추, 후추를 넣어 칼칼한 맛을 낸다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (196,'궁중 떡볶음',5,1,'196.jpg','떡볶이용 떡 50g, 청피망 8g, 홍피망 5g, 표고버섯 25g, 쇠고기 13g, 숙주 10g 참기름 1g, 간장 2g, 설탕 1g, 마늘 0.5g, 대파 5g, 샐러리 3g, 양파 13g, 홍고추(마른것) 3g, 생강 5g, 물엿 5g, 녹말가루 1.3g','끓는물에 채소들을 넣고 1/3가량 부피가 줄어들면 건져내 채로 거른다.','피망과 버섯은 채 썰고, 고기는 곱게 다져서 양념한다.','숙주는 머리와 꼬리를 뗀다','팬에 고기를 볶다가 떡과 피망, 버섯, 숙주를 넣고 재빨리 볶아낸 후 참기름을 살짝 뿌린다.',' 양념장 재료를 섞어 끓이면서 녹말물을 넣고 농도를 맞춘다.','볶은 재료를 담고 양념장을 뿌린다.',' 피망과 버섯은 채 썰고, 고기는 곱게 다져서 양념한다.','숙주는 머리와 꼬리를 떼어둔다.|팬에 고기를 볶다가 떡과 피망, 숙주를 넣고 재빨리 볶아낸 후 참기름으로 마무리한다.',' 1의 양념장에 녹말물을 넣고 농도를 맞춘다.','볶은 재료를 담고 양념장을 뿌린다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (197,'태국식 불고기 샐러드',6,6,'197.jpg','쇠고기 30g, 애호박 20g, 토마토 25g, 가지 15g, 양파 8g, 새송이버섯 15g, 그린 샐러드적당량, 풋고추 3g, 홍고추 3g, 마늘 1g, 고춧가루 1g, 레몬주스 3g, 타바스코 1g,올리브오일 1g, 로즈마리 1g, 민트 1g, 카레가루 2g','양파, 당근, 셀러리, 무 등의 야채와 월계수잎, 타임등을 넣고 야채육수를 끓인다.','소고기는 불고기용으로 손질하여 소금, 후추로 밑간한다.','애호박, 토마토, 가지, 양파, 새송이버섯을 채 썬 뒤 볶는다.','밑간해 둔 소고기를 굽는다.','접시에 밥을 깔고 그 위에 그린샐러드를 올린 뒤 익혀놓은 고기와 볶아놓은 야채들을 올린다.','마지막으로 드래싱을 뿌린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (198,'고구마 바나나 무스',8,4,'198.png','고구마(50g), 바나나(17g), 달걀(1개), 크림치즈(10g), 우유(20g), 생크림(25g), 딸기잼(15g), 젤라틴(8g), 바닐라빈(1g), 올리고당(2g)','삶아 으깬 고구마와 으깬 바나나를 섞는다.','볼에 달걀노른자, 올리고당, 우유, 바닐라빈을 넣고 중탕시켜 걸쭉하게 만든 뒤 1번과 섞는다.','2번에 휘핑한 생크림을 넣고 섞은 뒤 젤라틴을 넣는다','딸기잼에 우유를 넣고 끓여 젤리를 만든다','무스 틀에 3번과 딸기잼 젤리를 차곡차곡 넣어 굳힌다.','굳힌 무스위에 크림치즈를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (199,'고구마치즈크로켓',5,3,'199.png','호박고구마(200g), 새우살(80g), 삼색파프리카(80g), 양파(40g), 모짜렐라치즈(40g), 밀가루(20g), 달걀(1개), 빵가루(20g), 생크림(15g), 버터(10g), 꿀(5g), 식용유(40g)','고구마는 찜통에 찐 후 껍질을 제거하고 으깨 생크림, 꿀을 넣고 섞는다','새우살, 파프리카, 양파는 잘게 다진 뒤 팬에 버터를 두르고 볶는다.','볼에 1번과 2번을 넣고 서로 잘 섞이도록 치댄다.','3번을 한입 크기로 떼어낸 후 가운데 모짜렐라 치즈를 넣고 공모양으로 만든다.','크로켓에 밀가루, 달걀물, 빵가루 순으로 묻힌다','180℃의 기름에 크로켓을 튀긴다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (200,'오미자 샹그리아',9,5,'200.png','오미자(30g), 사과(80g), 오렌지(100g), 딸기(80g), 포도(80g), 배(80g)','오미자를 세척한 뒤 물에 담궈 맛을 낸다.','사과, 오렌지, 딸기, 포도, 배를 세척한다.','세척한 과일을 작고 얇게 슬라이스한다.','1번에 3번을 넣어 숙성시킨다.','따뜻하게 먹을 때는 계피를 넣어 끓인다.',null,null,null,null,null);
REM INSERTING into RECIPE.REG_PEOPLE
SET DEFINE OFF;
REM INSERTING into RECIPE.R_COMMENT
SET DEFINE OFF;
REM INSERTING into RECIPE.R_LIKE
SET DEFINE OFF;
REM INSERTING into RECIPE.R_PRODUCT
SET DEFINE OFF;
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (1,39900,'유자향이 가득하고 영양이 가득하고 신선한 재료로만 엄선해 만든 엄마가 해준 그맛!',100,'유자 얼갈이 배추김치','42.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (2,59900,'바다의 보석! 전복을 가득 넣은 바다향이 가득한 김치 너무 맛있습니다!',100,'전복김치','43.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (3,15300,'달달한 영양만점 단호박과 고~소한 들깨가 듬뿍! 둘이먹다가 하나가 죽어도 모르는맛!',100,'단호박 들깨 꽁치조림','44.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (4,32320,'톡톡 터지고 새콤달콤한 석류가 들어간 김치! 보쌈과 먹으면 환상적인 맛!',100,'석류 보쌈김치','45.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (5,4500,'건강에 좋고 신선한 애호박으로 만든 반찬! 들깨가 들어가 더욱 고소해졌습니다',100,'애호박들깨볶음','47.png',1,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (7,6990,'찹쌀가루를 색색으로 반죽하여 소를 넣고 경단 모양으로 빚어 삶아 내어 꿀물에 띄워낸 음료!
달달하고 너무 맛있어요!',100,'원소병','104.png',1,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (6,12200,'소고기와 닭고기의 환상적인 만남! 땅과 하늘이 만나 완벽한 조합을 이루었다! 한번 맛보면 그 맛을 보면 절대 잊을수 없습니다!',100,'음메꼬꼬돌돌','105.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (8,25000,'12시간 동안 육수를 내 진하고 닭이 부드러워 먹으면 술술 넘어가는 화제의 초계탕! 지금 바로 주문하세욧!',100,'초계탕','107.png',1,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (9,7990,'몸에 좋은 콩나물과 부추가 만났다! 하나만 먹어도 건강한 재료를 두개를 동시에! 이 반찬과 밥이면 한그릇 뚝딱!',100,'콩나물부추무침','108.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (10,31400,'복날에 이거 하나면 충분! 더운 여름철 기운을 복돋아줄 음식!',100,'닭고기 완자삼계죽','111.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (11,3300,'바다가 바로 내 밥상으로 도착한다! 다양한 해물이 들어가 바다향이 가득~!!',100,'해물볶음밥','114.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (12,4000,'비타민과 필수 아미노산이 함유되어 김밥 한줄이면 비타민약이 필요없습니다~!! 오메가-3가 많은 참치도 같이 있어서 건강함은 두배!!',100,'새싹참치김밥','116.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (13,25000,'16가지 한방 약재를 넣어 건강도 챙겼다!! 기름을 쫙~빼 담백하고 맛있게 드실수 있습니다~!!!',100,'족발수육','117.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (14,5500,'하와이의 풍미가 느껴지는 맛! 한입 먹으면 그 곳이 바로 하와이!! 지금 당장 먹고 하와이로 떠나 보아요~!!',100,'파인애플볶음밥','157.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (15,6600,' 하나도 둘도 아닌 딤섬이 세개?! 눈이 즐겁고 입이 즐겁다!! [먹으면 홍콩으로 여행갈 필요가 없어요!] 리얼후기가 말해드립니다!!!',100,'삼색딤섬','164.png',2,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (16,12000,'달콤한 단호박을 넣어 더 달달해졌다!! 새콤달콤하고 바삭바삭한 탕수육!! ',100,'단호박 생선탕수','189.jpg',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (17,5000,'채식자들을 위한 요리! 동물들에게도 권리가 있다구욧!! 동물들의 권리도 챙기고 건강도 챙겼습니다!!',100,'채소 자장면','29.png',2,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (18,18000,'한 입에 쏙~! 미니라 먹기가 편하다!! 몸에 좋은 버섯으로 만든 탕수육! 중식은 기름져 건강에 안 좋을거 같다구요?! 놉!! 버섯으로 만들어 건강도 챙겼습니다!!',100,'미니버섯탕수','101.png',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (19,6700,'큼직~한 대하가 풍덩~~! 간편한게 즐길 수 있는 간편식! 전자레인지에 6분이면 뚝딱!! 간편하게 즐기세욧!!',100,'대하 마늘볶음밥','112.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (20,10000,'아이들이 좋아하는 깐풍기가 주먹밥으로!? 남녀노소 누구나 좋아하는 깐풍기! 아이들이 너무 좋아해요!!',100,'깐풍주먹밥','115.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (21,25000,'황태가 탕수육으로!! 국으로만 먹었던 황태는 이제 그만 탕수육으로 만들어 아이들 간식으로 최고!! 지금 당장 주문하세요~~!!',100,'황태탕수육','125.png',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (22,7700,'모짜렐라 치즈폭탄을 맛보고 싶다면 지금 바로 주문!!',100,'치즈감자크로켓','79.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (23,3000,'어묵과 채소가 만났다!! 채소가 들어가 더 건강에 좋아요~!!',100,'채소어묵','161.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (24,6000,'바삭바삭하고 맛있는 크로켓! 밥으로 만들어 간단한 한끼 식사로 적합해요~!!',100,'밥크로켓','165.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (25,3200,'미역이 들어가 시원하고 일본 정통 미소만을 사용해 일본에 온듯한 느낌을 줍니다~!~!~!',100,'미역 미소국','190.jpg',3,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (26,7900,'치즈와 고구마의 환상적인 만남!! 튀김옷 안에서 펼쳐지는 환상의 파티~! 환상적인 파티로 지금 초대합니다!!',100,'고구마치즈크로켓','199.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (27,15000,'너무 맛있어요!',100,'오색지라시 스시','3.png',3,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (28,12000,'닭가슴살이 퍽퍽하다고요!? 그 생각을 완전히 부셔드리겠습니다! 촉촉하고 부드러운 닭가슴살이 나를 감싼다!! 세계제일의 오코노미야키!!',100,'닭가슴살 오꼬노미야끼','34.png',3,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (29,7000,'와.채.소.크.로.켓 아시는구나 한번 먹으면 완전 반합니다!!',100,'채소크로켓','40.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (30,7700,'연어를 좋아하는 사람은 그냥 지나칠 수 없는 연어초밥! 이걸 보고 있는 당신! 그냥 지나칠 생각은 하지 마이소~~',100,'연어초밥','103.png',3,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (31,31400,'가지가 맛없다는 생각은 이제 그만!! 이걸 먹으면 당신도 가지에서 벗어날 수 없습니다!!',100,'토마토 가지 카프레제','52.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (32,3300,'부드러운 토마토 스프가 나를 감싸네~!! 여기에 파스타면만 있으면 오늘은 과식할 예정!!',100,'토마토스프 파스타','67.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (33,4000,'스테이크를 먹어도 건강하게 웰빙스테이크로 건강하게 고기를 드세요~~',100,'웰빙스테이크','70.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (34,25000,'뇨끼가 뭔지 모르신다구요!? 인생 헛 살으셨네~~ 이거 먹고 헛된 인생을 되돌리세요!!',100,'까르보나라뇨끼','76.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (35,5500,'이거 안좋아하는 사람 못봄! 불호없는 음식이 왔따!! 지금 당장 백만개 주문햇!!',100,'햄버거스테이크','81.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (36,6600,'파스타 차갑게 먹어본적 없지? 이거 한번 먹어봐 중독될껄? ',100,'냉토마토파스타','82.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (37,12000,'또띠아에 치킨이면 말 다했지~~ 안먹어 보고는 못배길거야~!!! 지금 당장 주문 하란말이얏!!',100,'닭고기또띠아','83.png',4,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (38,5000,'닭고기고 스테이크로 즐길 수 있다구~! 부드러운 닭다리살만 사용해 맛있다구~!!',100,'닭고기스테이크','84.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (39,18000,'먹어봤자나 맛있었자나 그럼 주문해야지~!! 당.장.주.문.해.',100,'오징어순대','85.png',4,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (40,6700,'연어를 좋아한다구? 그럼 당장 주문해~! 먹으면 완전 반할거야!!',100,'연어차우더스프','86.png',4,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (41,10000,'시금치랑 브로콜리를 싫어 했던 사람도 이건 먹더라.. 맛있다고 소문까지 났어!!',100,'시금치브로컬리 파스타','87.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (42,25000,'인싸들은 크림파스타에 바나나 넣어 먹는다.. 바나나 안넣어 먹는다구? 너 아ㅆ.. 아니야 먹어봐...',100,'바나나크림파스타','99.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (43,7700,'육즙이 가득한 함박스테이크!! 한입 베어물면 육즙이 ☆폭발☆',100,'함박스테이크','167.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (44,3000,'더운날에 먹으면 딱 좋은 파스타 시원하고 깔끔해서 먹기 딱 좋습니다~!!',100,'냉파스타','168.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (45,6000,'달콤~~한 팬케이크에 상큼한 키위가 듬뿍!! 상콤달콤하고 맛있습니다!!!!',100,'키위 팬케이크','184.png',4,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (46,3200,'입안에서 사르르 녹는 푸딩! 그냥 푸딩이 아니라 허니레몬 그린티맛!! 그린티 좋아하면 이건 못참지!!',100,'허니레몬 그린티 푸딩','185.png',4,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (47,7900,'이걸 안먹어 봤다고!? 나두.. 아까워서 못먹는중... 하지만 당신은 지금 바로 드세욧!!',100,'차가운 당근 수프','191.jpg',4,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (48,15000,'여기가 지중해인가...내 안방인가.. 먹으면 지중해 바다가 펼쳐진다!!',100,'이태리식 해산물 샐러드','192.jpg',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (49,12000,'달달한거 옆에 달달한거 이거 먹으면 당충전 20000%!! 기분 안좋은날 먹으면 최고!!',100,'고구마 바나나 무스','198.png',4,8);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (50,7000,'이름만 들어도 극혐... 치커리 샐러드라니... 나같음 이거 먹을바엔 치킨먹는다...',100,'치커리샐러드','17.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (51,7700,'솔직히 감자는 어떻게 먹어도 맛있자나... 지금 당장 주문해서 먹어!!',100,'그린매쉬드포테이토','18.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (52,7000,'비타민이 가득한 민들레가 밥상으로! 민들레로 건강함 200%충전하세요!!',100,'민들레 샐러드 ','51.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (53,7700,'이제 채워넣기도 귀찮아...',100,'버섯샐러드','53.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (54,31400,'훈제오리 이름만 들어도 맛있어..!! 이거면 아무리 샐러드라도 한그릇 뚝딱!!',100,'훈제오리가슴살 샐러드','58.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (55,3300,'이건 안보겠지~~!! 메롱!',100,'산마샐러드','61.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (56,4000,'오징어 먹고싶다.. 오징어 맛있는데...',100,'오징어콩순대','71.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (57,25000,'소고기 장조림은 좋은데... 토마토...? 이건 좀...',100,'토마토소고기장조림','72.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (58,5500,'삼겹살~~!~~~~!~!!!! 이름만 들어보 배고파진다...',100,'삼겹살꼬치구이','74.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (59,6600,'라이스 버거는 롯데리아가 진리지..',100,'라이스버거떡갈비','78.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (60,12000,'윽... 컬리플라워 소스? 이걸 누가 먹어...',100,'컬리플라워소스','89.png',5,9);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (61,5000,'양배추 안에 고기 많으면 먹을만 하겠다!!',100,'양배추롤','97.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (62,18000,'그냥 고기를 먹지 왜 콩고기를...?',100,'콩고기샐러드','98.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (63,6700,'닭갈비라면이라니.. 이건 좀 맛있을 듯..!!',100,'닭갈비볶음면','100.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (64,10000,'면 삶고 로제소스 부어주면 끝 아님?',100,'로제소스라면','151.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (65,25000,'라면은 비빔면 맞겠지 그럼 이건 최고의 음식!!!',100,'삼겹살라면','152.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (66,31400,'오징어를 구웠는데 맛없을리가..',100,'오징어구이','68.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (67,3300,'달달~허니 꿀맛이겠네~!!!',100,'배숙구이','69.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (68,4000,'카레 좋아하면 이거도 좋아할듯?',100,'코코넛밀크카레밥','80.png',6,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (69,25000,'그냥 물김치면 충분한데 뭘 이것저것 넣는거야...',100,'콜라비오미자 물김치','90.png',6,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (70,5500,'젤리라구?! 이거 맛있겠군..!!!',100,'토마토젤리','160.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (71,6600,'아니 배추로 겉절이 하시라구요...',100,'과일겉절이','169.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (72,4000,'토마토 대잔치~~~',100,'토마토주스를곁들인컵토마토','174.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (73,25000,'이거 맛있으려나..? 갓직히 떡꼬치는 고추장 소스지...',100,'레몬들깨 소스를 품은 떡꼬치','180.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (74,5500,'이거 뭐야... 몰라.. 무서워...',100,'삼색매작과와 수정과겔','181.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (75,6600,'이거 맛있음! 아무튼 맛있음!',100,'고구마 석류 과편','182.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (76,12000,'이국적인 맛! 태국적인맛!',100,'태국식 불고기 샐러드','197.jpg',6,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (77,5000,'맛있는 브리또임 먹어보셈!',100,'머쉬룸 치킨 브리또','41.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (78,18000,'이건 맛있는거 인정? 어 인정!!',100,'닭고기월남쌈','49.png',6,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (79,3200,'카레인데 맛없을리가 없지!!',100,'생선카레튀김','50.png',6,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (80,7900,'바나나는 그냥 먹으세요...',100,'구운 바나나','143.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (81,15000,'응애! 응애!',100,'비타민이유식','145.png',6,3);
REM INSERTING into RECIPE.UR_COMMENT
SET DEFINE OFF;
REM INSERTING into RECIPE.UR_LIKE
SET DEFINE OFF;
REM INSERTING into RECIPE.USER_AUTH
SET DEFINE OFF;
Insert into RECIPE.USER_AUTH (EMAIL,AUTH) values ('aaa123@naver.com','ROLE_MEMBER');
Insert into RECIPE.USER_AUTH (EMAIL,AUTH) values ('bbb123@naver.com','ROLE_MEMBER');
Insert into RECIPE.USER_AUTH (EMAIL,AUTH) values ('ccc123@naver.com','ROLE_MEMBER');
Insert into RECIPE.USER_AUTH (EMAIL,AUTH) values ('user1','ROLE_MEMBER');
REM INSERTING into RECIPE.USER_INFO
SET DEFINE OFF;
Insert into RECIPE.USER_INFO (EMAIL,PW,NAME,ADDRESS,TEL,TASTE,KIND,IMG,SCORE,U_CHECK,ENABLED) values ('user1','$2a$10$q5N/JkI/uyjf73DY3w/lSuQl28oXYC.o7FwqMZ.ght4Bc/mNGpiyW','일반사용자1','서울틀별시 방배동','010-1111-1111',null,null,null,null,null,'1');
Insert into RECIPE.USER_INFO (EMAIL,PW,NAME,ADDRESS,TEL,TASTE,KIND,IMG,SCORE,U_CHECK,ENABLED) values ('aaa123@naver.com','8cb2237d0679ca88db6464eac60da96345513964','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111','1,','1,','9603c0f3-c20b-4e4d-b6b2-b6fda1582c0f_sample_img.jpg',0,0,'1');
Insert into RECIPE.USER_INFO (EMAIL,PW,NAME,ADDRESS,TEL,TASTE,KIND,IMG,SCORE,U_CHECK,ENABLED) values ('bbb123@naver.com','$2a$10$tdOcrk4mxnuVWRrZfyLY7u3947xlS86Mv436cUZtowf//3C7ld6rS','강현구',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111','1,','1,','809ed723-0f09-438a-9b38-020fee49cd5a_sample_img.jpg',0,0,'1');
Insert into RECIPE.USER_INFO (EMAIL,PW,NAME,ADDRESS,TEL,TASTE,KIND,IMG,SCORE,U_CHECK,ENABLED) values ('ccc123@naver.com','8cb2237d0679ca88db6464eac60da96345513964','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111','1,','1,','64542d38-1a5f-46e8-bb3d-6b7a6b9e2572_sample_img.jpg',0,0,'1');
REM INSERTING into RECIPE.USER_RECIPE
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table R_COMMENT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_COMMENT" ADD PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."R_COMMENT" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_COMMENT" MODIFY ("USER_RID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_COMMENT" MODIFY ("CID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_RECIPE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."USER_RECIPE" ADD PRIMARY KEY ("USER_RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("INGREDIENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("TASTE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_RECIPE" MODIFY ("USER_RID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table R_LIKE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_LIKE" ADD UNIQUE ("USER_ID", "USER_RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."R_LIKE" MODIFY ("USER_RID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_LIKE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("DELIVERCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("DELIVER" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_COOK_CLASS
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("C_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("C_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("C_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("DDAY" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("ENDDATE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("PEOPLE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("CNO" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_COOK_CLASS" ADD PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."A_COOK_CLASS" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_SELL_RECIPE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_SELL_RECIPE" ADD PRIMARY KEY ("USER_RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("INGREDIENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("TASTE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_SELL_RECIPE" MODIFY ("USER_RID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTIFY
--------------------------------------------------------

  ALTER TABLE "RECIPE"."NOTIFY" ADD UNIQUE ("USER_ID", "USER_RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."NOTIFY" MODIFY ("USER_RID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."NOTIFY" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table P_REVIEW
--------------------------------------------------------

  ALTER TABLE "RECIPE"."P_REVIEW" ADD PRIMARY KEY ("PCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("P_COMMENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("PCID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_INFO
--------------------------------------------------------

  ALTER TABLE "RECIPE"."USER_INFO" ADD UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."USER_INFO" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_INFO" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_AUTH
--------------------------------------------------------

  ALTER TABLE "RECIPE"."USER_AUTH" ADD PRIMARY KEY ("USER_ID", "AUTH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."USER_AUTH" MODIFY ("AUTH" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."USER_AUTH" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UR_COMMENT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."UR_COMMENT" ADD PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."UR_COMMENT" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."UR_COMMENT" MODIFY ("USER_RID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."UR_COMMENT" MODIFY ("CID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_REG_PEOPLE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_REG_PEOPLE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_REG_PEOPLE" MODIFY ("CNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table R_PRODUCT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_TASTE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" ADD PRIMARY KEY ("PID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("PID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECIPE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."RECIPE" ADD PRIMARY KEY ("RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("INGREDIENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("TASTE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."RECIPE" MODIFY ("RID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REG_PEOPLE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."REG_PEOPLE" ADD UNIQUE ("USER_ID", "CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."REG_PEOPLE" MODIFY ("CNO" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."REG_PEOPLE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UR_LIKE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."UR_LIKE" ADD UNIQUE ("USER_ID", "USER_RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."UR_LIKE" MODIFY ("USER_RID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."UR_LIKE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("DELIVERCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("DELIVER" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COOK_CLASS
--------------------------------------------------------

  ALTER TABLE "RECIPE"."COOK_CLASS" ADD PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("C_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("C_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("C_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("DDAY" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("ENDDATE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("PEOPLE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."COOK_CLASS" MODIFY ("CNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table A_REG_PEOPLE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_REG_PEOPLE" ADD FOREIGN KEY ("CNO")
	  REFERENCES "RECIPE"."A_COOK_CLASS" ("CNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COOK_CLASS
--------------------------------------------------------

  ALTER TABLE "RECIPE"."COOK_CLASS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTIFY
--------------------------------------------------------

  ALTER TABLE "RECIPE"."NOTIFY" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
  ALTER TABLE "RECIPE"."NOTIFY" ADD FOREIGN KEY ("USER_RID")
	  REFERENCES "RECIPE"."USER_RECIPE" ("USER_RID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."PURCHASE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table P_REVIEW
--------------------------------------------------------

  ALTER TABLE "RECIPE"."P_REVIEW" ADD FOREIGN KEY ("PID")
	  REFERENCES "RECIPE"."R_PRODUCT" ("PID") ENABLE;
  ALTER TABLE "RECIPE"."P_REVIEW" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REG_PEOPLE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."REG_PEOPLE" ADD FOREIGN KEY ("CNO")
	  REFERENCES "RECIPE"."COOK_CLASS" ("CNO") ENABLE;
  ALTER TABLE "RECIPE"."REG_PEOPLE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table R_COMMENT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_COMMENT" ADD FOREIGN KEY ("USER_RID")
	  REFERENCES "RECIPE"."RECIPE" ("RID") ENABLE;
  ALTER TABLE "RECIPE"."R_COMMENT" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table R_LIKE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_LIKE" ADD FOREIGN KEY ("USER_RID")
	  REFERENCES "RECIPE"."RECIPE" ("RID") ENABLE;
  ALTER TABLE "RECIPE"."R_LIKE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UR_COMMENT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."UR_COMMENT" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
  ALTER TABLE "RECIPE"."UR_COMMENT" ADD FOREIGN KEY ("USER_RID")
	  REFERENCES "RECIPE"."USER_RECIPE" ("USER_RID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UR_LIKE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."UR_LIKE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
  ALTER TABLE "RECIPE"."UR_LIKE" ADD FOREIGN KEY ("USER_RID")
	  REFERENCES "RECIPE"."USER_RECIPE" ("USER_RID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_AUTH
--------------------------------------------------------

  ALTER TABLE "RECIPE"."USER_AUTH" ADD CONSTRAINT "FK_MEMBER_AUTH" FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_RECIPE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."USER_RECIPE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
      
--------------------------------------------------------
--  Create Sequence
--------------------------------------------------------

-- recipe 시퀀스
CREATE SEQUENCE RECIPE_SEQ
INCREMENT BY 1
START WITH 201
MAXVALUE 99999
;

-- r_comment 시퀀스
CREATE SEQUENCE RECIPE_COMMENT_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
;

-- cook_class 시퀀스
CREATE SEQUENCE COOK_CLASS_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
;

-- USER_INFO 시퀀스
CREATE SEQUENCE USER_INFO_SEQ
INCREMENT BY 1
START WITH 101
MAXVALUE 99999
;

-- UR_COMMENT 시퀀스
CREATE SEQUENCE USER_RECIPE_COMMENT_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
;

-- P_REVIEW 시퀀스
CREATE SEQUENCE PRODUCT_REVIEW_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
;

-- R_PRODUCT 시퀀스
CREATE SEQUENCE PRODUCT_SEQ
INCREMENT BY 1
START WITH 82
MAXVALUE 99999
;

-- USER_RECIPE 시퀀스
CREATE SEQUENCE USER_RECIPE_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99999
;
drop sequence USER_INFO_SEQ;


CREATE SEQUENCE userrid_seq
INCREMENT BY 1
START WITH 400
MAXVALUE 99999
;
--------------------------------------------------------
--  파일이 생성됨 - 월요일-12월-07-2020   
--------------------------------------------------------
DROP SEQUENCE "RECIPE"."APPLY_RECIPE_SEQ";
DROP SEQUENCE "RECIPE"."PRODUCT_REVIEW_SEQ";
DROP SEQUENCE "RECIPE"."PRODUCT_SEQ";
DROP SEQUENCE "RECIPE"."PURCHASE_SEQ";
DROP SEQUENCE "RECIPE"."RECIPE_SEQ";

DROP TABLE "RECIPE"."A_APPLY_RECIPE" cascade constraints;
DROP TABLE "RECIPE"."A_PURCHASE" cascade constraints;
DROP TABLE "RECIPE"."PURCHASE" cascade constraints;
DROP TABLE "RECIPE"."P_REVIEW" cascade constraints;
DROP TABLE "RECIPE"."R_PRODUCT" cascade constraints;
DROP TABLE "RECIPE"."RECIPE" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence APPLY_RECIPE_SEQ
--------------------------------------------------------
CREATE SEQUENCE  "RECIPE"."RECIPE_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 400 CACHE 20 NOORDER  NOCYCLE ;

   CREATE SEQUENCE  "RECIPE"."APPLY_RECIPE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_REVIEW_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RECIPE"."PRODUCT_REVIEW_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RECIPE"."PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 102 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PURCHASE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RECIPE"."PURCHASE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table A_APPLY_RECIPE
--------------------------------------------------------
CREATE TABLE "RECIPE"."RECIPE" 
   (   "RID" NUMBER, 
   "NAME" VARCHAR2(50 BYTE), 
   "TASTE" NUMBER, 
   "KIND" NUMBER, 
   "IMG" VARCHAR2(100 BYTE), 
   "INGREDIENT" VARCHAR2(500 BYTE), 
   "RECIPE_1" VARCHAR2(500 BYTE), 
   "RECIPE_2" VARCHAR2(500 BYTE), 
   "RECIPE_3" VARCHAR2(500 BYTE), 
   "RECIPE_4" VARCHAR2(500 BYTE), 
   "RECIPE_5" VARCHAR2(500 BYTE), 
   "RECIPE_6" VARCHAR2(500 BYTE), 
   "RECIPE_7" VARCHAR2(500 BYTE), 
   "RECIPE_8" VARCHAR2(500 BYTE), 
   "RECIPE_9" VARCHAR2(500 BYTE), 
   "RECIPE_10" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "RECIPE"."A_APPLY_RECIPE" 
   (	"APPLYNO" NUMBER, 
	"A_PRICE" NUMBER, 
	"A_CONTENT" VARCHAR2(1000 BYTE), 
	"A_COUNT" NUMBER, 
	"A_NAME" VARCHAR2(100 BYTE), 
	"A_IMG" VARCHAR2(100 BYTE), 
	"A_KIND" NUMBER, 
	"A_TASTE" NUMBER, 
	"U_NAME" VARCHAR2(20 BYTE), 
	"A_SELL" NUMBER DEFAULT 0, 
	"A_CHECK" NUMBER DEFAULT 0, 
	"REGDATE" TIMESTAMP (6) DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table A_PURCHASE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."A_PURCHASE" 
   (	"USER_ID" NUMBER, 
	"PID" NUMBER, 
	"PRICE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"DELIVER" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"BUYDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DELIVERCHK" NUMBER, 
	"PCHK" NUMBER, 
	"P_NAME" VARCHAR2(50 BYTE), 
	"PURCHASENO" NUMBER, 
	"COUNT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PURCHASE
--------------------------------------------------------

  CREATE TABLE "RECIPE"."PURCHASE" 
   (	"USER_ID" NUMBER, 
	"PID" NUMBER, 
	"PRICE" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"DELIVER" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"BUYDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DELIVERCHK" NUMBER, 
	"PCHK" NUMBER, 
	"COUNT" NUMBER, 
	"PURCHASENO" NUMBER, 
	"P_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table P_REVIEW
--------------------------------------------------------

  CREATE TABLE "RECIPE"."P_REVIEW" 
   (	"PRID" NUMBER, 
	"R_COMMENT" VARCHAR2(300 BYTE), 
	"R_IMG" VARCHAR2(200 BYTE), 
	"R_SCORE" NUMBER, 
	"USER_ID" NUMBER, 
	"PID" NUMBER, 
	"R_REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table R_PRODUCT
--------------------------------------------------------

  CREATE TABLE "RECIPE"."R_PRODUCT" 
   (	"PID" NUMBER, 
	"P_PRICE" NUMBER, 
	"P_CONTENT" VARCHAR2(1000 BYTE), 
	"P_COUNT" NUMBER, 
	"P_NAME" VARCHAR2(100 BYTE), 
	"P_IMG" VARCHAR2(100 BYTE), 
	"P_KIND" NUMBER, 
	"P_TASTE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into RECIPE.A_APPLY_RECIPE
SET DEFINE OFF;
Insert into RECIPE.A_APPLY_RECIPE (APPLYNO,A_PRICE,A_CONTENT,A_COUNT,A_NAME,A_IMG,A_KIND,A_TASTE,U_NAME,A_SELL,A_CHECK,REGDATE) values (2,3000,'꿀맛!',100,'핫도그','5a9d6534-744c-490e-8c31-3c20d95a8cd9_sample_img.jpg',4,5,'슈퍼맨',0,0,to_timestamp('20/12/06 20:13:07.000000000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into RECIPE.A_COOK_CLASS
SET DEFINE OFF;
REM INSERTING into RECIPE.A_PURCHASE
SET DEFINE OFF;
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/04 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',26,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,6,'12200','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,1,'음메꼬꼬돌돌',34,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'전복김치',27,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',28,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'풋고추/꽈리고추',29,12);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'단호박 들깨 꽁치조림',30,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,0,'쇠고기/호주산갈비',31,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),2,0,'수박/수박',32,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'새싹참치김밥',33,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),2,1,'미역 미소국',35,20);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,0,'배추/가을',36,3);
REM INSERTING into RECIPE.A_REG_PEOPLE
SET DEFINE OFF;
REM INSERTING into RECIPE.COOK_CLASS
SET DEFINE OFF;
REM INSERTING into RECIPE.NOTIFY
SET DEFINE OFF;
REM INSERTING into RECIPE.PURCHASE
SET DEFINE OFF;
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,1,27,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,28,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,12,29,'풋고추/꽈리고추');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,3,30,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/04 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,26,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,0,2,31,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),2,0,2,32,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa',',경기도 안양시 만안구 냉천로175번길 13 (안양동)','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,3,33,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,6,'12200','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,1,5,34,'음메꼬꼬돌돌');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),2,1,20,35,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터',',경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,0,3,36,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,131,'99,860',null,null,null,to_timestamp('20/12/02 23:38:37.000000000','RR/MM/DD HH24:MI:SSXFF'),2,0,2,21,'미나리/미나리');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (22,1,'39900',null,null,null,to_timestamp('20/12/07 02:12:57.000000000','RR/MM/DD HH24:MI:SSXFF'),0,1,2,37,'유자 얼갈이 배추김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,274,'4,793',null,null,null,to_timestamp('20/12/07 02:39:30.000000000','RR/MM/DD HH24:MI:SSXFF'),0,0,2,38,'찹쌀/일반계');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900',null,null,null,to_timestamp('20/12/07 02:39:39.000000000','RR/MM/DD HH24:MI:SSXFF'),0,1,3,39,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,4,'32320',null,null,null,to_timestamp('20/12/07 02:39:59.000000000','RR/MM/DD HH24:MI:SSXFF'),0,1,1,40,'석류 보쌈김치');
REM INSERTING into RECIPE.P_REVIEW
SET DEFINE OFF;
Insert into RECIPE.P_REVIEW (PRID,R_COMMENT,R_IMG,R_SCORE,USER_ID,PID,R_REGDATE) values (4,'sadfsadfㅌㅋㅊㅌㅊㅋㅌㅊㅋㅊ','5cd1a3f8-7287-4939-b67f-3e1187a37cab_star.png',3.5,2,1,to_date('20/12/01','RR/MM/DD'));
Insert into RECIPE.P_REVIEW (PRID,R_COMMENT,R_IMG,R_SCORE,USER_ID,PID,R_REGDATE) values (5,'맛있다 너무!','ce8d1661-3062-4268-807f-d7d15297c95c_sample_img.jpg',5,21,1,to_date('20/12/02','RR/MM/DD'));
Insert into RECIPE.P_REVIEW (PRID,R_COMMENT,R_IMG,R_SCORE,USER_ID,PID,R_REGDATE) values (21,'꿀맛!! 수정!','a994c103-f87a-4667-b130-c6bbde3a3510_sample_img.jpg',4.5,22,1,to_date('20/12/07','RR/MM/DD'));
Insert into RECIPE.P_REVIEW (PRID,R_COMMENT,R_IMG,R_SCORE,USER_ID,PID,R_REGDATE) values (3,'sadfsadfㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ','e3ebe090-56bb-4aad-9c2b-11ff85b0fefe_sample_img.jpg',4.5,2,1,to_date('20/11/30','RR/MM/DD'));
REM INSERTING into RECIPE.RECIPE
SET DEFINE OFF;
SELECT * FROM RECIPE r2 ;
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (51,'민들레 샐러드 ',6,5,'51.png','민들레 잎 40g, 비트 5g(1작은술), 오렌지(껍질) 40g(1/5개),간장 20g(1과1/3큰술), 다진 홍고추 10g(1개), 레몬즙 60g(4큰술), 설탕 6g(1작은술)','간장, 레몬즙, 설탕, 다진 홍고추를 섞어 드레싱을 만든다.','민들레 잎을 씻어 4×4cm로 썬다.','비트는 채 썰고 물에 담가 색을 뺀다.','오렌지는 씻어 껍질만 발라 채 썬다.','민들레 잎, 비트, 오렌지 껍질을 섞어 접시에 담고 드레싱을 곁들인다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (52,'토마토 가지 카프레제',6,4,'52.png','가지 100g(1개), 토마토 200g(1과1/2개), 무순 20g, 마늘 10g(2개), 올리브오일 5g(1작은술) 올리브오일 25g(2큰술), 발사믹식초 60g(4큰술), 후춧가루 2g(1/2작은술)','가지 100g(1개), 토마토 200g(1½개), 무순 20g, 마늘 10g(2개), 올리브오일 5g(1작은술),올리브오일 25g(2큰술), 발사믹식초 60g(4큰술), 후춧가루 2g(1/2작은술)','올리브오일, 발사믹식초, 후춧가루를 섞어 차게 식혀 드레싱을 만든다.','가지와 토마토는 5mm두께로 썬다.','가지와 토마토는 120도 오븐에 20분 굽고, 구운가지는 물기를 제거한다.','마늘은 채 썬다.','팬에 올리브오일을 두르고 약불에서 마늘을 볶다가, 가지를 넣고 굽는다.','접시에 토마토, 가지를 번갈아 담고 무순으로 장식한다.','드레싱을 곁들인다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (53,'버섯샐러드',6,5,'53.png','느타리버섯 50g(10개), 표고버섯 50g(3개), 양상추 40g(5장),양조간장 2g(1/2작은술), 설탕 5g(1작은술), 식초 2g(1/2작은술),방울토마토 24g(3개)','냄비에 양조간장, 물, 설탕, 식초를 넣고 원래 분량의 1/3 될 때까지 졸여 소스를 만든다.','양상추는 4×4cm로 찢은 후 찬물에 담근다.','방울토마토는 4등분으로 자른다.','느타리버섯은 손으로 찢고. 표고버섯은 두께 1.5cm 정도로 자른다.','끓는 물에 버섯을 데치고, 찬물에 씻어 물기를 제거한다.','물에 담가 놓았던 양상추의 물기를 제거하고, 완성그릇에 담은 후 그 위에 버섯을 올린다.','소스와 방울토마토를 올려 완성한다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (54,'우렁된장소스 배추롤',6,1,'54.png','돼지고기(50g), 배춧잎(5장), 부추(30g), 쌀(100g), 당근(20g),표고버섯(2개), 양파(50g), 애호박(1/2개), 우렁이(100g),된장(30g)','끓는 물에 배춧잎을 데친다.','당근, 호박, 표고버섯, 양파는 입자있게 다진다.','돼지고기를 썰어 불린 쌀, 다진 야채와 함께 밥을 짓는다.','데친 배춧잎에 지어놓은 밥을 올려 돌돌만다.','말아 놓은 배춧잎을 부추로 묶는다.','찜통에 김이 오르면 ?번을 넣고 약 5분 정도 찐다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (55,'인삼떡갈비',4,1,'55.png','소고기(100g), 돼지고기(100g), 대추(3알), 양파(30g),마늘(20g), 배(1/4개), 애호박(1/2개), 단호박(1/4개),파프리카(50g), 인삼(1뿌리), 양송이(5개), 배추잎(5장), 저염간장(20g), 설탕(20g), 소금(0.2g), 후춧가루(0.01g), 두부(50g)','대추는 돌려 깍아 씨를 제거 하고 곱게 다진다.','다진 소고기와 돼지고기에 대추와 소금, 후춧가루를 넣고 치댄다.','애호박과 단호박, 파프리카는 입자있게 썰어 접시에 넣고 잘 치댄다.','양송이는 편으로 썰어 팬에 익히고, 인삼을 뇌두를 자르고 깨끗이 씻어 팬에 볶아 잘게 썰어 접시에 넣는다.','재료가 골고루 섞인 떡갈비를 갈비 모양으로 만든다.','떡갈비를 팬에 굽고, 접시에 배춧잎을 깔고 익힌 양송이를 올리고 떡갈비를 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (56,'호박잎 삼계탕',3,1,'56.png','호박잎(5장), 닭고기(가슴살, 120g), 찹쌀(100g), 대추(3알),미나리(20g), 인삼(1뿌리), 소금(0.2g), 후춧가루(0.01g)','찹쌀은 깨끗이 씻어 30분 정도 불린다','불린 찹쌀은 냄비에 넣고 질게 밥을한다.','닭가슴살은 넓게 펴서 소금, 후춧가루를 뿌린다.','호박잎과 미나리는 끓는 물에 살짝 데치고, 대추는 돌려 깎아 씨를 제거하고 인삼은 뇌두를 제거한 뒤 채를 썰어둔다.','닭 가슴살위에 찹쌀밥과 준비한 야채와 대추를 올려 돌돌 말아 질게 된 찹쌀밥에 넣고 약 20분 정도 더 쪄낸다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (57,'황태미역 곤약국',3,1,'57.png','황태채(100g), 곤약(100g), 건미역(20g), 들깨가루(20g),두부(50g), 된장(10g), 액젓(10g), 표고버섯(1개), 마늘(10g),참기름(5g)','된장에 두부를 넣고 골고루 섞는다.','표고버섯과 마늘은 함께 갈아둔다.','미역은 충분히 불린다.','냄비에 황태채와 갈아둔 표고버섯, 마늘을 넣고 은근히 끓여 육수를 만든다.','곤약은 납작납작하게 썰어 끓는 물에 데친다.','육수에서 황태를 건져 두부된장과 함께 갈아 육수에 붓고, 미역, 곤약, 들깨가루를 넣고 약 20분 정도 끓인 후 액젓으로 간을 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (58,'훈제오리가슴살 샐러드',6,5,'58.png','오리고기(훈제오리 가슴살, 150g), 발사믹소스(50g), 양파(30g), 파슬리(5g), 블루베리(20g), 레디쉬(1개)','훈제오리 가슴살을 슬라이스한다.','슬라이스한 훈제오리는 팬에 굽는다.','양파는 채썰고 찬물에 담근 뒤 건진다.','레디쉬는 채썰고 찬물에 담근 뒤 건진다.','먹기 직전에 발사믹소스를 만든다.','접시에 훈제오리와 양파채, 레디쉬, 블루베리를 담고 발사믹소스를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (59,'새우전복찜',4,1,'59.png','전복(2개), 새우(3마리), 시금치(30g), 해초(20g), 저염간장(20g), 레몬(1/4개), 설탕(20g), 소금(0.1g), 마늘(10g), 녹말(10g), 식용꽃(60g)','전복은 수저로 떼어내어 소금으로 비벼 깨끗이 씻는다.','시금치는 데쳐 다지고, 새우는 껍질을 벗겨 전복, 해초와 함께 다진다.','3번을 잘 섞어 전복 껍질에 넣는다.','찜통에 김이 오르면 속을 채운 전복 껍질을 넣고 약 10분 정도 찐다','저염간장, 레몬, 설탕, 다진마늘을 넣고 살짝 끓여 소스를 만든다.','간장소스에 전분을 풀어 농도를 맞추고, 전복찜에 여러번 바르고 식용꽃을 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (60,'검은콩국수',3,1,'60.png','검은콩(200g), 메밀면(120g), 오이(30g), 방울토마토(1개), 땅콩(20g), 잣(10g), 참깨(5g)','검은콩은 깨끗이 씻어 약 12시간 정도 충분히 불린다.','불린 검은콩은 20분 정도 삶아 깨끗이 씻는다.','삶은 검은콩은 믹서기에 곱게 갈아 차갑게 식힌다.','오이는 씨를 제거하고 깨끗이 씻어 채썬다.','물을 끓여 메밀면을 삶고, 찬물에 여러번 헹구어 건져 물기를 뺀다.','메밀면을 그릇에 담고 차가운 콩 국물, 땅콩, 잣, 오이, 방울토마토 및 통깨를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (61,'산마샐러드',6,5,'61.png','산마(100g), 참나물(20g), 돈나물(20g), 토마토(100g), 레디쉬(1개), 어린잎(10g), 저염간장(20g), 식초(10g), 설탕(20g), 겨자가루(10g)','어린잎은 찬물에 담근다','마는 껍질을 벗겨 동글동글하게 썬다','썰어 놓은 마는 팬에 기름을 살짝 두르고 앞뒤로 굽는다.','썰어 놓은 마는 팬에 기름을 살짝 두르고 앞뒤로 굽는다.','저염간장에 식초, 설탕, 발효겨자를 넣고 골고루 섞어 소스를 만들고, 접시에 구운 마와 손질한 야채를 넣고 만들어 놓은 소스와 어린잎을 올린다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (62,'닭고기김치찌개',3,1,'62.png','닭가슴살(60g), 애호박(30g), 미나리(20g), 청양고추(3g), 두부(60g) 김치(120g), 참기름(20g), 느타리버섯(10g), 달걀(50g), 다시마(5g), 무(40g), 대파(5g), 양파(10g), 마른 고추(3g), 멸치(10g) 마늘(10g), 청주(10g), 물(300g)','육수 재료를 넣고 중간 불로 끓인 뒤 체에 걸러 육수를 만든다.','닭가슴살은 채 썬 뒤 물에 넣고 삶는다.','애호박은 반달 썰고, 미나리는 5㎝ 길이로 썰고, 청양고추는 잘게 썬 뒤 찬물에 담가 씨를 빼고, 두부는 한입 크기로 썰어 물에 담가둔다.','김치를 한입 크기로 썬 뒤 참기름에 볶다가 육수를 붓는다.','두부, 애호박, 느타리버섯, 미나리, 닭가슴살을 넣어 끓어오르면 달걀물과 청양고추를 넣고 조금 더 끓여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (63,'백김치콩비지찌개',3,1,'63.png','풋고추(10g), 백김치(100g), 콩비지(100g) 양념 참기름(8g), 후춧가루(0.2g), 다진 마늘(10g), 간장(2g)','풋고추는 잘게 다진다.','백김치는 먹기 좋은 크기로 썬다.','냄비에 백김치를 볶다가 김치가 익으면 참기름, 후춧가루, 다진 마늘을 넣고 볶는다.','물(200g)을 넣고 끓인다.','물이 끓으면 콩비지와 간장, 풋고추를 넣어 약한 불에서 15분 정도 끓여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (64,'해물김치찌개',3,1,'64.png','바지락(100g), 주꾸미(100g), 김치(150g), 무(50g), 마늘(10g) 대파(10g), 양파(40g), 두부(50g), 참기름(5g), 배즙(50g), 팽이버섯(10g), 다시마(5g), 멸치(10g), 물(300g)','냄비에 육수 재료를 넣고 끓이다가 물이 끓어오르면 다시마를 건지고 조금 더 끓여 육수를 우려낸다.','바지락은 해감하고, 주꾸미는 내장과 입, 눈을 제거하고 4cm 크기로 잘라 준비한다.','김치는 국물을 꽉 짜서 한입 크기로 썰고, 무는 편 썰고, 마늘은 다지고, 대파는 어슷 썰고, 양파는 굵게 채 썰고, 두부는 납작하게 썬다.','냄비에 참기름을 두르고, 양파와 김치가 투명해질 때까지 볶다가 육수를 붓고 바지락을 넣어 끓으면 주꾸미를 넣어 더 끓인다.','김칫국물과 배즙을 2:1로 섞은 뒤 찌개에 넣어 간을 맞춘다.','두부, 팽이버섯을 넣고 한소끔 끓여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (65,'쑥갓부대찌개',3,1,'65.png','통조림 햄(55g), 애호박(35g), 두부(40g), 팽이버섯(40g), 청양고추(10g) 김치(65g), 다시마(5g), 쑥갓(7g), 설탕(0.5g), 고춧가루(1g), 다진 마늘(5g), 고추장(5g)','통조림 햄을 썰어 끓는 물에 데친다.','애호박은 반달모양으로 썰고, 두부는 도톰하게 썰고, 팽이버섯은 밑동을 자르고 3등분하고, 청양고추는 어슷 썬다.','김치는 씻어서 잘게 썬다.','양념장을 만든다.','냄비에 물(200g)과 다시마를 넣고 살짝 끓여 다시마육수를 만든다.','육수에 손질한 재료를 담고 양념장 반을 넣고 중간 불에 끓이다가 쑥갓과 남은 양념장을 넣고 약한 불에 조금 더 끓여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (66,'들깨순두부찌개',3,1,'66.png','굴(40g), 멸치(2g), 표고버섯(10g), 느타리버섯(40g), 무(20g) 양파(10g), 미나리(10g), 대파(3g), 붉은 고추(2g), 순두부(100g), 다진 마늘(1g), 들깻가루(10g), 국간장(1.5g), 소금(0.5g)','굴은 깨끗이 씻은 뒤 김 오른 찜기에 찐다','굴을 쪄낸 물(250g)에 멸치, 표고버섯 밑동을 넣고 끓인 뒤 멸치와 표고버섯 밑동을 건져내 육수를 만든다.','느타리버섯은 밑동을 제거한 후 씻어 세로로 찢고, 표고버섯은 0.5㎝ 두께로 썬다.','무는 나박 썰고 양파는 채 썰고, 미나리는 3㎝ 길이로 썰고, 대파와 고추는 송송 썬다.','육수에 굴, 다진 마늘, 무, 양파, 버섯을 넣고 끓인다.','들깻가루와 순두부를 넣고 한소끔 끓인 뒤 국간장과 소금으로 간을 맞추고 대파, 붉은 고추, 미나리를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (67,'토마토스프 파스타',2,4,'67.png','홀토마토 200g, 토마토 100g, 다진양파 30g, 다진마늘 20g, 먹물파스타 25g, 치즈 25g 파슬리가루 1g, 함초소금 1g, 올리브오일 30g, 양파 20g, 가지 20g, 파프리카 20g, 애호박 20g','토마토홀과 토마토는 송송 다져주고, 마늘, 양파를 냄비에서 볶은 후 믹서에 갈아 토마토 스프를 만들어준다.','만들어진 스프를 볶아서 신맛을 날려준다.','먹물파스타면은 삶은 뒤 오일에 버무려주고 볶아준다.','양파, 애호박, 가지, 2가지색 파프리카를 먹기 좋게 잘라 팬에 볶아준다.','접시에 볶아진 채소와 파스타면을 서로 다시 볶아준다.','치즈를 곱게 다져주고 접시에 파스타면을 올린 뒤, 토마토스프와 치즈가루를 뿌려 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (68,'오징어구이',4,6,'68.png','오징어 300g, 미니파프리카 40g, 양파 50g, 청고추 15g, 홍고추 15g, 다진마늘 15g, 고춧가루 15g, 홀토마토 50g, 고추장 15g, 설탕 15g 올리고당 15g, 후추 1g, 참기름 15g, 볶은 현미 15g','오징어는 솔방울 모양으로 잘라준다.','미니 파프리카, 양파, 청홍고추는 적당한 크기로 잘라준다.','다진마늘을 볶다가 오징어를 넣어 볶는다.','홀토마토와 양념장 재료를 넣어 볶는다.','팬을 약간 태우는 듯 해서 불맛과 매운맛을 더해준다.','접시에 담아주고 볶은 현미를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (69,'배숙구이',4,6,'69.png','배 750g, 후르츠칵테일 150g, 생강청 50g, 방울토마토 60g, 탄산수 200g','뚜껑을 만들 배의 윗동을 자르고, 수저로 배 속을 판다.','탄산수와 생강청을 미리 30분 전에 섞어준다.','방울토마토를 먹기 좋게 잘라준 후 속을 파낸 배에 후르츠 칵테일과 방울토마토를 넣어준다.','과일로 채워진 배에 미리 만든 생강탄산수를 부어준다.','배를 뚜껑을 덮어 호일로 싼 후 팬에 구워준다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (70,'웰빙스테이크',4,4,'70.png','쇠고기등심 240g, 시금치 50g, 마늘 15g, 양파 50g, 건바질 2g 감자 60g, 레몬 25g, 파슬리가루 1g, 르네디종 홀그레인머스터 15g, 사과 80g, 버터 15g','쇠고기는 칼집을 살짝 넣어준 후 건 바질을 뿌려 1시간 정도 숙성시킨다.','감자는 껍질을 벗긴 후 먹기 좋게 잘라 뜨거운 물에 70% 정도 익혀준다.','익혀준 감자를 버터를 살짝 바른 후 팬에 파슬리가루를 뿌려 구워준다.','시금치는 데쳐내 물기를 제거하고 다진 양파와 함께 버터에 볶아준다.','사과는 사방 1cm 크기로 자른 후 레몬즙을 살짝 뿌려준 후 버터에 볶아 소스를 만들어 준다.','숙성된 소고기를 팬에 구워주고 곁들이 채소와 소스를 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (71,'오징어콩순대',4,5,'71.png','오징어 1마리(220g), 옥수수 30g, 귀리밥 50g, 강낭콩 20g 당근 20g, 미니파프리카 20g, 피망 20g, 대파 10g, 양파 25g 카레가루 25g, 흰후추 1g, 다진마늘 5g, 참기름 15g, 밀가루 15g, 레몬즙 15g','오징어는 내장을 빼서 흐르는 물에 깨끗이 씻은 후, 다리는 송송 다져주고 레몬즙을 살짝 뿌려준다.','강낭콩은 먼저 삶아준다.','피망, 당근, 양파, 대파, 파프리카는 송송 다져준다.','잘라준 오징어다리는 다진마늘과 살짝 볶아준다.','볼에 귀리밥을 넣고 카레가루를 넣고 모든 재료를 섞어 소 재료를 만든다.','오징어 안쪽에 밀가루를 묻혀주고 소를 채워 팬에 구워준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (72,'토마토소고기장조림',4,5,'72.png','소고기 우둔살 200g, 메추리알 100g, 방울토마토 100g, 마늘 30g, 꽈리고추 50g, 양파 45g, 맛간장 30g, 흰후추 1g, 어간장 15g, 설탕 15g','소고기는 사방 2cm 정도의 크기로 잘라서 물에서 80% 정도까지 익혀준 후 냉수에 깨끗하게 세척해 준다.','양파는 먹기 좋게 자르고 물 400g과 함께 간장 물을 만들어준다.','간장 물에 데쳐 놓은 소고기부터 졸여주기 시작한다.','메추리알을 넣고 함께 졸여준다.','방울토마토, 양파, 마늘, 꽈리고추까지 넣고 마지막으로 졸여준다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (73,'맛간장삼치구이',4,1,'73.png','삼치 200g, 생강 50g, 대파 100g, 통깨 1g, 버터 10g, 맛간장 30g, 생강청 25g, 커피 1g','소스 재료를 이용해 맛 간장으로 만든 데리 야끼소스를 만들어준다.','참치는 손질해 수분을 빼준 후 흰 후추로 밑간을 해준다.','생강은 아주 곱게 채 썰어 냉수에 헹군다.','대파도 아주 가늘게 채 썰어서 냉수에 담가 매운맛을 빼준다.','버터를 올린 팬에 삼치를 약불에서 구워준다.','구워진 참치를 소스에 졸여주고 대파채를 올린다. 삼치에 소스를 뿌리고 생강채를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (74,'삼겹살꼬치구이',4,5,'74.png','삼겹살 200g, 방울토마토 100g, 마늘기름 15g, 후추 1g, 로즈마리 1g, 통후추 2g 대파 20g, 마늘 10g, 꽈리고추 25g, 대파 25g, 고춧가루 1g, 레몬즙 2g','삼겹살은 길이로 잘라서 마늘기름, 통후추, 로즈마리에 마리네이드 해준다.','대파는 흰 부분만 잘라 구워주고, 꽈리고추도 함께 구워준다.','대파는 가늘게 채 썰어 물에 담가준다.','물에 담가진 대파를 물기를 빼고 양념해준다.','삼겹살을 꼬치에 끼워 굽고 구워진 채소, 대파채와 함께 완성한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (75,'새우아욱죽',1,1,'75.png','귀리밥 100g, 아욱 30g, 건새우 25g, 칵테일새우 25g, 저염 된장 30g','저염 된장을 물 300cc에 풀어준 뒤 건새우를 담가 30분 정도 담가준 뒤 살짝 끓여준다.','새우를 풀어준 된장 물을 체에 걸러준다.','아욱은 뜨거운 물에 데쳐서 먹기 좋게 썬다.','냄비에 밥과 된장 물을 풀어 끓인다.','어느 정도 끓으면 칵테일새우와 건져 놓았던 새우를 다시 넣어준다.','불을 끄기 전에 아욱을 넣어 한 번 더 끓여준 후 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (76,'까르보나라뇨끼',2,4,'76.png','감자 220g, 깻잎 10g, 베이컨 25g, 백일송이 25g 다진마늘 15g, 다진양파 25g, 다진대파 25g, 흰후추 3g, 버터15g, 우유 200g 생크림 30g, 설탕 10g, 치즈가루 15g','감자를 슬라이스 하여 찜통에 찐 후 체에 으깬다. 깻잎을 잘게 채 썰어서 냉수에 담가 향을 빼준다.','베이컨을 한 번 데쳐내 송송 썰어준 후 다진 마늘과 볶아준다.','으깬 감자와 깻잎을 다져서 반죽을 만들고 엄지손가락 크기로 떼어 밀가루를 뿌리고, 둥글게 빚은 후 포크로 자국을 내 뇨끼를 만든다.','만들어진 뇨끼를 삶아 건져준다.','팬에 버터를 넣고 다진양파, 다진마늘, 다진 대파, 볶은 베이컨, 새송이, 흰후추를 볶다가 우유와 생크림, 설탕을 넣고 끓여준다.','뇨끼를 넣어 한 번 더 끓여준 뒤 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (77,'호박죽',1,1,'77.png','단호박 200g, 찹쌀가루 100g, 브로콜리 50g, 양파 60g, 볶은 현미 25g 버섯마늘소금 2g, 흰후추 1g, 치즈가루 15g','단호박은 껍질을 까고 작게 잘라주고, 양파도 작게 잘라준다.','브로콜리는 뜨거운 물에 데쳐내 준 후 송송 잘라준다.','찹쌀가루는 물 100g에 풀어준다.','단호박과 양파는 물 300g에 삶아준다.','단호박과 양파가 익으면 믹서에 갈아서 다시 끓여준 뒤 찹쌀가루물을 넣어 끓여준다.','호박죽이 끓어오르면 치즈가루를 넣어준 후 볶은 현미랑 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (78,'라이스버거떡갈비',4,5,'78.png','밥 200g, 맛간장 15g, 전분가루 15g, 팽이버섯 20g, 흰후추 1g, 달걀 60g, 다진소고기 50g, 다진돼지고기 50g, 다진양파 30g, 다진쪽파 15g, 맛간장 10g, 후추 1g,토마토 80g, 미나리 20g, 맛간장 5g, 청고추 15g, 홍고추 15g','팽이버섯을 송송 다진 후 라이스버거 재료로 라이스버거를 만들어준다.','만들어준 버거는 팬에 구워준다.','토마토와 미나리를 먹기 좋게 잘라서 겉절이를 만들어준다.','떡갈비 재료로 떡 갈비를 만들어준다.','만들어진 떡갈비를 구워준다.','접시에 토마토 겉절이를 담고 라이스버거와 떡갈비를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (79,'치즈감자크로켓',5,3,'79.png','감자(150g), 생크림(20g), 당근(20g), 양파(20g), 오이(20g) 소금(0.5g), 모짜렐라치즈(50g), 밀가루(20g), 달걀(50g) 빵가루(50g), 튀김기름(400g)','감자는 껍질을 벗겨 삶는다.','오이와 당근은 어슷썰기를 하고 양파는 채를 썰어놓는다.','썰어 놓은 채소에 소금과 물을 넣고 살짝 절여, 물기를 짜놓는다.','삶아 놓은 감자를 채에 내리고 생크림을 넣어 섞는다.','생크림을 넣은 감자에 절여 놓은 채소와 모짜렐라치즈를 넣고 골고루 섞는다.','섞여진 감자를 크로켓 모양을 만들어 밀가루, 달걀물, 빵가루를 묻혀 튀김기름 170~180℃ 온도에서 바삭하게 튀겨 냅킨에 올려 기름을 제거하고, 접시에 담아 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (80,'코코넛밀크카레밥',1,6,'80.png','두부(100g), 소금(0.3g), 코코넛밀크(20g), 당근(20g) 양파(20g), 브로컬리(20g), 돼지고기(50g), 감자(20g) 버터(10g), 카레가루(30g), 물(250g)','두부는 소창에 넣고, 짜서 물기를 제거하고, 으깨어 놓는다.','으깬 두부에 소금과 코코넛 밀크를 넣고 골고루 섞는다.','섞여진 두부를 김이 오른 찜통에 넣고 약 5분 정도 찐다.','당근과 양파는 사각지게 썰고, 브로컬리는 데쳐 당근 크기로 썰어 놓는다.','돼지고기와 감자는 당근 크기로 썰어 주고, 냄비에 버터를 녹여 돼지고기를 먼저 볶다가 양파와 당근, 감자, 브로컬리를 넣고 다시 볶아 준 뒤, 쪄놓은 두부를 넣어 한 번 더 볶아준다.','볶아지는 냄비(⑤)에 카레 가루를 넣고 살짝 더 볶아준 뒤, 물을 넣고 자작하게 끓여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (81,'햄버거스테이크',4,4,'81.png','다진 돼지고기(60g), 다진 소고기(60g), 다진 마늘(10g) 로즈마리(2g), 빵가루(20g), 후춧가루(0.2g), 파프리카(20g), 양파(20g), 플레인요거트(20g), 설탕(10g) 매실액(10g), 식초(5g), 녹말가루(10g), 어린잎(5g)','돼지고기와 소고기를 섞어, 매실액을 넣고 30분 정도 냉장고에서 숙성을 시킨다.','숙성된 돼지고기와 소고기에 다진마늘, 로즈마리, 빵가루, 후춧가루를 넣고 골고루 섞는다.','파프리카는 반으로 잘라 그 안에 씨를 수저를 이용해서 파낸다.','속을 파낸 파프리카에 양념한 고기를 넣고, 꼭꼭 눌러 두툼하게 잘라 구워 접시에 담는다.','양파는 입자있게 다져 팬에 기름을 넣고 은근히 볶아 양파 향을 낸다.','볶아진 팬(5번)에 준비한 플레인요거트와 설탕, 매실액을 넣고 끓이다가, 식초와 녹말을 넣고 한 번 더 끓여 소스를 완성한다. 햄버거스테이트(4번)에 소스를 얹고, 어린잎을 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (82,'냉토마토파스타',2,4,'82.png','토마토(50g), 브로컬리(20g), 펜네(100g), 올리브오일(10g) 후춧가루(0.1g), 마늘(10g), 양파(20g), 당근(20g), 방울토마토(50g) 올리브오일(10g), 육수(400g), 설탕(10g) 소금(0.3g), 레몬즙(10g), 월계수잎(1장)','마늘은 곱게 다지고 양파, 당근, 방울토마토는 입자있게 다진다.','토마토는 씨와 껍질을 제거하고 채를 썰어놓는다.','브로컬리를 끓는 물에 데쳐 찬물에 헹구어 작게 썰어 준비한다.','펜네는 끓는 물에 약 10분 정도 삶아 건진다.','건져진 펜네는 올리브오일을 넣어 무친 후 그릇에 담아놓는다.','냄비에 오일을 넣고 마늘과 양파를 볶다가 당근과 방울토마토를 넣어 볶으면서 육수를 붓고 설탕과 소금, 레몬즙, 월계수잎을 넣고 끓인 뒤 월계수잎을 건져내고, 차갑게 식힌 후 그릇에 담겨 있는 펜네에 토마토채(2번)와 브로컬리(3번)를 함께 넣어 담아 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (83,'닭고기또띠아',1,4,'83.png','또띠아(50g), 닭고기살(100g), 느타리버섯(20g), 사과(20g) 오이(20g), 파프리카(20g), 애호박(20g), 양파(20g), 식초(10g), 아몬드(10g), 우유(20g), 머스터드(20g), 올리고당(20g)','닭고기살은 끓는 물에 데쳐 손으로 찢고, 느타리버섯도 데쳐 손으로 찢어 준비한다.','사과는 씨를 제거하고 약 6cm 길이로 채를 썰고, 오이와 파프리카도 같은 길이로 채를 썰어 놓는다.','애호박은 반달로 썰어 식초에 살짝 절여서 볶고, 양파는 채를 썰어 물에 잠시 담가 놓는다.','아몬드는 우유를 넣어 갈아 준비한다.','머스터드에 올리고당을 넣어 잘 섞어 준다.','또띠아를 팬에 기름 없이 굽고, 그 안에 닭고기 살과 느타리버섯, 오이, 사과, 파프리카와 호박을 넣어 속이 보이도록 말아놓고, 4번과 5번은 섞어서 소스를 만들어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (84,'닭고기스테이크',4,4,'84.png','닭고기살(120g), 소금(0.5g), 후춧가루(0.1g), 생강(5g) 정종(5g), 우유(50g), 오이(20g), 토마토(20g) 두부(80g), 흑임자(20g), 우유(50g)','닭고기살은 소금과 후춧가루, 생강즙과 정종을 뿌린 후 우유를 살짝 발라 숙성을 시킨다.','오이는 길게 껍질째 썰어 놓는다.','토마토는 반으로 잘라 편으로 썰어 준비한다.','두부는 소창으로 물기를 꼭 짜 놓는다.','물기를 제거 시킨 두부에 흑임자를 넣고 골고루 섞은 뒤 냄비에 넣고 우유와 함께 은근히 끓여 속을 만든다.','팬에 토마토를 먼저 구워 접시에 담고, 숙성된 닭고기를 구워 올린 뒤, 그 위에 오이로 원형기둥을 만들고 구운 닭고기를 다시 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (85,'오징어순대',1,4,'85.png','통오징어(100g), 양파(20g), 당근(20g), 부추(20g) 견과류(20g), 두부(50g), 대파(10g), 마늘(10g), 소금(0.5g) 녹말가루(10g), 정종(10g), 레몬(10g), 생강(5g)','통오징어는 다리를 떼어내고 내장을 제거시켜 통째로 깨끗이 씻어 준비 한다.','양파와 당근, 부추, 생강은 입자있게 썰고, 견과류는 다져 준비한다.','두부는 물기를 짠 후 수저로 으깨어 놓는다.','잘게 썰은 오징어 다리와 썰어 놓은 채소, 견과류(2번), 곱게 다진 대파와 마늘, 그리고 소금과 녹말가루를 두부 3번과 함께 골고루 섞어 순대속을 만든다.','손질된 오징어 속 안에 준비한 속을 채워 넣는다.','오징어순대에 레몬즙과 정종, 생강즙을 섞어 바른 뒤 찜통에 김이 오르면 오징어순대를 넣어 약 10분 정도 쪄서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (86,'연어차우더스프',3,4,'86.png','모시조개(50g), 연어(100g), 청피망(20g), 당근(20g) 양파(20g), 감자(50g), 밀가루(10g), 버터(5g), 육수(200g) 월계수잎(1장), 통후추(3알), 생크림(30g), 통마늘(10g','모시조개는 물에 소금을 넣고, 담그어 해감을 한다.','연어는 사각지게 썰어 준비한다.','당근, 양파, 감자는 사각크기로 썰어 놓고, 청피망은 채를 썰어 당근과 비슷한 길이로 잘라둔다.','냄비에 버터와 밀가루를 넣고 볶다가 채소를 넣어 같이 볶는다.','볶아지는 냄비에 모시조개와 육수를 넣고 끓인다.','거품을 걷어내고, 월계수 잎과 통후추, 통마늘을 넣고 끓이다가 연어와 생크림을 넣어 한 소큼 끓으면 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (87,'시금치브로컬리 파스타',2,4,'87.png','새우(대하, 3마리), 스파게티(100g), 시금치(30g), 브로콜리(50g), 바질(10g), 생크림(50g), 올리브오일(10g), 소금 (0.2g)','시금치와 브로콜리는 끓는 물에 소금을 넣고 살짝 데친다.','데친 시금치, 브로콜리와 바질을 믹서에 갈아 준다.','새우는 껍질을 벗겨 손질한다','끓는 물에 스파게티를 10분 정도 삶아 건진다.','삶아진 스파게티는 팬에 올리브오일을 넣고 볶는다.','갈아 놓은 시금치소스에 생크림을 넣고 한소끔 끓이면서 볶은 파스타를 넣은 뒤 새우를 올린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (88,'연근부각',5,1,'88.png','연근(60g), 식초(10g), 천일염(0.1g), 계피가루(20g), 식용유(200g)','연근은 껍질을 벗긴다.','껍질벗긴 연근은 얇게 썬다.','물 200g에 식초 10g을 섞는다','식촛물에 썬 연근을 담근다.','연근을 체에 건져 물기를 뺀다.','연근을 바삭하게 튀긴 뒤 천일염을 살짝 뿌리고, 계피가루를 묻힌다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (89,'컬리플라워소스',9,5,'89.png','콜리플라워(50g), 감자(30g), 양파(20g),우유(200g), 소금(0.2g), 후춧가루(0.01g)','콜리플라워는 팬에 볶는다.','감자와 양파를 썰어 콜리플라워와 함께 볶는다.','3번에 우유를 넣는다.','4번을 믹서로 곱게 간 뒤, 끓인다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (90,'콜라비오미자 물김치',1,6,'90.png','콜라비(1/2개), 오미자(20g), 무화과(20g), 파프리카(50g), 피망(30g), 쪽파(10g), 양파(30g), 건새우(10g), 다시마(10g), 소금(0.3g)','다시마와 건새우를 넣고 은근히 끓여 차갑게 식힌 뒤 육수를 만든다.','차갑게 식힌 육수는 체에 걸려내고 오미자를 넣고 소금으로 간을 한다.','콜라비, 피망, 파프리카는 납작하게 썬다.','육수는 체에 거른다','오미자를 넣고 소금으로 간을 한다.','통에 썰어놓은 야채와 무화과를 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (91,'표고버섯 감자찜',4,1,'91.png','표고버섯(3개), 감자(200g), 고수(10g), 당근(30g), 양파(30g), 홍고추(1개), 녹말(20g)','표고버섯은 따뜻한 물에 불린다.','감자는 강판에 간다.','고수는 잘게 다진다.','당근은 곱게 다지고, 양파와 홍고추도 다진다.','감자에 다진 당근과 양파, 홍고추를 섞는다.','불린 표고버섯은 기둥을 자르고 바닥에 녹말가루를 묻혀 5번을 넣고 김이 오른 찜통에 약 10분 정도 찐다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (92,'찬밥이용닭죽',1,1,'92.jpg','찬밥 60g, 닭다리살 80g, 감자 30g, 통마늘 15g, 양파 10g, 당근 8g, 부추 5g, 물 700g, 소금 0.75g, 후춧가루 0.3g','닭다리는 기름기를 제거하고 냄비에 물 3컵 반을 부어 통마늘과 삶아 육수를 만든다.','삶은 마늘을 체에 걸러 으깬 뒤 다시 육수에 넣는다.','닭 육수 2컵 반에 찬밥을 넣고 밥알이 무르도록 끓인다.','삶은 닭다리 살을 발라 잘게 찢어 넣는다.','감자, 양파, 당근, 부추는 잘게 다진다.','4에 5를 넣고 끓인 뒤 소금, 후춧가루로 간 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (93,'감자느타리버섯국',3,1,'93.jpg','감자 30g, 느타리버섯 15g, 두부 8g, 파 5g, 물 300g, 국멸치 5g, 홍고추 3g, 건다시마 3g, 다진 마늘 3g, 소금 0.5g','물 1컵 반에 국멸치와 건다시마를 넣어 멸치다시마국물을 만든다.','국물을 우린 다시마는 채썬다.','느타리버섯은 끓는 물에 데친 후 찢는다.','감자와 두부는 3~4cm 가량으로 채를 썰고 홍고추와 대파는 어슷썬다.','멸치다시마국물 1컵에 감자를 넣고 끓인 뒤 느타리버섯을 넣어 한소끔 끓이고 두부, 파, 다진 마늘, 홍고추를 넣고 소금으로 간 한다.','채 썬 다시마를 고명으로 얹는다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (94,'강된장부추비빔밥',1,1,'94.jpg','꽁보리밥 210g(보리쌀 90g), 부추10g, 콩나물 30g, 김 0.5g, 햇된장 12g, 고춧가루 1.7g, 다진 파 9g, 참기름 1.75g, 다진 돼지고기 우둔 25g, 건표고버섯 8g, 물 150g, 양파 25g, 청양고추 10g, 홍고추 10g, 애호박 25g, 감자 50g, 참기름 1.75g','된장에 고춧가루, 다진 파, 참기름을 넣어 양념된장을 만든다.','표고버섯을 물에 담가 불리고 버섯 불린 물은 따로 받아둔다.','불린 표고버섯, 양파, 고추, 애호박을 다지고 감자는 강판에 간다.','냄비에 참기름을 두르고 고기와 양념된장을 볶다가 다진 채소와 표고버섯 불린 물 3/4컵을 넣고 한소끔 끓인 뒤 간감자를 넣고 한번 더 끓인다.','된장이 끓는 동안 부추를 3cm 길이로 썰고 콩나물은 아삭하게 찐다.','보리밥에 부추, 콩나물, 김을 얹어 강된장과 함께 낸다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (95,'민어매운탕',3,1,'95.jpg','민어 50g, 쇠고기 양지15g, 다진 마늘 1.25g, 후추 0.25g, 참기름 0.5g, 무 40g, 애호박 20g, 애느타리버섯 20g, 풋 고추 5g, 홍고추 2.5g, 쑥갓 10g, 대파 5g, 생강즙 0.5g, 물 300g, 소금 0.5g, 간 홍고추 10g, 간 양파 10g, 다진 마늘 2g, 국간장 2.5g, 간장 2.5g, 맛술 5g, 굵은 고춧가루 5g, 고운 고춧가루 1.25g','양념장 재료를 모두 섞어 냉장고에서 하루 숙성시킨다.','민어는 비늘을 긁고 지느러미, 내장을 제거하여 흐르는 물에 씻어 5cm 길이로 토막 낸다.','소고기는 채 썰어 다진 마늘, 후추로 밑간한다.','무는 나박 썰기, 애호박은 반달 썰기, 애느타리는 한입 크기로 찢고 고추와 대파는 어슷 썬다.','냄비에 참기름을 두르고 소고기를 볶다가 물 1컵 반과 무를 넣고 양념장을 풀어 끓인다.','무가 반 정도 익으면 민어와 채소를 넣고 한소끔 끓인 뒤 어슷 썬 대파와 생강즙을 넣어 살짝 끓이고 소금 간하고 쑥갓을 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (96,'양념된장',8,1,'96.jpg','햇된장 12g, 고춧가루 1.7g, 다진 파 9g, 참기름 1.75g','된장에 고춧가루, 다진 파, 참기름을 넣어 양념된장을 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (97,'양배추롤',4,5,'97.png','현미(50g), 멥쌀(50g), 다시마(2g), 새우가루(15g), 양배추(50g) 얇게 썬 쇠고기(부채살, 80g), 송송 썬 붉은 고추(5g) 달래무침 달래(10g), 간장(10g), 참기름(5g)','현미와 쌀을 씻어 30분간 불린 뒤 물기를 빼고, 다시마를 우려낸 물(불린 쌀 동량)로 밥을 지어 식힌 후 새우가루를 넣어 섞는다.','양배추는 15~20분 정도 쪄서 준비한다.','얇게 저민 쇠고기를 팬에 올려 익힌다.','달래는 0.5㎝ 정도로 송송 썰어 간장, 참기름에 버무린다.','김발에 양배추, 고기, 밥 순서대로 올려 돌돌 말아 양배추롤을 만든다.','롤을 한입 크기로 썰어 담고 달래 무침을 얹은 뒤 송송 썬 붉은 고추를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (98,'콩고기샐러드',6,5,'98.png','콩고기(30g), 아보카도(10g), 바나나(10g), 가지(10g) 연근(10g), 방울토마토(10g), 만두피(20g), 저염간장(2.5g), 물(25g), 설탕(3g), 저염소금(1g), 식초(5g), 로즈마리(1g), 통후추(1g) 올리브유(15g), 꿀(5g)','콩고기를 15분~20분 정도 물에 불려 물기를 완전히 제거한 뒤 저염간장양념으로 버무려 볶는다.','아보카도, 바나나, 가지, 연근은 깍둑 썰고, 방울토마토는 반을 가른다.','팬에 식용유(5g)를 둘러가며 방울토마토, 가지, 연근을 각각 볶아 건진다.','만두피를 작은 체에 넣고 바구니 모양으로 만들어 튀긴다.','콩고기와 아보카도, 바나나, 방울토마토, 가지, 연근을 튀긴 만두피에 담은 뒤 허브오일드레싱을 곁들여 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (99,'바나나크림파스타',2,4,'99.png','바나나(150g), 아보카도(110g), 토마토(100g), 저염베이컨(46g, 3장) 바질가루(1g), 마늘(10g), 양파(20g), 휘핑크림(80g), 저염치즈(40g) 우유(200g), 소금(2g), 스파게티면(60g)','바나나를 반으로 잘라 반은 편 썰고 반은 으깨고, 아보카도는 껍질과 씨를 제거 한 후 1/3은 편 썰고 2/3는 으깬다.','토마토는 끓는 물에 데쳐 껍질을 제거하고 얇게 썬다.','베이컨 2장은 채 썰고, 1장은 구운 뒤 비슷한 크기로 채 썬다.','베이컨을 구운 기름에 편 썬 바나나, 아보카도, 토마토를 넣고 바질가루를 뿌려 굽는다.','팬에 채 썬 베이컨과 다진 마늘, 다진 양파를 볶은 후 휘핑크림, 저염치즈를 넣고 볶다가 으깬 아보카도, 바나나, 우유를 넣어 농도를 맞추고 소금으로 간해 바나나크림을 만든다.','접시에 구운 바나나, 아보카도, 토마토를 깔고 삶은 스파게티면을 담은 후 바나나크림을 뿌리고 베이컨을 올려 장식해 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (100,'닭갈비볶음면',2,5,'100.png','마늘(20g), 깻잎(2g), 쪽파(1g), 파프리카(60g), 양파(40g), 대파(10g) 방울토마토(50g), 닭가슴살(30g), 이태리시즈닝(1g), 라면(110g), 카레가루(2g), 고춧가루(1g), 고추장(10g), 참기름(2g)','마늘 5g은 다지고, 나머지 마늘(15g)은 편 썰어 노릇하게 튀긴다.','깻잎은 채 썰고, 쪽파는 송송 썰고, 파프리카는 주사위 모양으로 썰고, 양파와 대파는 채 썰고, 방울토마토는 반을 갈라 준비한다.','닭가슴살은 어슷하게 납작 썰어 이태리시즈닝에 재운 뒤 팬에 구워 준비한다.','다진 마늘, 양파, 대파를 팬에 넣고 향을 내다 파프리카와 방울토마토, 양념을 넣고 볶은 뒤 한 김 식혀 믹서에 곱게 갈아 소스를 만든다.',' 팬에 소스와 구운 닭가슴살을 넣어 볶다가 삶은 라면을 넣고 재빠르게 볶는다.','튀긴 마늘과 깻잎, 쪽파를 올려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (151,'로제소스라면',2,5,'151.png','새우(10g), 조개(20g), 홍합(20g), 새송이버섯(15g), 양파(8g) 토마토(100g), 라면(50g), 우유(200g), 생크림(100g), 월계수잎(5g) 정향(5g), 파르메산 치즈가루(5g), 파슬리가루(8g)','새우, 조개, 홍합은 손질한다.','버섯은 먹기 좋은 크기로 썰고, 양파는 채 썰고, 토마토는 씨를 제거해 다진다.','라면은 끓는 물에 데친 뒤 체에 밭쳐 물기를 제거한다.','냄비에 식용유(10g)를 두른 뒤 새우와 조개, 홍합을 넣어 살짝 볶아 건진다.','같은 냄비에 토마토, 우유, 생크림을 넣은 뒤 월계수잎과 정향을 넣고 끓인다.','끓으면 데친 라면, 새송이버섯, 홍합, 새우, 조개, 양파를 넣고 끓여 다 익으면 파르메산 치즈가루를 뿌린 후 그 위에 파슬리가루를 뿌려 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (152,'삼겹살라면',2,5,'152.png','라면(100g), 쪽파(3g), 돼지고기(삼겹살, 60g), 대파(20g), 얇게 썬 생강(5g), 가다랑어포(3g), 저염간장(3g), 맛술(8g), 흑설탕(3g)','돼지고기를 차가운 물로 헹구고 냄비에 물(300g), 대파, 생강과 같이 넣고 끓여 돼지고기가 익으면 면포에 거른다.','냄비에 물(300g)을 넣어 끓으면 가다랑어포를 넣고 1분간 끓이고 불을 꺼 가다랑어포가 가라앉으면 면포에 거르고, 다시 물(300g)을 넣어 면포에 걸러낸 가다랑어포를 넣어 약한 불로 10분간 끓인 뒤 가다랑어포가 가라앉으면 면포에 거른다.','돼지고기 육수와 가다랑어포 육수를 섞은 뒤 200g을 따로 덜어 조림양념을 넣고 끓이다가 돼지고기를 넣고 조린다.','라면은 삶아 찬물에 헹궈 건지고, 쪽파는 송송 썬다.','육수를 뜨겁게 끓인 뒤 그릇에 라면사리와 함께 담고, 돼지고기조림, 쪽파를 올리고 팬에 남은 조림 소스를 끼얹어 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (153,'유자샐러드라면',2,5,'153.png','라면(55g), 양상추(40g), 케일(5g), 파프리카(20g), 비타민(5g), 식초(2g), 레몬즙(5g), 유자청(15g), 올리브유(1g)','끓는 물(600g)에 라면을 넣어 데친다.','면은 찬물에 헹궈 물기를 뺀다.','양상추, 케일, 파프리카는 얇게 채 썰고, 비타민은 먹기 좋은 크기로 자른다.','유자드레싱을 고루 섞은 뒤 라면, 채소를 버무려 마무리한다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (154,'매실동치미',6,1,'154.png','무 50g, 연근 25g, 사과 25g, 배 30g, 함초소금 2g, 매실청 30g, 생강청 15g, 함초소금 1g, 청양고추 10g','무는 모양 틀로 자른다.','무와 연근을 손질해 놓은 후 소금에 살짝 절여준다.','사과와 배는 먹기 좋게 잘라 레몬즙에 뿌려 갈변을 막아준다.','물에 청양고추를 넣어 끓여서 식힌다.','식힌 물에 국물 재료를 넣어 국물을 만든다.','만들어진 국물에 절여진 무, 연근, 사과, 배를 넣어주어 완성한다. 24시간 이후부터 시원하게 먹는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (155,'조기까스',5,5,'155.png','조기 1마리(250g), 허브크러스트 100g, 흰 후추 1g, 화이트와인 15g, 마늘오일 15g, 전분 15g 소스 : 고추장 15g, 저염간장 15g, 화이트와인 15g, 버터 5g 다진양파 15g, 흰후추 1g, 마늘오일 15g','다진마늘을 버터에 충분히 볶아준다.','화이트와인을 뿌려주고 소스재료로 소스를 만들어준다.','찜기에 살짝 져 준다. 이때 80% 정도까지만 익혀준다.','쪄준 조기는 와인과 후추로 밑간을 해준 후 전분을 발라준다.','전분를 바른 조기에 허브크러스트를 두툼하게 올려준다.','팬에 기름을 두르고 조기를 한쪽부터 구운 뒤, 뒤집어서 다시 구워주고 소스를 뿌려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (156,'돼지머리수육맑은전골',3,1,'156.png','돼지머리 200g, 우동면 100g, 미나리 20g, 청고추 15g, 일본 된장 30g, 다진마늘 10g, 다진대파 10g, 청주 15g, 무 25g, 해물육수 300g, 청양고추 20g, 맛간장 15g','무, 청고추, 미나리, 대파는 먹기 좋게 썰어준다.','돼지머리는 냉수에 데친다. 냉수일 때부터 돼지머리를 넣어야 물이 끓어오르면 불순물이 제거된다.','일본 된장을 풀어 체에 걸러준다.','돼지머리를 살짝 졸여준다.','냄비에 국물을 끓여주다가 채소를 넣어 끓인다.','국물에 우동면을 데쳐낸 뒤 완성한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (157,'파인애플볶음밥',1,2,'157.png','밥 150g, 칵테일새우 50g, 파인애플 통조림 100g, 양파 60g, 청고추 15g 노란파프리카 20g, 빨간파프리카 20g, 마늘 15g, 계란 60g, 마늘기름 30g 흰후추 1g, 레몬소금 1g, 맛간장 15g, 통깨 10g','양파, 2가지색 파프리카, 청고추는 작은 깍두기 모양으로 잘라준다.','파인애플도 먹기 좋게 썰어준 뒤 레몬소금을 살짝 뿌려준다.','계란은 풀어서 팬에 스크램블을 만들어준다.','마늘을 다진 후 마늘기름으로 칵테일 새우를 볶아준다.','볶아진 칵테일새우에 잘라준 채소를 넣어 다시 볶아준다.','여기에 밥을 넣어서 볶아주고 파인애플과 맛간장, 통깨를 넣어서 볶아준다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (158,'코다리맑은찜',4,1,'158.png','코다리 250g, 콩나물 50g, 미나리 20g, 함초 25g, 무 30g, 함초소금 1g, 간편어간장 15g, 함초소금 1g, 생강청 15g, 흰후추 1g, 청주 15g 레몬즙 5g, 다진마늘 15g, 연겨자 7g, 통깨 10g','코다리는 어간장, 청주, 흰후추, 생강청에 살짝 재워준다.','함초는 손질해 잘라준다.','무는 소금에 살짝 절여서 수분과 염분을 제거해준다.','무와 함초를 고루 섞어준다.','미나리와 콩나물은 손질해준 후 찜기에 깔고 코다리를 쪄준다.','소스를 만든 뒤 채소를 깔고 코다리를 올리고 미나리, 콩나물을 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (159,'해물들깨탕',3,1,'159.png','주꾸미 80g, 전복 100g, 칵테일새우 50g, 양파 560g 청고추 17g, 홍고추 17g, 계란 60g, 청주 15g, 들깨가루 100g, 저염간장 15g, 다진마늘 15g, 다진대파 7g','주꾸미, 전복, 칵테일새우는 각각 물에 데쳐서 준비한다','이때 데치고 남은 물을 국물에 이용해주고 여기에 청주를 넣어준다.','양파, 청고추, 홍고추는 먹기좋게 썰어준다.','계란을 황백으로 부쳐서 먹기좋게 썰어준다.','만들어진 국물에 거피한 들깨가루와 국물재료를 넣어 끓여서 준비한다.','준비된 재료를 냄비에 넣고 국물을 부어 끓여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (160,'토마토젤리',7,6,'160.png','토마토(120g), 판젤라틴(10g), 레몬(10g), 올리고당(20g) 블루베리(20g), 설탕(20g)','판젤라틴을 얼음물에 담군 후 흐물흐물 해질 때까지 불려 둔다.','토마토는 물을 넣고 갈아 준비한다.','갈아 놓은 토마토에 올리고당과 레몬즙을 넣어 골고루 섞는다.','레몬즙을 넣은 토마토를 은근히 끓인다.','끓고 있는 토마토에 불린 젤라틴을 넣고 녹여주고, 젤라틴이 녹으면 불을 끄고, 접시에 담아 냉장고에 약 20분 정도 굳힌다.','팬에 설탕을 넣고 설탕이 녹으면, 블루베리를 넣어 은근히 졸여진 후 굳어진 토마토젤리 위에 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (161,'채소어묵',5,3,'161.png','생선살(100g), 맛술(10g), 생강(10g), 소금(0.2g) 밀가루(20g), 양파(20g),당근(20g), 샐러리(10g), 마늘(10g) 옥수수(20g), 어린이치즈(20g), 튀김기름(400g)','생선살은 가시를 발라내고 곱게 으깨어 놓는다.','으깬 생선살에 맛술 과 생강즙, 소금을 넣어 골고루 치댄다.','잘 치댄 생선살에 밀가루를 넣어 다시 치대어 준다.','양파와 당근, 샐러리, 마늘은 곱게 다지고, 옥수수는 알맹이를 준비한다.','생선살에 다진 채소와 어린이 치즈를 다져 섞는다.','채소를 다져 섞은 생선살을 동글동글 하게 완자를 빚어 튀김기름에 약 150℃ 온도에서 은근히 5분 정도 튀겨 완성 한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (162,'오렌지삼겹찜',4,5,'162.png','삼겹살(100g), 로즈마리(5g) 고구마(30g), 생크림(10g), 감자(20g), 튀김기름(200g) 브로컬리(30g), 올리브오일(10g), 오렌지(50g), 설탕(10g), 정종(10g), 저염소금(5g) 와사비(5g)','삼겹살은 로즈마리를 뿌려 숙성시킨다.','고구마는 삶아 준비하고, 감자는 웨지 감자형으로 썰어 익힌 후 기름에 튀겨 놓는다.','삶아진 고구마를 으깨어 생크림을 넣어 골고루 섞는다.','오렌지는 즙을 짜 놓는다.','숙성된 삼겹살은 오븐에 굽고, 브로컬리는 살짝 데쳐 올리브오일에 볶아놓는다.','팬에 오렌지즙과 설탕, 정종, 소금을 넣고 바글바글 졸인 후 와사비를 넣어 소스를 만들고, 오븐에 구어진 삼겹살을 잘라 접시에 담고 그 위에 소스를 살짝 올리고, 한쪽에는 감자튀김(2번), 고구마무스(3번), 브로컬리(5번)를 곁들여 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (163,'오렌지소스',8,1,'162.png','오렌지(50g), 설탕(10g), 정종(10g), 저염소금(5g) 와사비(5g)','팬에 오렌지즙과 설탕, 정종, 소금을 넣고 바글바글 졸인 후 와사비를 넣어 소스를 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (164,'삼색딤섬',4,2,'164.png','밀가루(200g), 백년초가루(20g), 뽕잎가루(20g) 치자가루(10g), 미나리(20g), 두부(30g), 오징어(30g) 다진 소고기(60g), 양파(20g), 부추(30g), 숙주(30g) 대파(10g), 마늘(10g), 참기름(10g), 후춧가루(0.05g) 통깨(5g)',' 밀가루를 세등분하여 각각 백년초, 뽕잎, 치자 가루를 넣고 물을 넣고 반죽을 한 뒤 비닐봉투에 넣어 숙성을 시킨다.','두부는 소창에 물기를 짜고, 양파, 파, 마늘은 다지고, 부추는 송송 썰어 준비 하고, 숙주는 뜨거운 물에 데쳐 곱게 다진다.','오징어는 껍질을 벗겨 입자있게 다져 놓는다.','다진고기에 준비한 두부와 양파, 파, 마늘, 부추, 숙주(2)와 오징어(3)를 넣어 섞은 후 참기름과 후춧가루, 통깨를 넣어 딤섬 속을 만든다.','숙성된 밀가루 반죽을 꺼내 밀대를 이용하여 넓게 밀어 준다.','밀어 놓은 반죽을 사각으로 자른 후 그 안에 딤섬 속을 넣어 미나리를 데쳐 끈을 만들어 딤섬 위쪽을 묶은 후 찜통에서 김이 오르면 약 10분 정도 쪄서 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (165,'밥크로켓',5,3,'165.png','양파(20g), 대파(10g), 당근(20g), 마늘(10g) 식용유(10g), 메추리알(100g), 밥(100g), 소금(0.5g) 밀가루(20g), 녹말가루(10g), 달걀(50g), 빵가루(20g) 튀김기름(400g), 칠리소스(50g)','양파와 대파, 당근, 마늘은 입자있게 다져 준비한다.','팬에 기름을 두르고, 팬이 따끈해 지면 준비한 채소(①)를 넣어 재빠르게 볶아 식힌다.','메추리알은 찬물에 넣어 소금을 넣고 약 5분 정도 삶아 건져 찬물에 헹구어 껍질을 제거시켜 놓는다.','준비한 밥에 볶아 놓은 채소와 소금을 넣어 골고루 섞은 후 준비한 메추리알을 감싸 준다.','밥으로 감싼 메추리알을 밀가루와 녹말을 섞어 그 위에 굴리고, 다시 달걀물에 굴린 후 빵가루를 입혀준다.','튀김 기름이 약 170℃ 정도 되면, 만들어 놓은 메추리알을 넣어 골고루 색이 나도록 튀겨 완성하고, 칠리소소와 함께 제공한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (166,'가지토마토구이',4,5,'166.png','가지(80g), 올리브오일(10g), 소금(0.5g), 토마토(40g) 모짜렐라치즈(30g), 토마토소스(20g), 토마토(40g), 팽이버섯(20g), 후춧가루(0.02g)','가지는 약 10cm 길이로 길고, 납작하게 썰어 준비한다.','팬에 올리브 오일을 살짝 둘러 썰어놓은 가지를 소금을 넣고 살짝 익힌다.','토마토는 반은 토마토 형태로 납작하게 썰어 놓는다.','토마토반은 입자있게 다져 준비한다.','다진 토마토를 준비한 토마토소스에 섞어 살짝 어우러지게 끓여 준비한다.','구운 가지위에 토마토와 모짜렐라치즈를 올려 팬에 굽고, 별도로 팽이버섯에 후춧가루를 뿌려 살짝 구워 접시에 담고, 끓여 놓은 토마토소스를 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (167,'함박스테이크',4,4,'167.png','다진소고기(120g), 다진돼지고기(120g), 양파(20g) 마늘(10g), 소금(0.3g), 후춧가루(0.02g), 달걀(20g) 녹말가루(5g), 빵가루(10g), 깻잎(5g), 올리브오일(10g) 메추리알(50g), 마른고추(5g), 대파, 마늘, 와인(20g), 저염간장(20g) 올리고당(20g), 설탕(10g) 토마토(20g)','마늘과 양파는 입자있게 다져 볶아서 준비한다.','다진 소고기와 돼지고기에 볶아놓은 마늘과 양파를 넣고, 소금과 후춧가루, 달걀물, 빵가루, 녹말가루를 넣어 골고루 치대어 숙성시킨다.','깻잎은 곱게 채를 썰어 찬물에 담그어 놓아, 싱싱해 지면 건져 숙성된 고기에 넣는다.','깻잎을 넣은 고기를 지름 4cm 크기의 함박스테이크 형태를 만들어 팬에 올리브오일을 넣고 익힌다.','냄비에 마른고추와 대파, 마늘, 와인, 간장, 올리고당, 설탕을 넣어 끓이다가, 남은 토마토를 곱게 다져넣고, 은근히 졸인 뒤, 채에 걸러 놓는다.','토마토는 원형을 살려 슬라이스하여 접시에 깔아준 뒤 익힌 함박스테이를 얹고 메추리알은 한 개씩 반숙 지단을 부쳐 익힌 함박스테이크 위에 올린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (168,'냉파스타',2,4,'168.png','스파게티(100g), 올리브오일(10g), 소고기(50g) 저염간장(10g), 설탕(10g), 마늘(10g), 깻잎(10g) 양파(20g), 파프리카(20g), 육수(400g), 설탕(10g) 식초(10g), 저염간장(10g)','스파게티는 약 10분 정도 삶아 건져 찬물에 헹궈 물기를 빼고 올리브오일을 발라 준비한다.','소고기는 넓게 편으로 펴서 간장, 설탕, 마늘을 넣어 양념을 한다.','양념된 소고기를 팬에 구워 냅킨위에 올려 기름을 빼놓는다.','깻잎과 양파, 파프리카는 길게 채를 썰어 준비한다.','팬에 기름을 넣고 팬이 뜨거울 때 양파를 넣어 재빠르게 볶아낸다.','준비한 육수에 설탕과 식초, 저염간장을 넣어 차갑게 냉장보관하고, 그릇에 스파게티를 담고, 그 위에 볶은 양파와 깻잎, 파프리카와 구운 고기를 올린 후 차가운 육수를 부어 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (169,'과일겉절이',7,6,'169.png','사과(50g), 배(30g), 설탕(10g), 바나나(50g), 키위(30g) 파인애플(30g), 마(50g), 마늘(10g), 식용유(5g), 고춧가루(20g), 식초(10g) 저염간장(5g), 설탕(10g)','사과와 배는 껍질을 베이킹파우더에 깨끗이 씻어 납작하게 썰어 설탕물에 담그어 색이 변하지 않게 준비한다.','바나나는 동글하게 썰고, 키위는 껍질을 제거하고 은행잎 모양으로 썰고, 파인애플은 가운데 심을 제거하고 사각형 모양으로 썰어놓는다.','마는 껍질을 벗겨 동글하게 썰어 준비 한다.','마늘은 입자있게 다져, 팬에 식용유를 두르고 살짝 볶는다.','고춧가루에 볶은 마늘(4), 식초. 설탕, 간장, 고춧가루를 넣고, 골고루 섞어 양념장을 만든다.','설탕물에 사과와 배를 건지고, 준비한 과일과 마를 담은 후 먹기 직전에 만들어 놓은 양념장을 넣어 버무려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (170,'인삼갈비탕',3,1,'170.png','소고기(갈비, 300g), 인삼(2뿌리), 당면(50g), 표고버섯(1개), 달걀(1개), 대추(3알), 양파(50g), 파(30g), 마늘(30g), 설탕(10g), 저염간장(20g)','갈비는 찬물에 담궈 핏물을 뺀다.','끓은 물에 갈비를 데친다.','찬물에 표고버섯, 파, 마늘, 양파 및 인삼을 넣고 데친 갈비를 넣고 약 2시간 정도 끓여 갈비탕을 만든다.','저염간장에 설탕을 섞어 고기소스를 만든다.','당면은 뜨거운 물에 불려 갈비탕을 먹기 직전에 넣는다.','달걀은 황백으로 나눠 지단을 부쳐 완성된 갈비탕 위에 대추와 함께 올려 완성한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (171,'체리젤리를 곁들인 고구마무스',8,5,'171.png','체리(50g), 고구마(150g), 화이트 초콜릿(50g), 판젤라틴(1장), 피스타치오(20g), 헤이즐넛(20g), 캐슈넛(20g), 호두(20g), 아몬드(20g), 라즈베리(20g), 건포도(20g), 애플민트(2g)','고구마는 깨끗이 씻어 찜통에 쪄낸다','뜨거운 고구마는 식기 전에 으깬다.','화이트 초콜릿은 중탕으로 녹여 으깬 고구마와 섞는다','체리는 믹서에 곱게 간다.','젤라틴은 물에 불려 중탕으로 녹이고 갈아 놓은 체리에 섞어 굳힌다','견과류와 라즈베리, 건포도는 다져서 굳힌 체리젤리에 뿌리고 고구마 무스를 젤리 주위에 두르고 애플민트를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (172,'세 가지곡물콩라미수',9,5,'172.png','미숫가루(50g), 통조림콩(20g), 검은콩(20g), 바나나(1개), 흑임자(5g), 달걀(1개), 우유(200g), 애플민트(10g), 버터(20g), 설탕(10g)','미숫가루는 설탕을 넣고 체에 한 번 거른다.','달걀노른자에 설탕을 넣고 중탕으로 익힌다.','버터는 중탕으로 녹이고 검은콩은 불린 뒤 삶아 통조림콩, 버터와 함께 간다.','바나나는 곱게 으깨고 흑임자는 곱게 간다.','우유는 냄비에 넣고 따끈하게 데운다.','데워진 우유에 미숫가루와 모든 재료를 골고루 섞는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (173,'크림치즈 망고무스',8,5,'173.png','망고퓨레(50g), 라즈베리(10g), 피스타치오(30g), 크림치즈(50g), 요거트(50g), 생크림(50g), 판젤라틴(1장), 레몬(1/4개), 애플민트(10g), 설탕(20g)','냄비에 망고퓨레, 레몬, 설탕을 넣고 은근히 끓인다.','젤라틴은 찬물에 불린 뒤 중탕으로 녹여 망고퓨레에 넣고 틀에 굳힌다.','생크림은 차갑게 휘핑하여 요거트와 섞는다.','생크림을 섞은 요거트에 설탕, 크림치즈를 섞는다','냄비에 라즈베리, 설탕을 넣고 은근히 끓인다.','접시에 굳힌 망고무스에 담고 그 위에 라즈베리 소스와 크림치즈 소스, 다진 파스타치오를 올리고 애플민트로 장식한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (174,'토마토주스를곁들인컵토마토',7,6,'174.png','줄기토마토(3개), 토마토(100g), 오이(50g), 양파(30g), 올리브오일(10g), 설탕(30g)','토마토는 끓는 물에 살짝 데친다.','데친 토마토를 믹서에 곱게 갈고 설탕을 넣고 섞는다.','줄기토마토는 윗부분을 잘라내고 속을 파낸다.','오이와 양파는 입자있게 썬다.','팬에 올리브오일을 두르고 썰어 놓은 오이와 양파를 살짝 볶는다.','속을 파낸 줄기토마토에 볶아 놓은 야채와 5번을 넣는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (175,'인절미 무스와 수정과 아이스크림',7,5,'175.png','홍시(1개), 콩가루(20g), 계피(10g), 생강(20g), 호두(10g), 곶감(2개), 자몽(1/6개), 판젤라틴(1장)','곶감은 씨를 발라낸다.','생강과 계피를 넣고 끓여 수정과를 만든 뒤 냉동한다.','홍시는 믹서로 곱게 갈고 틀어 넣어 굳힌다.','생크림은 차갑게 휘핑한다.','불려 놓은 젤라틴을 굳혀 콩가루를 섞어 인절미를 만든다','자몽을 껍질을 제거 후 갈아서 젤리를 만들고, 접시에 굳혀놓은 홍시와 아이스 수정과를 담는다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (176,'겨자아욱쌈밥',1,1,'176.png','현미(200g), 두부(100g), 아욱(100g), 날치알(50g), 단호박(1/6개), 새싹(20g), 된장(20g), 생크림(20g), 매실청(20g), 참기름(5g)','현미는 깨끗이 씻어 30분 이상 충분히 불린 뒤 밥을 짓는다','두부는 끓는 물에 데쳐 물기를 빼고 곱게 다져 된장, 생크림, 매실청을 넣고 골고루 섞는다.','데친 두부에 된장, 생크림 및 매실청을 골고루 섞는다.','아욱과 단호박은 각각 찐 후 식힌다.','찐 아욱 위에 현미밥을 올리고 두부소스, 날치알, 새싹 단호박을 올린다.','아욱에 올린 밥을 동그랗게 말아 접시에 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (177,'마늘드레싱',8,1,'177.png','사과식초 30g(2큰술), 설탕 15g(1큰술), 물 50ml(1/4컵), 다진 마늘 5g(1작은술)',' 그릇에 다진 마늘, 사과식초, 설탕, 물을 섞어 설탕이 녹을 때까지 저 어 드레싱을 만든다.',null,null,null,null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (178,'두부곤약조림',4,1,'178.png','곤약(100g), 두부(100g), 가지(20g), 애호박(20g), 꽈리고추(15g), 감자전분(6g), 저염간장(3g), 물(165g), 다진 마늘(2g) 유자청(10g), 고추기름(10g)','곤약과 두부는 사방 1㎝ 크기로 깍둑 썰고, 가지와 애호박은 조금 더 작은 크기로 썰고, 꽈리고추는 얇게 송송 썬다.','곤약을 끓는 물에 식초를 한두 방울 떨어뜨린 후 삶아 냄새를 제거한 후 찬물에 식힌다.','올리브유(10g)를 두른 팬에 두부를 올려 살짝 굽는다.','팬에 조림장을 넣은 후 약한 불에서 저어가며 끓이다가 조림장이 고루 섞이면 곤약과 두부, 가지, 애호박을 모두 넣고 조린다.','조림장이 반 이상 졸아들면 꽈리고추를 넣고 조금 더 조려 마무리한다.',null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (179,'양지해장국',3,1,'179.png','쇠고기육수(30g) 느타리버섯(10g), 애호박(20g), 청양고추(1g) 대파(10g), 방울토마토(80g), 콩나물(50g), 다진 마늘(8g), 저염국간장(2.5g), 소금(0.5g)','육수를 끓인 양지는 건져 얇게 썬다.','버섯은 잘게 찢고, 애호박은 반달모양으로 납작 썰고, 고추와 대파는 어슷하게 썬다.','방울토마토에 열십자로 칼집을 넣고 끓는 물에 데쳐 껍질을 벗긴다.','냄비에 식용유(10g)를 두른 뒤 다진 마늘을 넣고 볶아 향을 낸 뒤 방울토마토를 넣고 볶는다.','육수(300g), 콩나물, 쇠고기, 느타리버섯, 애호박을 넣고 국간장과 소금으로 간해 끓인다.','어슷 썬 청양고추와 대파를 넣어 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (180,'레몬들깨 소스를 품은 떡꼬치',7,6,'180.png','떡꼬치 쌀떡 90g, 호두 10g(1알), 잣 5g(5알), 식용유 30g(2큰술), 꼬치용 꼬치 6개, 들깨가루 45g(3큰술), 두유 45g(3큰술), 꿀 15g(1큰술), 물 15ml(1큰술), 참기름 7g(1과1/3작은술), 레몬즙 7g(1과1/3작은술), 검은깨 5g(1작은술)','들깨가루, 검은깨, 두유, 레몬즙, 꿀, 물, 참기름을 섞어 레몬들깨 소스를 만든다.','떡은 튀기다가 떡이 터지면서 기름이 튈 수 있으므로 팬에 기름을 두르듯이 넣고 160도 정도에서 노릇노릇하게 굽는다.','꼭지를 뗀 잣과 호두는 굵게 다진다.','떡은 꼬치에 꽂아 접시에 담고 레몬 들깨소스를 바르고 잣, 호두를 고명으로 뿌려준다.',null,null,null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (181,'삼색매작과와 수정과겔',7,6,'181.png','밀가루 100g(1/2컵), 빨강 파프리카 40g(1/3개), 노랑 파프리카 40g(1/3개), 청 파프리카 40g(1/3개), 식용유 300g(1½컵), 홍초 75g(5큰술), 설탕 75g(5큰술), 대추 10개, 계피 20g(10cm), 생강 20g(3×2cm), 물 400ml(2컵), 황설탕 10g(2작은술), 알긴산 5g(1작은술), 염화칼슘 5g(1작은술)','홍초와 설탕을 중간 불에서 서서히 끓여 홍초 시럽을 만든다.','빨강 파프리카, 노랑 파프리카, 청파프리카를 각각 갈아 면보에 짜서 삼색 파프리카즙을 낸다.','밀가루를 체에 친 다음 4등분으로 나눈 후 밀가루, 3종류의 파프리카 즙을 이용해 총 4종류의 반죽을 만들고 밀봉하여 30분 정도 숙성 시켜 준비한다.','반죽은 밀대로 0.2cm 두께로 밀어 칼로 5×2cm 길이로 잘라 중심에 칼집을 세군데(川 내천자) 넣은 후 칼집 가운데 부분으로 한쪽 끝을 뒤집어 모양을 잡는다.','튀김팬에 식용유를 150도로 하여 바삭하게 튀긴다','튀긴 매작과를 홍초 시럽(1)에 버무려 준다.','생강은 껍질을 벗기고 물기를 제거한 후 얇게 저민다','냄비에 생강과 물 2컵을 넣고 약한불에서 30분 정도 정도 끓이다가 생강을 건진 후 준비한 계피, 대추를 넣고 30분 정도 더 끓인 후 고 운체에 거른다','수정과 물(8)에 황설탕, 알긴산을 넣고 잘 녹도록 다시 끓이면 걸쭉 해진다.','냄비에 물 500ml를 준비한 후 염화칼슘을 풀어 수용액을 만든다. 염화칼슘수용액에 수정과겔(9)을 스포이드나 숟가락으로 떨어 뜨려넣고 모양을 잡아주고 접시에 매작과와 수정과겔을 담고 홍초 시럽을 뿌린다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (182,'고구마 석류 과편',7,6,'182.png','고구마 200g(2개), 전분 30g(2큰술), 설탕 300g(1과1/2컵), 석류 200g(1/5개), 물 600ml(3컵)','구마는 깨끗이 씻어서 찜기에 고구마를 넣고 (작은 고구마 15~20분, 중간 고구마 30분, 큰고구마 40~45분정도) 찐다','다 익은 고구마는 껍질을 벗기고 고구마 둥근 모양을 살려 1.5cm로 자르고 고구마 속을 몰드나 숟가락으로 동그랗게 판다.','석류는 껍질을 벗겨 석류알만 준비한 후 물 3컵을 넣어 2컵 정도 나올 때까지 은근히 졸인다.','졸인 석류물에 설탕을 넣고 섞는다.','소스 팬에 석류물(4)을 끓이면서 전분을 조금씩 넣는다.','석류물이 끓어 거품이 생기면 숟가락으로 떠서 고구마 안에 넣고 굳힌다.','접시에 고구마 석류과편을 담고 석류를 곁들인다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (183,'고구마와 단호박 맛탕',7,1,'183.png','고구마 30g(1/5개), 단호박 30g(4ⅹ6cm), 옥수수유 200g(1컵), 설탕 15g(1큰술), 꿀 15g(1큰술), 물 5ml(1작은술), 검은깨 약간','고구마는 깨끗이 씻어서 한입 크기 정도로 잘라 타원형추 모양으로 다듬은 뒤 물에 헹궈 녹말을 빼주고 물기를 제거한다.','단호박은 씻어서 자르고 씨를 빼고 한입 크기 정도로 잘라 타원형 추 모양으로 다듬어 물기를 제거한다.','소스 팬에 설탕, 꿀, 물을 넣고 젓지 않은 상태로 약한 불에서 서서히 끓여 졸인다','시럽의 농도는 흐르는 정도, 색깔은 캐러멜색 정도로 만들고 검은깨를 넣는다.','튀김팬에 옥수수유를 붓고 고구마와 단호박을 180도 정도에서 노릇하게 튀긴다','단호박과 고구마 튀김은 뜨거울때 시럽에 버무린다','남은 시럽을 숟가락에 묻혀 들어올려 실이 생기게 한 다음 숟가락을 아래 위로 돌려가며 실을 감듯이 하여 볼을 만들어 곁들인다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (184,'키위 팬케이크',7,4,'184.png','핫케이크가루 200g(1컵), 우유 100ml(1/2컵), 달걀 50g(1개), 키위 60g(1개), 땅콩 10g(5알), 식용유 약간','우유에 달걀을 풀고 핫케이크가루를 넣어 저어준다','땅콩을 곱게 다져 반은 반죽에 섞고, 반은 곁들임으로 남긴다.','키위는 씻어서 껍질을 벗기고 0.7cm 정도로 둥글게 썬다','달군 프라이팬에 식용유를 두르고키친 타올로 살짝 닦아 낸다.','반죽을 약한 불에서 3분 정도 익히고 기포가 보글보글 생기면 뒤집어서 2분 정도 굽는다','팬케이크 위에 키위를 얹고 팬케이크로 덮어 접시에 담고 남은 땅콩가루를 뿌린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (185,'허니레몬 그린티 푸딩',7,4,'185.png','녹차티백 2개, 물 200ml(1컵), 꿀 50g(3⅓큰술), 레몬(1개), 설탕 30g(2큰술), 생강 8g(2×2cm), 한천 6g, 블루베리잼 15g(1큰술), 허브 약간','깨끗이 씻은 레몬은 반으로 잘라 레몬즙을 짠다.','생강은 껍질을 벗기고 씻어 강판에 갈은 후 즙을 짠다.','한천은 잠길 정도로 찬물에 불려놓는다','70도의 물에 녹차티백을 넣고 향을 우려낸다','불린 한천을 건져 녹차 우려낸 물에 넣어 잘 풀어주고 꿀과 설탕이 녹게 저은 후 레몬즙과 생강즙을 넣고 잘 섞는다','나중에 꺼내기 좋게 틀이나 볼에물을 뿌린 후 혼합물(5)을 붓고 한김 식으면 냉장고에서 1~2시간 정도 굳힌다.','틀에서 분리하여 접시에 담고, 푸딩위에 블루베리 잼과 허브로 장식한다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (186,'더덕생채를 곁들인 삼겹살 찜',4,1,'186.png','삼겹살 300g, 베이비채소 200g(1팩), 양파 70g(1/2개), 마늘 25g(5개), 사과 20g(1/10개), 버터 15g(1큰술), 청주 15g(1큰술), 식용유 10g(2작은술), 더덕 200g(3개), 소금 2g(1/2작은술), 배 50g(1/5개), 잣 15g(75개), 식초 2g(1/2작은술), 설탕 2g(1/2작은술), 대파 20g(1개)','더덕은 껍질을 벗겨 방망이로 두드려 찢고, 소금을 뿌려 쓴맛을 제거한다.','배, 잣, 식초, 설탕을 믹서에 갈아 소스를 만든 후, 일부를 더덕에 버무 린다.','남은 소스에 파를 넣어 믹서에 갈아 가열된 팬에 볶아 파 소스를 만든다','마늘, 양파, 사과는 다진다.','가열된 팬에 기름을 두른 후 삼겹살을 겉면만 익힌다.','삼겹살을 꺼낸 팬에 버터를 넣고 다진 마늘, 양파, 사과와 함께 볶는다.','6에 겉면을 익힌 삼겹살을 넣고, 청주와 물을 넣어 익힌다.','삼겹살을 썰고 베이비채소, 더덕생채를 곁들인 후 파 소스를 뿌려 완성한다.',null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (187,'타르타르 소스를 곁들인 라이스버거',1,5,'187.png',' 현미밥 300g, 쇠고기(앞다리살) 150g, 양상추 100g(1개), 두부 150g(1/2개), 멸치가루 10g(2작은술), 달걀 30g(1/2개), 양송이버섯 30g(1개), 빵가루 50g(1/4컵), 식용유 20g(1큰술), 토마토 200g(1개), 양파 40g(1/4개), 단호박 150g(1/3개), 달걀 60g(1개), 양파 30g(1/5개), 레몬즙 10g(2작은술), 마요네즈 30g(2큰술)','달걀을 삶아 노른자는 체에 거른다. 흰자와 양파는 다져 마요네즈와 레몬 즙을 넣고 섞어 타르타르소스를 만든다.','현미밥에 멸치가루를 넣고 섞은 후 빵가루를 묻혀 동그랗게 모양을 잡아 기름에 굽는다.','양파는 링으로 썰고 나머지는 다져서 볶고, 두부는 물기를 짜서 으깬다','소고기와 멸치가루와 달걀물, 빵가루, 다진 양송이버섯, 양파, 두부를 넣 고 치댄다','치댄 반죽을 동그란 모양으로 빚어 가열된 팬에 익힌다','단호박은 삶아 으깬다','밥 위에 양상추를 깔고 고기를 얹은 뒤 소스를 뿌린 다음 토마토, 양파, 단호박과 밥을 올려 완성한다',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (188,'새우단배추된장국',3,1,'188.png','마늘(0.3g), 양파(10g), 애호박(20g), 단배추(25g), 대파(5g) 두부(25g), 마른 새우(10g) 육수 무(15g), 멸치(2.5g), 다시마(2.5g), 물(300g), 된장(10g), 표고버섯가루(3g), 날콩가루(10g)','냄비에 육수 재료를 넣고 10분간 끓여 건진다.','마늘은 다지고, 양파는 채 썰고, 애호박은 반달모양으로 납작하게 썬다.','단배추는 5cm로 썰고, 대파는 어슷 썰고, 두부는 0.5cm 두께로 썬다.','된장에 표고버섯가루, 날콩가루, 육수(50g)를 넣어 섞는다.','육수에 된장을 풀고 다진 마늘, 호박, 양파, 단배추 순으로 넣어가며 끓인다.','끓으면 마른 새우, 대파를 넣어 살짝 더 끓여 마무리한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (189,'단호박 생선탕수',5,2,'189.jpg','동태살 120g, 단호박 10g, 당근 15g, 오이 15g, 양파 15g, 전분 30g, 계란 110g, 튀김가루 10g, 목이버섯 3g, 식초 15g, 키위소스 20g','따뜻한 물에 부린 목이버섯, 동태살, 당근, 오이, 양파를 먹기 좋은 크기로 썬다.','동태살에 소금과 흰후추로 밑간을 하고 녹말과 계란 흰자를 섞어 튀김옷을 만든다.','동태살에 튀김옷을 입혀 기름에 튀긴다.','물, 계란, 튀김가루를 섞어 튀김옷을 만든 뒤 단호박을 튀긴다.','프라이팬에 기름을 두르고 당근, 양파, 목이버섯을 볶는다','5에 키위소스, 식초를 넣고 전분물을 넣어 농도를 맞춘 뒤 튀긴 재료와 오이를 섞는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (190,'미역 미소국',3,3,'190.jpg','미소된장 3.5g, 건미역 2g, 가츠오부시 0.3g, 미향 0.3g','건미역을 물에 불린다.','불린 미역을 잘게 다진다.','냄비에 분량의 물을 넣고 가츠오부시를 우린다.','우려낸 육수에 미소된장을 푼다.','4에 미역을 넣고 한소끔 끓인다.','미향을 넣어 마무리 한다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (191,'차가운 당근 수프',3,4,'191.jpg','당근 80g, 버터 2g, 양파다진것 10g, 생강다진것 1g, 마늘다진것 2g, 야채육수 50g, 오렌지주스 20g, 생크림 5g, 당근주스 30g, 소금적당량','버터를 녹인 냄비에 양파, 생강, 마늘 다진 것을 넣고 양파가 반투명해 질 때까지 볶는다.','1에 얇게 썬 당근을 넣고 볶는다.','2에 야채육수, 오렌지주스를 넣고 당근이 익을 때까지 끓인다','믹서에 3을 넣고 갈아준 뒤 차갑게 한다.','제공하기 직전에 크림을 넣어 섞은 뒤 당근주스를 넣는다.','소금, 후추로 마지막 간을 하고 차가운 볼에 담는다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (192,'이태리식 해산물 샐러드',6,4,'192.jpg','새우 25g, 관자 20g, 오징어 40g, 양파다진것 5g, 파슬리다진것 2g, 마늘다진것 3g, 블랙올리브 5g, 올리브오일 3g, 케이퍼 3g, 레몬주스 4g, 후추적당량, 소금적당량, 양상추 40g"','새우는 껍질을 벗기고 내장을 제거한 뒤 뜨거운 물에 데쳐 찬물에 식힌다.','관자, 오징어는 깨끗하게 손질하고 한입 크기로 자른다.','양파, 파슬리, 마늘을 다지고, 블랙 올리브는 입자가 보이도록 자른다.','기름 두른 팬에 양파를 넣어 볶은 뒤 관자, 오징어를 넣어 볶는다.','데친 새우를 넣어 살짝 볶아준 뒤 볼에 옮겨 담는다.','볼에 올리브, 케이퍼, 파슬리, 마늘, 레몬주스, 올리브오일을 넣고 소금, 후추로 간을 한다.','접시에 양상추와 함께 담아낸다.',null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (193,'봄주먹밥',1,1,'193.png','봄동 10g, 깻잎 6g, 낙지다리 6g, 참기름 3g 두릎 8g, 올리브유 4g, 미나리 3g, 데친꼬막살 12g, 올리브유 4g, 밥 100g, 참깨 3g, 참기름 10g, 다진양파 14g, 다진당근 14g, 다진애호박 14g, 물 150g, 된장 14g, 고춧가루 4g, 다진마늘 4g, 붉은고추 4g','봄동과 깻잎은 데친 뒤 체에 밭쳐 물기를 제거한다.','데친 꼬막살은 물기를 제거하고 다져 올리브유로 양념한 밥에 참께와 함께 버무린 후 한입 크기로 주먹밥을 만든다.','낙지 다리는 데처 찬물에 담가 식힌 뒤 참기름(3g)에 양념하고, 두릅은 데쳐 물기를 제거한 뒤 올리브유로 양념한다.','봄동에 꼬막밥을 넣고 만 뒤 껫잎으로 싸고 데친 미나리로 묶어 봄주먹밥을 만든다.','냄비에 참기름을 두르고 양파, 당근, 애호박을 볶은 뒤 물, 된장, 고춧가루, 다진마늘, 붉은고추, 청양고추, 두부를 넣고 조려 두부강된장을 만든다.','봄주먹밥에 낙지와 두릅, 두부강된장을 곁들여 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (194,'효종갱',3,1,'194.jpg','배추(20g), 무(10g), 느타리버섯(20g), 쇠고기(양지 50g, 갈비 50g), 양파(40g), 마늘(10g), 물(300g), 저염간장(10g)','소고기는 핏물을 제거한 뒤 양파, 마늘을 넣고 물(300g)을 부어 1시간 이상 끓인 뒤 면포에 걸러 육수를 만든다.','삶은 소고기는 건져내 결 반대 방향으로 썬다.','배추, 무, 느타리버섯, 표고버섯은 먹기 좋은 크기로 썬다.','전복은 깨끗이 손질한다.','육수를 끓인 뒤 끓어오르면 무를 넣어 반투명해지면 배추, 버섯, 전복을 넣는다.','전복이 익으면 소고기를 넣고 저염간장으로 간을 해 마무리한다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (195,'갯벌의 여왕 모시조개의 달콤한 유혹',4,1,'195.jpg','모시조개 200g(30개), 양파 15g(2*4cm), 마늘 10g(2쪽), 마른 홍고추 1g(1/5개), 올리브유 15g(1큰술), 화이트와인 15ml(1큰술), 쳥양고추 3g(1/3개), 저염치즈 10g(2작은술), 후추 약간, 바질 약간','양파는 잘게 썰고 청양고추는 어슷썰기를 한다.','마늘은 편으로 썰고 마른 홍고추도 둥글게 썰어 준비한다.','조개는 흐르는 물에 여러 번 씻어 해감을 시킨 후 물기를 제거한다.",','달궈진 팬에 올리브오일을 두르고 마늘, 마른홍고추, 양파를 넣어 볶아 향을 낸 후, 센불로 불을 키우고 모시조개를 넣는다.','조개가 입을 벌리면 바질과 화이트와인을 넣어 잡내를 없앤다','한소끔 끓여낸 후 붕간 불로 줄이고 저염치즈, 청양고추, 후추를 넣어 칼칼한 맛을 낸다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (196,'궁중 떡볶음',5,1,'196.jpg','떡볶이용 떡 50g, 청피망 8g, 홍피망 5g, 표고버섯 25g, 쇠고기 13g, 숙주 10g 참기름 1g, 간장 2g, 설탕 1g, 마늘 0.5g, 대파 5g, 샐러리 3g, 양파 13g, 홍고추(마른것) 3g, 생강 5g, 물엿 5g, 녹말가루 1.3g','끓는물에 채소들을 넣고 1/3가량 부피가 줄어들면 건져내 채로 거른다.','피망과 버섯은 채 썰고, 고기는 곱게 다져서 양념한다.','숙주는 머리와 꼬리를 뗀다','팬에 고기를 볶다가 떡과 피망, 버섯, 숙주를 넣고 재빨리 볶아낸 후 참기름을 살짝 뿌린다.',' 양념장 재료를 섞어 끓이면서 녹말물을 넣고 농도를 맞춘다.','볶은 재료를 담고 양념장을 뿌린다.',' 피망과 버섯은 채 썰고, 고기는 곱게 다져서 양념한다.','숙주는 머리와 꼬리를 떼어둔다.|팬에 고기를 볶다가 떡과 피망, 숙주를 넣고 재빨리 볶아낸 후 참기름으로 마무리한다.',' 1의 양념장에 녹말물을 넣고 농도를 맞춘다.','볶은 재료를 담고 양념장을 뿌린다.');
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (197,'태국식 불고기 샐러드',6,6,'197.jpg','쇠고기 30g, 애호박 20g, 토마토 25g, 가지 15g, 양파 8g, 새송이버섯 15g, 그린 샐러드적당량, 풋고추 3g, 홍고추 3g, 마늘 1g, 고춧가루 1g, 레몬주스 3g, 타바스코 1g,올리브오일 1g, 로즈마리 1g, 민트 1g, 카레가루 2g','양파, 당근, 셀러리, 무 등의 야채와 월계수잎, 타임등을 넣고 야채육수를 끓인다.','소고기는 불고기용으로 손질하여 소금, 후추로 밑간한다.','애호박, 토마토, 가지, 양파, 새송이버섯을 채 썬 뒤 볶는다.','밑간해 둔 소고기를 굽는다.','접시에 밥을 깔고 그 위에 그린샐러드를 올린 뒤 익혀놓은 고기와 볶아놓은 야채들을 올린다.','마지막으로 드래싱을 뿌린다',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (198,'고구마 바나나 무스',8,4,'198.png','고구마(50g), 바나나(17g), 달걀(1개), 크림치즈(10g), 우유(20g), 생크림(25g), 딸기잼(15g), 젤라틴(8g), 바닐라빈(1g), 올리고당(2g)','삶아 으깬 고구마와 으깬 바나나를 섞는다.','볼에 달걀노른자, 올리고당, 우유, 바닐라빈을 넣고 중탕시켜 걸쭉하게 만든 뒤 1번과 섞는다.','2번에 휘핑한 생크림을 넣고 섞은 뒤 젤라틴을 넣는다','딸기잼에 우유를 넣고 끓여 젤리를 만든다','무스 틀에 3번과 딸기잼 젤리를 차곡차곡 넣어 굳힌다.','굳힌 무스위에 크림치즈를 올린다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (199,'고구마치즈크로켓',5,3,'199.png','호박고구마(200g), 새우살(80g), 삼색파프리카(80g), 양파(40g), 모짜렐라치즈(40g), 밀가루(20g), 달걀(1개), 빵가루(20g), 생크림(15g), 버터(10g), 꿀(5g), 식용유(40g)','고구마는 찜통에 찐 후 껍질을 제거하고 으깨 생크림, 꿀을 넣고 섞는다','새우살, 파프리카, 양파는 잘게 다진 뒤 팬에 버터를 두르고 볶는다.','볼에 1번과 2번을 넣고 서로 잘 섞이도록 치댄다.','3번을 한입 크기로 떼어낸 후 가운데 모짜렐라 치즈를 넣고 공모양으로 만든다.','크로켓에 밀가루, 달걀물, 빵가루 순으로 묻힌다','180℃의 기름에 크로켓을 튀긴다.',null,null,null,null);
Insert into RECIPE.RECIPE (RID,NAME,TASTE,KIND,IMG,INGREDIENT,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10) values (200,'오미자 샹그리아',9,5,'200.png','오미자(30g), 사과(80g), 오렌지(100g), 딸기(80g), 포도(80g), 배(80g)','오미자를 세척한 뒤 물에 담궈 맛을 낸다.','사과, 오렌지, 딸기, 포도, 배를 세척한다.','세척한 과일을 작고 얇게 슬라이스한다.','1번에 3번을 넣어 숙성시킨다.','따뜻하게 먹을 때는 계피를 넣어 끓인다.',null,null,null,null,null);
REM INSERTING into RECIPE.REG_PEOPLE
SET DEFINE OFF;
REM INSERTING into RECIPE.R_COMMENT
SET DEFINE OFF;
REM INSERTING into RECIPE.R_LIKE
SET DEFINE OFF;
REM INSERTING into RECIPE.R_PRODUCT
SET DEFINE OFF;
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (1,39900,'유자향이 가득하고 영양이 가득하고 신선한 재료로만 엄선해 만든 엄마가 해준 그맛!',100,'유자 얼갈이 배추김치','42.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (2,59900,'바다의 보석! 전복을 가득 넣은 바다향이 가득한 김치 너무 맛있습니다!',100,'전복김치','43.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (3,15300,'달달한 영양만점 단호박과 고~소한 들깨가 듬뿍! 둘이먹다가 하나가 죽어도 모르는맛!',100,'단호박 들깨 꽁치조림','44.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (4,32320,'톡톡 터지고 새콤달콤한 석류가 들어간 김치! 보쌈과 먹으면 환상적인 맛!',100,'석류 보쌈김치','45.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (7,6990,'찹쌀가루를 색색으로 반죽하여 소를 넣고 경단 모양으로 빚어 삶아 내어 꿀물에 띄워낸 음료!
달달하고 너무 맛있어요!',100,'원소병','104.png',1,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (6,12200,'소고기와 닭고기의 환상적인 만남! 땅과 하늘이 만나 완벽한 조합을 이루었다! 한번 맛보면 그 맛을 보면 절대 잊을수 없습니다!',100,'음메꼬꼬돌돌','105.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (8,25000,'12시간 동안 육수를 내 진하고 닭이 부드러워 먹으면 술술 넘어가는 화제의 초계탕! 지금 바로 주문하세욧!',100,'초계탕','107.png',1,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (9,7990,'몸에 좋은 콩나물과 부추가 만났다! 하나만 먹어도 건강한 재료를 두개를 동시에! 이 반찬과 밥이면 한그릇 뚝딱!',100,'콩나물부추무침','108.png',1,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (10,31400,'복날에 이거 하나면 충분! 더운 여름철 기운을 복돋아줄 음식!',100,'닭고기 완자삼계죽','111.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (11,3300,'바다가 바로 내 밥상으로 도착한다! 다양한 해물이 들어가 바다향이 가득~!!',100,'해물볶음밥','114.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (12,4000,'비타민과 필수 아미노산이 함유되어 김밥 한줄이면 비타민약이 필요없습니다~!! 오메가-3가 많은 참치도 같이 있어서 건강함은 두배!!',100,'새싹참치김밥','116.png',1,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (13,25000,'16가지 한방 약재를 넣어 건강도 챙겼다!! 기름을 쫙~빼 담백하고 맛있게 드실수 있습니다~!!!',100,'족발수육','117.png',1,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (14,5500,'하와이의 풍미가 느껴지는 맛! 한입 먹으면 그 곳이 바로 하와이!! 지금 당장 먹고 하와이로 떠나 보아요~!!',100,'파인애플볶음밥','157.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (15,6600,' 하나도 둘도 아닌 딤섬이 세개?! 눈이 즐겁고 입이 즐겁다!! [먹으면 홍콩으로 여행갈 필요가 없어요!] 리얼후기가 말해드립니다!!!',100,'삼색딤섬','164.png',2,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (16,12000,'달콤한 단호박을 넣어 더 달달해졌다!! 새콤달콤하고 바삭바삭한 탕수육!! ',100,'단호박 생선탕수','189.jpg',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (17,5000,'채식자들을 위한 요리! 동물들에게도 권리가 있다구욧!! 동물들의 권리도 챙기고 건강도 챙겼습니다!!',100,'채소 자장면','29.png',2,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (18,18000,'한 입에 쏙~! 미니라 먹기가 편하다!! 몸에 좋은 버섯으로 만든 탕수육! 중식은 기름져 건강에 안 좋을거 같다구요?! 놉!! 버섯으로 만들어 건강도 챙겼습니다!!',100,'미니버섯탕수','101.png',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (19,6700,'큼직~한 대하가 풍덩~~! 간편한게 즐길 수 있는 간편식! 전자레인지에 6분이면 뚝딱!! 간편하게 즐기세욧!!',100,'대하 마늘볶음밥','112.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (20,10000,'아이들이 좋아하는 깐풍기가 주먹밥으로!? 남녀노소 누구나 좋아하는 깐풍기! 아이들이 너무 좋아해요!!',100,'깐풍주먹밥','115.png',2,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (21,25000,'황태가 탕수육으로!! 국으로만 먹었던 황태는 이제 그만 탕수육으로 만들어 아이들 간식으로 최고!! 지금 당장 주문하세요~~!!',100,'황태탕수육','125.png',2,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (22,7700,'모짜렐라 치즈폭탄을 맛보고 싶다면 지금 바로 주문!!',100,'치즈감자크로켓','79.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (23,3000,'어묵과 채소가 만났다!! 채소가 들어가 더 건강에 좋아요~!!',100,'채소어묵','161.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (24,6000,'바삭바삭하고 맛있는 크로켓! 밥으로 만들어 간단한 한끼 식사로 적합해요~!!',100,'밥크로켓','165.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (25,3200,'미역이 들어가 시원하고 일본 정통 미소만을 사용해 일본에 온듯한 느낌을 줍니다~!~!~!',100,'미역 미소국','190.jpg',3,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (26,7900,'치즈와 고구마의 환상적인 만남!! 튀김옷 안에서 펼쳐지는 환상의 파티~! 환상적인 파티로 지금 초대합니다!!',100,'고구마치즈크로켓','199.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (27,15000,'너무 맛있어요!',100,'오색지라시 스시','3.png',3,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (28,12000,'닭가슴살이 퍽퍽하다고요!? 그 생각을 완전히 부셔드리겠습니다! 촉촉하고 부드러운 닭가슴살이 나를 감싼다!! 세계제일의 오코노미야키!!',100,'닭가슴살 오꼬노미야끼','34.png',3,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (29,7000,'와.채.소.크.로.켓 아시는구나 한번 먹으면 완전 반합니다!!',100,'채소크로켓','40.png',3,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (30,7700,'연어를 좋아하는 사람은 그냥 지나칠 수 없는 연어초밥! 이걸 보고 있는 당신! 그냥 지나칠 생각은 하지 마이소~~',100,'연어초밥','103.png',3,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (31,31400,'가지가 맛없다는 생각은 이제 그만!! 이걸 먹으면 당신도 가지에서 벗어날 수 없습니다!!',100,'토마토 가지 카프레제','52.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (32,3300,'부드러운 토마토 스프가 나를 감싸네~!! 여기에 파스타면만 있으면 오늘은 과식할 예정!!',100,'토마토스프 파스타','67.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (33,4000,'스테이크를 먹어도 건강하게 웰빙스테이크로 건강하게 고기를 드세요~~',100,'웰빙스테이크','70.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (34,25000,'뇨끼가 뭔지 모르신다구요!? 인생 헛 살으셨네~~ 이거 먹고 헛된 인생을 되돌리세요!!',100,'까르보나라뇨끼','76.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (35,5500,'이거 안좋아하는 사람 못봄! 불호없는 음식이 왔따!! 지금 당장 백만개 주문햇!!',100,'햄버거스테이크','81.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (36,6600,'파스타 차갑게 먹어본적 없지? 이거 한번 먹어봐 중독될껄? ',100,'냉토마토파스타','82.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (37,12000,'또띠아에 치킨이면 말 다했지~~ 안먹어 보고는 못배길거야~!!! 지금 당장 주문 하란말이얏!!',100,'닭고기또띠아','83.png',4,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (38,5000,'닭고기고 스테이크로 즐길 수 있다구~! 부드러운 닭다리살만 사용해 맛있다구~!!',100,'닭고기스테이크','84.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (39,18000,'먹어봤자나 맛있었자나 그럼 주문해야지~!! 당.장.주.문.해.',100,'오징어순대','85.png',4,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (40,6700,'연어를 좋아한다구? 그럼 당장 주문해~! 먹으면 완전 반할거야!!',100,'연어차우더스프','86.png',4,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (41,10000,'시금치랑 브로콜리를 싫어 했던 사람도 이건 먹더라.. 맛있다고 소문까지 났어!!',100,'시금치브로컬리 파스타','87.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (42,25000,'인싸들은 크림파스타에 바나나 넣어 먹는다.. 바나나 안넣어 먹는다구? 너 아ㅆ.. 아니야 먹어봐...',100,'바나나크림파스타','99.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (43,7700,'육즙이 가득한 함박스테이크!! 한입 베어물면 육즙이 ☆폭발☆',100,'함박스테이크','167.png',4,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (44,3000,'더운날에 먹으면 딱 좋은 파스타 시원하고 깔끔해서 먹기 딱 좋습니다~!!',100,'냉파스타','168.png',4,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (45,6000,'달콤~~한 팬케이크에 상큼한 키위가 듬뿍!! 상콤달콤하고 맛있습니다!!!!',100,'키위 팬케이크','184.png',4,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (46,3200,'입안에서 사르르 녹는 푸딩! 그냥 푸딩이 아니라 허니레몬 그린티맛!! 그린티 좋아하면 이건 못참지!!',100,'허니레몬 그린티 푸딩','185.png',4,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (47,7900,'이걸 안먹어 봤다고!? 나두.. 아까워서 못먹는중... 하지만 당신은 지금 바로 드세욧!!',100,'차가운 당근 수프','191.jpg',4,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (48,15000,'여기가 지중해인가...내 안방인가.. 먹으면 지중해 바다가 펼쳐진다!!',100,'이태리식 해산물 샐러드','192.jpg',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (49,12000,'달달한거 옆에 달달한거 이거 먹으면 당충전 20000%!! 기분 안좋은날 먹으면 최고!!',100,'고구마 바나나 무스','198.png',4,8);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (50,7000,'이름만 들어도 극혐... 치커리 샐러드라니... 나같음 이거 먹을바엔 치킨먹는다...',100,'치커리샐러드','17.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (51,7700,'솔직히 감자는 어떻게 먹어도 맛있자나... 지금 당장 주문해서 먹어!!',100,'그린매쉬드포테이토','18.png',4,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (52,7000,'비타민이 가득한 민들레가 밥상으로! 민들레로 건강함 200%충전하세요!!',100,'민들레 샐러드 ','51.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (53,7700,'이제 채워넣기도 귀찮아...',100,'버섯샐러드','53.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (54,31400,'훈제오리 이름만 들어도 맛있어..!! 이거면 아무리 샐러드라도 한그릇 뚝딱!!',100,'훈제오리가슴살 샐러드','58.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (55,3300,'이건 안보겠지~~!! 메롱!',100,'산마샐러드','61.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (56,4000,'오징어 먹고싶다.. 오징어 맛있는데...',100,'오징어콩순대','71.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (57,25000,'소고기 장조림은 좋은데... 토마토...? 이건 좀...',100,'토마토소고기장조림','72.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (58,5500,'삼겹살~~!~~~~!~!!!! 이름만 들어보 배고파진다...',100,'삼겹살꼬치구이','74.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (59,6600,'라이스 버거는 롯데리아가 진리지..',100,'라이스버거떡갈비','78.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (60,12000,'윽... 컬리플라워 소스? 이걸 누가 먹어...',100,'컬리플라워소스','89.png',5,9);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (61,5000,'양배추 안에 고기 많으면 먹을만 하겠다!!',100,'양배추롤','97.png',5,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (62,18000,'그냥 고기를 먹지 왜 콩고기를...?',100,'콩고기샐러드','98.png',5,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (63,6700,'닭갈비라면이라니.. 이건 좀 맛있을 듯..!!',100,'닭갈비볶음면','100.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (64,10000,'면 삶고 로제소스 부어주면 끝 아님?',100,'로제소스라면','151.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (65,25000,'라면은 비빔면 맞겠지 그럼 이건 최고의 음식!!!',100,'삼겹살라면','152.png',5,2);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (66,31400,'오징어를 구웠는데 맛없을리가..',100,'오징어구이','68.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (67,3300,'달달~허니 꿀맛이겠네~!!!',100,'배숙구이','69.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (68,4000,'카레 좋아하면 이거도 좋아할듯?',100,'코코넛밀크카레밥','80.png',6,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (69,25000,'그냥 물김치면 충분한데 뭘 이것저것 넣는거야...',100,'콜라비오미자 물김치','90.png',6,1);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (70,5500,'젤리라구?! 이거 맛있겠군..!!!',100,'토마토젤리','160.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (71,6600,'아니 배추로 겉절이 하시라구요...',100,'과일겉절이','169.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (72,4000,'토마토 대잔치~~~',100,'토마토주스를곁들인컵토마토','174.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (73,25000,'이거 맛있으려나..? 갓직히 떡꼬치는 고추장 소스지...',100,'레몬들깨 소스를 품은 떡꼬치','180.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (74,5500,'이거 뭐야... 몰라.. 무서워...',100,'삼색매작과와 수정과겔','181.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (75,6600,'이거 맛있음! 아무튼 맛있음!',100,'고구마 석류 과편','182.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (76,12000,'이국적인 맛! 태국적인맛!',100,'태국식 불고기 샐러드','197.jpg',6,6);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (77,5000,'맛있는 브리또임 먹어보셈!',100,'머쉬룸 치킨 브리또','41.png',6,4);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (78,18000,'이건 맛있는거 인정? 어 인정!!',100,'닭고기월남쌈','49.png',6,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (79,3200,'카레인데 맛없을리가 없지!!',100,'생선카레튀김','50.png',6,5);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (80,7900,'바나나는 그냥 먹으세요...',100,'구운 바나나','143.png',6,7);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (81,15000,'응애! 응애! 응애!',150,'비타민이유식','6802b40e-2b82-43e1-bce5-dcaca4fadf97_145.png',6,3);
Insert into RECIPE.R_PRODUCT (PID,P_PRICE,P_CONTENT,P_COUNT,P_NAME,P_IMG,P_KIND,P_TASTE) values (5,4500,'건강에 좋고 신선한 애호박으로 만든 반찬! 들깨가 들어가 더욱 고소해졌습니다',100,'애호박들깨볶음','47.png',1,5);
REM INSERTING into RECIPE.UR_COMMENT
SET DEFINE OFF;
REM INSERTING into RECIPE.UR_LIKE
SET DEFINE OFF;
REM INSERTING into RECIPE.USER_AUTH
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PURCHASE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECIPE"."PURCHASE_PK" ON "RECIPE"."PURCHASE" ("PURCHASENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index A_APPLY_RECIPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECIPE"."A_APPLY_RECIPE_PK" ON "RECIPE"."A_APPLY_RECIPE" ("APPLYNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("P_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" ADD CONSTRAINT "PURCHASE_PK" PRIMARY KEY ("PURCHASENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PURCHASENO" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("COUNT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("DELIVERCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."PURCHASE" MODIFY ("PCHK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_APPLY_RECIPE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("U_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_TASTE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_COUNT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" ADD CONSTRAINT "A_APPLY_RECIPE_PK" PRIMARY KEY ("APPLYNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("A_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_APPLY_RECIPE" MODIFY ("APPLYNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table P_REVIEW
--------------------------------------------------------

  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("PRID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("R_COMMENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."P_REVIEW" ADD PRIMARY KEY ("PRID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table R_PRODUCT
--------------------------------------------------------

  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" ADD PRIMARY KEY ("PID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_IMG" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_KIND" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."R_PRODUCT" MODIFY ("P_TASTE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table A_PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("COUNT" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PURCHASENO" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("P_NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("DELIVER" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("DELIVERCHK" NOT NULL ENABLE);
  ALTER TABLE "RECIPE"."A_PURCHASE" MODIFY ("PCHK" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PURCHASE
--------------------------------------------------------

  ALTER TABLE "RECIPE"."PURCHASE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table P_REVIEW
--------------------------------------------------------

  ALTER TABLE "RECIPE"."P_REVIEW" ADD CONSTRAINT "SYS_C008353" FOREIGN KEY ("PID")
	  REFERENCES "RECIPE"."R_PRODUCT" ("PID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "RECIPE"."P_REVIEW" ADD CONSTRAINT "SYS_C008354" FOREIGN KEY ("USER_ID")
	  REFERENCES "RECIPE"."USER_INFO" ("USER_ID") ON DELETE CASCADE ENABLE;

SELECT * FROM USER_INFO ORDER BY USER_ID DESC;
	 
DROP SEQUENCE PURCHASE_SEQ;
CREATE SEQUENCE  "RECIPE"."PURCHASE_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 110 CACHE 20 NOORDER  NOCYCLE ;

DELETE FROM A_APPLY_RECIPE aar;

SELECT * FROM A_PURCHASE p2 ;

Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/04 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',26,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,1,'음메꼬꼬돌돌',34,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'전복김치',27,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',28,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'풋고추/꽈리고추',29,12);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'단호박 들깨 꽁치조림',30,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,0,'쇠고기/호주산갈비',31,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),2,0,'수박/수박',32,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,'새싹참치김밥',33,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),2,1,'미역 미소국',35,20);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,0,'배추/가을',36,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/19 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',37,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/17 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'음메꼬꼬돌돌',38,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/13 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'전복김치',39,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/17 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',40,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/21 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'풋고추/꽈리고추',41,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/26 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',42,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/28 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',43,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/28 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',44,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/15 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',45,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/07 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',46,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/15 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',47,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',48,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',31,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',32,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/02 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',33,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/08 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',35,20);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/16 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',36,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/20 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',37,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/23 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'음메꼬꼬돌돌',38,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/15 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'전복김치',39,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/24 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',40,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/11 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'풋고추/꽈리고추',41,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',42,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',43,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/16 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',44,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',45,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/18 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',46,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',47,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',48,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/24 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',49,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/24 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',50,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/25 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',51,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/26 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',52,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',53,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',54,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',55,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',56,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',57,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/05 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',58,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',59,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/08 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',60,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',61,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',62,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',63,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',64,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/22 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',65,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/23 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',66,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/27 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',67,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/01 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',68,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/02 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',69,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',70,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/04 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',71,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/05 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',72,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',73,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/08 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',74,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/09 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',75,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',76,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',77,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/12 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',78,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/14 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',79,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/24 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',80,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/31 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',81,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/18 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',82,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/19 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',83,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/20 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',84,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',85,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/07 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',86,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/09 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',87,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',88,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',89,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/16 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',90,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/24 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',91,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',92,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',93,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/22 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'미역 미소국',94,2);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',95,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'배추/가을',96,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/03/01 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'음메꼬꼬돌돌',97,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/03/31 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'전복김치',98,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/02/14 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'풋고추/꽈리고추',99,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'단호박 들깨 꽁치조림',100,4);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'쇠고기/호주산갈비',101,3);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,'수박/수박',102,5);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',103,1);
Insert into RECIPE.A_PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,P_NAME,PURCHASENO,COUNT) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/01/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'새싹참치김밥',104,1);

Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/04 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,26,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,1,5,34,'음메꼬꼬돌돌');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,20,27,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,28,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/12/06 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,29,'풋고추/꽈리고추');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,2,30,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,0,3,31,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),2,0,12,32,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),3,1,2,33,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),2,1,1,35,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/12/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),1,0,1,36,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/19 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,4,37,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/17 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,38,'음메꼬꼬돌돌');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/13 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,39,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/17 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,40,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/11/21 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,41,'풋고추/꽈리고추');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/26 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,42,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/28 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,43,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/28 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,44,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/15 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,45,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/07 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,46,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/15 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,47,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/11/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,48,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,25,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,24,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/02 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,23,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/08 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,22,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/16 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,21,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,451,'2,130','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/20 02:52:58.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,20,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/23 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,20,19,'음메꼬꼬돌돌');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/15 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,4,18,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,3,'15300','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/24 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,17,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/10/11 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,16,'풋고추/꽈리고추');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,1,15,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,14,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/16 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,13,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,12,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/18 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,11,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,10,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/10/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,9,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/24 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,49,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/24 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,50,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/25 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,51,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/26 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,1,52,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,53,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,54,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/09/30 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,4,55,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,56,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,20,57,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/05 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,58,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,59,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/08 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,60,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,12,61,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,62,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,63,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,64,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/22 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,1,65,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/23 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,66,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/08/27 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,67,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/01 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,68,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/02 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,69,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/03 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,70,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/04 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,71,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/05 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,1,72,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/06 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,73,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/08 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,74,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/09 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,4,75,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,76,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/11 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,77,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/12 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,78,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/14 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,79,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/24 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,80,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/07/31 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,81,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/18 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,82,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/19 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,20,83,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/20 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,84,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/06/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,85,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/07 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,86,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/09 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,4,87,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,307,'17,294','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/10 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,88,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/14 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,89,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/16 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,90,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/24 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,2,91,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/05/27 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,92,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/22 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,93,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,25,'3200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/22 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,94,'미역 미소국');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,95,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,32,'5,270','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/04/26 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,96,'배추/가을');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (21,6,'12200','퍼미네이터','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/03/01 01:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,4,97,'음메꼬꼬돌돌');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,2,'59900','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/03/31 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,98,'전복김치');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (2,351,'910','슈퍼맨','경기도 안양시 만안구 냉천로175번길 13, qwe (안양동)','01011111111',to_timestamp('20/02/14 01:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,3,99,'풋고추/꽈리고추');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,3,'15300','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,3,100,'단호박 들깨 꽁치조림');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,451,'2,130','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,5,101,'쇠고기/호주산갈비');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,307,'17,294','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,0,1,102,'수박/수박');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/02/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,2,103,'새싹참치김밥');
Insert into RECIPE.PURCHASE (USER_ID,PID,PRICE,NAME,DELIVER,PHONE,BUYDATE,DELIVERCHK,PCHK,COUNT,PURCHASENO,P_NAME) values (4,12,'4000','aaa','경기도 안양시 만안구 냉천로175번길 13 (안양동) 123','01011111111',to_timestamp('20/01/21 01:56:30.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,5,104,'새싹참치김밥');

SELECT * FROM USER_INFO ui WHERE USER_ID = 2;
SELECT * FROM R_PRODUCT rp ORDER BY PID DESC;

SELECT * FROM P_REVIEW pr ;
UPDATE USER_AUTH SET AUTH = 'ROLE_MEMBER' WHERE USER_ID = 2;

SELECT * FROM A_PURCHASE WHERE TO_CHAR(BUYDATE, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY') AND TO_CHAR(BUYDATE, 'MM') = TO_CHAR(TO_DATE(12,'MM'), 'MM');

UPDATE USER_INFO SET SCORE = SCORE + 50005 WHERE EMAIL = 'aaa123@naver.com'; 



Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (92,'계란말이',3,7,'a1fb0991-9899-43fa-8b55-a6afc48cf7d3_계란말이.jfif','계란 8갸,파 2개,당근 1개,설탕 2스푼,소금 1스푼,',to_timestamp('20/12/08 00:13:57.000000000','RR/MM/DD HH24:MI:SSXFF'),'계란을 후라이팬에 ~~','소금을 챱~~','파를 썰고 당근을 썰고 ~~~ ','후라이팬에 넣고 후루룩 ','말아주면 끝 ',null,null,null,null,null,4);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (93,'화산계란찜',1,4,'1d9b707b-c826-4501-a6e8-1cfbee39d264_계란찜.jfif','계란  10개,당근 2개,물 200ml,고추 1개,소금 반스푼,뚝배기 1개,',to_timestamp('20/12/08 00:16:07.000000000','RR/MM/DD HH24:MI:SSXFF'),'계란을 뚝배기에 풀어요','휘적휘적~~~','당근과 물을 넣고 !! ','고추를 넣어요 ','소금을 마지막으로 넣고 ','전자레인지에 3분~~ 완성 ',null,null,null,null,4);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (96,'바삭김치전',5,5,'b2d8c558-c173-4c5b-8bc6-ad2cbfa786d5_김치전.jfif','김치 1개,고추 2개,고춧가루 1스푼,밀가루 1통,',to_timestamp('20/12/08 00:21:37.000000000','RR/MM/DD HH24:MI:SSXFF'),'김치를 물로씻고','고추를넣고','밀가루를 범벅하면 ','후라이팬에 지글지글하면 끝 ',null,null,null,null,null,null,33);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (98,'된장국',1,3,'bbc147c8-f54b-42b9-b58a-5e46a47b6110_된장국.jfif','된장 2스푼,물 300ml,콩 9개,소금 2개,고추 2개,',to_timestamp('20/12/08 00:24:11.000000000','RR/MM/DD HH24:MI:SSXFF'),'된장을 물에 타고 ~','콩을 넣고 삶는다 ','소금과 고추로 간을 잡고 ','30분끓인다 ',null,null,null,null,null,null,33);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (99,'고튀고튀',5,5,'27ba4d37-7604-4835-a0c1-d987b4b94e2c_고추튀김.jfif','고추 10개,튀김가루 1통,소금 1스푼,깨 53알,',to_timestamp('20/12/08 00:26:26.000000000','RR/MM/DD HH24:MI:SSXFF'),'튀김가루에 고추를 슥슥','소금을 챱 ','튀기고 깨뿌리면 끝 !!',null,null,null,null,null,null,null,32);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (100,'김치찌개',1,3,'1d0c4a90-3ca6-46e3-9e7f-6f82ac106377_김치찌개.jfif','김치 2개,물 300ml,고추 1개,양파 2개,마늘 3개,고춧가루 2스푼,설탕 2스푼,소금 3스푼,간장 2스푼,',to_timestamp('20/12/08 00:27:59.000000000','RR/MM/DD HH24:MI:SSXFF'),'물에 김치를 넣고 ','각종야채를 탈탈탈 ','조미료를 참챱','막 끓이면 끝 ',null,null,null,null,null,null,32);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (101,'닭도리탕',6,3,'43e7a317-96cd-4251-ad60-bb8b07f5b2c4_닭도리탕.jfif','닭 반마리,고추 3개,마늘 2개,양파 1쪽,비빔면소스 1개,라면스푸 2개,당근 반개,설탕 2스푼,',to_timestamp('20/12/08 00:30:45.000000000','RR/MM/DD HH24:MI:SSXFF'),'닭과 고추 및 각종 야채를 같이 삶는다 ','30분후 비빔면 소스를 투척 ','라면스푸도 챱챱 ','20분 더 끓이면 끝!! ',null,null,null,null,null,null,32);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (102,'한국떡국',1,1,'b7539407-d4b0-428f-8016-9081100b49a4_떡국.jfif','떡 4개,물 2000ml,계라 1개,설탕 2스푼,파 1개,',to_timestamp('20/12/08 00:32:26.000000000','RR/MM/DD HH24:MI:SSXFF'),'떡을 쌂는다 ','물에 떡을 넣고 설탕까지 챱','파를 넣고 5분 삶는다','설탕을 넣으면 끝 ! ',null,null,null,null,null,null,32);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (103,'김말이',6,5,'724505cf-d61b-4876-bfef-f49c3b8577d1_김말이.jfif','김 2개,당면 3줄,튀김가루 1통,소금 1스푼,',to_timestamp('20/12/08 00:34:27.000000000','RR/MM/DD HH24:MI:SSXFF'),'김에 당면을 싸고','튀김가루를 입혀보자','소금을 투척해보자 ','튀기면 끝 ',null,null,null,null,null,null,25);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (104,'김치타코',5,1,'90c1c95c-361a-4e28-906a-0234e16e6f04_김치타코.jfif','김치 1포기,밀가루 2통,설탕 1스푼,버터 1스푼,소금 2스푼,',to_timestamp('20/12/08 00:36:38.000000000','RR/MM/DD HH24:MI:SSXFF'),'밀가루를 반달 모양으로 만들고 튀긴다','김치를 살짝 데치고','버터에 설탕 소금을 넣고 끓여 양념(?)을 만들고','양념을 김치에 다 붓고 반달모양밀가루를 입히면 끝!!',null,null,null,null,null,null,25);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (105,'돈카츠',3,5,'671127dc-ce0b-4f0a-9947-4f300d713a1a_돈카츠.jfif','튀김가루 2통,돼지고기 1근,소금 1스푼,겨자 1통,',to_timestamp('20/12/08 00:37:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'돼지고리를 잘게썰고 뭉친다','튀김가루를 입힌다','막 튀겨!','소금과 겨자를 찍어먹자 ! ',null,null,null,null,null,null,25);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (106,'매운떡볶이',5,1,'b03ca3ba-f9e7-42b7-b368-5cd3140c61d2_떡볶이.jfif','청양고추 1개,밀떡 1봉지,어묵 3개,파 2개,고추가루 1스푼,케챱 1스푼,',to_timestamp('20/12/08 00:39:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'떡을 먼저 삶아요','청양고추를 얇게 썰고','어묵과 파를 삶은 다음에','떡과 합체! ! ','고추가루랑 케챱을 넣고 30분 조리면 끝!! ','다들 맛떡 하세요',null,null,null,null,25);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (107,'김치김밥',1,1,'319282dd-b0d6-4eae-b4a4-0849a1d8dc9d_김치김밥.jfif','큰김 1장,밥 한공기,김치 한포기,깨 1스푼,간장 1스푼,',to_timestamp('20/12/08 00:41:59.000000000','RR/MM/DD HH24:MI:SSXFF'),'김에 간장을 뿌리고 ','그 위에 밥을 챱챱 ','김치를 올리고  돌돌말고','깨만 뿌리면 끝 !!!!! ',null,null,null,null,null,null,34);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (108,'시큼꿔바로우',2,1,'25e9d3f0-94cf-4910-afe5-7097a5abdd2b_꿔바로우.jfif','식초 1스푼,튀김가루 1통,돼지고기 1근,물엿 1통,설탕 1스푼,',to_timestamp('20/12/08 00:43:24.000000000','RR/MM/DD HH24:MI:SSXFF'),'돼지고리를 잘게썰고 삶는다','돼지고기를 튀김가루에 입혀주고 ','물엿과 설탕을 넣어서 펄펄 튀기면 끝 !!! ',null,null,null,null,null,null,null,34);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (109,'동파육',2,4,'40ca38fb-e735-40d5-8e65-8ad097e3f080_동파육.jfif','돼지고기 1근,간장 2스푼,설탕 1스푼,소금 1스푼,참기름 3방울,간장 1스푼,',to_timestamp('20/12/08 00:45:15.000000000','RR/MM/DD HH24:MI:SSXFF'),'돼지고기를 삶고','간장과 설탕을 먼저 넣어요','5분후 소금과 참기름을 투척하고 10분기다려요','간장을 넣고 5분 삶으면 끝 !! ',null,null,null,null,null,null,34);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (110,'로제크림수제비',5,1,'7c742016-d36f-4f89-99e9-150285b736a6_로제크림수제비.jfif','로제소스 1통,우유크림 1통,밀가루 1통,고춧가루 1스푼,설탕 2스푼,',to_timestamp('20/12/08 00:47:44.000000000','RR/MM/DD HH24:MI:SSXFF'),'밀가루를 덕지덕지해서 수제비 만들어요','로제소스에 우유크림을 섞고 20분 끓여요','밀가루로 만든 수제비를 넣어서 같이 4분 더 끓이고','고춧가루랑 설탕넣고 10분 더 끓이면 !! ','로제크림수제비 완성~~ ',null,null,null,null,null,34);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (111,'간편마라탕 ',2,3,'40c4d332-270c-41f5-991b-19bbcb7ff263_마라탕.jfif','물 600ml,고춧가루 6스푼,느타리버섯 2개,당면 5줄',to_timestamp('20/12/08 00:55:11.000000000','RR/MM/DD HH24:MI:SSXFF'),'물을 끓인다','면을넣는다!!','고춧가루를 넣고 푸욱 끓인다 ','당면과 버섯을 넣고 10분 끓이면 완성',null,null,null,null,null,null,35);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (113,'식빵피자',4,1,'dbab1924-242f-4432-b3fa-f3dc5bf20a7d_베이컨피자.jfif','식빵 ,피자치즈 ,방울토마토 ,베이컨 ,브로콜리 ,소세지 ,게맛살 ,스파게티소스 ,',to_timestamp('20/12/08 01:02:27.000000000','RR/MM/DD HH24:MI:SSXFF'),'야채는 먹기좋은 한입 사이즈로 자르고 파프리카는 얇게 썰어주세요 .','소세지와 베이컨 그리고 게맛살도 알맞은 크기로 썰어주세요.','식빵은 사선으로 잘라서 팬에 잘맞춰서 올려주세요~','식빵위에 시판용 스파게티 소스를 듬뿍 발라주세요','그위에 야채를 예쁘게 올려주세요~','220도 예열한 광파오븐속으로~~~ 15분정도 오븐으로 돌려주고','치즈도 골고루 잘녹은것 같네요.굽는도중 5분정도 그릴로 바꿔서 돌려줬어요~ 짠!! 그럴싸한 식빵 피자가 완성됐어요',null,null,null,35);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (114,'불고기버거',1,1,'569c1e26-1530-46fb-8a7e-f290cd8f8fff_불고기버거.jfif','빵 2개,쇠고기 불고기용 300g,불고기소스 6큰술,토마토 2개,양파 1/2개,스라이스치즈 2장,마요네즈 2큰술,물엿 2큰술,소금,후추 약간,피클 4조각,',to_timestamp('20/12/08 01:05:50.000000000','RR/MM/DD HH24:MI:SSXFF'),'소고기엔 소금과 후춧가루 그리고 불고기 양념 2큰술을 넣어 잘 버무려 줍니다','버거에 들어갈 양파와 토마토는 슬라이스를, 양상추는 손으로 찢어 준비해요~','양념해둔 소고기는 달달 볶아 줘요~','맛있게 볶아졌다면 소고기만 건져서 잠시 대기!','불고기소스에 물엿, 후추를 넣어 파르르 끓여 불고기 소스를 만들어주세용','빵에 마요네즈를 바른후 양상추를 올려줍니다!','그후 치즈와 양파, 토마토, 피클 등을 올린 후','볶아둔 불고기를 올려줍니다 : ) ㄲ ㅑ','달달 짭쪼름한 소스를 한 번 끼얹어주면 ~~ :)','한국인들 입맛에 딱 ! 리얼 불고기 버거 완성!',35);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (115,'매콤닭강정',5,5,'b31ba590-5180-4504-b6a4-5cb415963069_매콤닭강정.jfif','닭안심살 350g,소금 1작은술,후추 약간,소주 1큰술,다진마늘 1/2큰술,마늘 20알,감자전분 6큰술,케슈넛 10개,간장 1큰술,올리고당 1큰술,고추장 1큰술,',to_timestamp('20/12/08 01:09:49.000000000','RR/MM/DD HH24:MI:SSXFF'),'닭 안심 350g, 소금, 후추를 넣어 간을 맞춰준다.','잡내를 없애기 위해 소주 1큰술, 다진마늘 1/2큰 술을 넣어준다','마늘 20알이 매울 수 있기때문에, 미리 1분 삶아준다.','간장1큰 술, 올리고당 1큰 술, 물 2큰 술, 고추장 1큰 술을 넣어 섞어준다.','지퍼팩에 준비해놓은 닭 안심을 넣고 감자전분 6큰 술을 넣고 섞어준다','후라이팬에 식용유를 두른 뒤 맛있게 굽는다.','어느정도 익으면 마늘 20알을 넣고 같이 굽는다.','준비해놓은 양념을 넣고 케슈넛 10개를 넣어서 조금 더 구워준다.  한줄댓글',null,null,36);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (116,'밀푀유나베',5,3,'14b43933-d571-4723-a0e4-1ec557a11307_밀푀유나베.jfif','불고기용소고기 300g,배추 8장,깻잎 8장,청경채 2개,표고버섯 두개,쑥갓 반줌,숙주 한줌,물 4컵,다시마 한장,대파 한대,참치액젓 두큰술,소금 반작은술,',to_timestamp('20/12/08 01:12:08.000000000','RR/MM/DD HH24:MI:SSXFF'),'냄비에 육수재료를 넣고 육수를 내준다.','배추, 깻잎, 소고기, 배추 순으로 켜켜이 쌓은 후 냄비 높이에 맞게 잘라준다.','냄비에 숙주를 깔고 켜켜이 쌓은 재료를 냄비에 둘러 넣어주고, ','표고버섯과 청경채를 가운데 넣고 육수를 부어 끓여준다.',null,null,null,null,null,null,36);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (117,'불닭면',1,1,'90eb5536-4b42-43d5-bb34-de990afb7955_볶음잠뽕.jfif','불닭볶음면 1봉,양배추 한줌,부추 한줌,양파 1/3개,계란 1개,닭가슴살 1캔,모짜렐라치즈 한줌,체다치즈 1장,',to_timestamp('20/12/08 01:14:48.000000000','RR/MM/DD HH24:MI:SSXFF'),'채소는 몽땅 먹기 좋은 크기로 잘라주기','닭가슴살 캔은 물기를 제거해주고! 닭가슴살에도 이미 간이 되어 있어서 굳♡','계란 후라이는 반숙으로! (취향에 따라 스크램블 에그도 오케)','면은 끓는 물에 꼬들하게 삶아주기! (면수 1/2 국자 보관!)','채소 몽땅 넣어 볶아 준 다음 닭가슴살도 넣어주고~','꼬들하게 삶은 면과 불닭 소스를 넣고 골고루 볶아볶아','불끄고 모짜렐라 치즈 한 줌, 체다 치즈 한 장 올려놓고 잠깐 뚜겅 덮어주기!','잘 녹은 치즈위에 반숙 계란 후라이를 얹고, 별첨된 김가루도 뿌려주면~?','매움의 미학, 매움의 정석 불닭볶음면♡',null,36);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (118,'비빔국수',1,2,'6b43585a-ed0a-400f-9636-2d9b48e663fc_비빔국수.jfif','소면 ,오이 ,상추 ,초고추장 ,참기름 ,통깨 ,식용유 ,',to_timestamp('20/12/08 01:16:53.000000000','RR/MM/DD HH24:MI:SSXFF'),'야채는 먹기좋게 잘라두세요~','끓는 물에  국수를 부채꼴모양으로 잘 펴서 넣은 다음','한소끔 끓으면 찬물을 조금 넣고 다시 한소끔 끓여주세요','삶은 국수는 시원한 물에 씻어 물기를 빼주세요.','국수와 야채 그리고 참기름과 초고추장을 넣고 비벼주세요.','마지막으로 통깨를 솔솔 뿌려주면 끝~',null,null,null,null,36);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (119,'메론망고빙수',6,7,'c2c57c6c-0ec0-4331-b880-277897225fc3_메론빙수.jfif','연유 140g,우유 400g,물 50g,멜론 1/2개,',to_timestamp('20/12/08 01:19:13.000000000','RR/MM/DD HH24:MI:SSXFF'),'멜론빙수 : 연유 70g, 우유 200g, 물 50g 을 넣고 얼려준다.','멜론은 속을 파내고 껍질에 얼음을 갈아준 뒤, 멜론을 얹어 완성한다',null,null,null,null,null,null,null,null,29);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (120,'버섯칼국수',1,2,'c9c8abab-f9a0-45ce-b975-cc50bc4d0c86_버섯칼국수.jfif','다시다요리수 1큰술,칼국수면 1인분,물 300ml,달걀 1개,버섯 4개,김 1/4장,소금 약간,',to_timestamp('20/12/08 01:22:38.000000000','RR/MM/DD HH24:MI:SSXFF'),'당근을 채 썰어주세요','달걍은 흰자와 노른자를 분리해서 소금 간 해주세요','지단을 만들어주세요','채 친 당근도 소금을 약간 넣고 볶아주세요','김을 약한 불에 살짝 구워주세요 ','달걀 지단은 채 썰어주세요','냄비에 물을 넣고 다시다요리수를 넣어주세요','국물이 끓어오르면 면을 넣어주세요',null,null,29);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (121,'가성비부대찌개',1,3,'23229016-3247-4d5a-a41d-deabe8f75bf1_부대찌개.jfif','라면(오모리김치찌개) 1봉,볶은김치 150g,프랑크소시지 1개,두부  1모,',to_timestamp('20/12/08 01:24:32.000000000','RR/MM/DD HH24:MI:SSXFF'),'두부는 1cm 두께로 편 썰고, 소시지는  어슷하게 썰어주세요.','냄비에 물 2컵을 넣고 스프 2종류를 넣고 끓여주세요.','햄과 볶음 김치를 넣고 면을 넣어 주세요.','면이 거의 익을 때 두부를 넣으면 끝!',null,null,null,null,null,null,29);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (123,'멘보샤',2,7,'2e60c55d-4374-43cc-83ba-605d48528f06_멘보샤.jfif','새우 20마리,식빵 4장,달걀 1개,소금 1꼬집,후추 1꼬집,감자전분 1.5큰술,식용유 적당량,',to_timestamp('20/12/08 01:30:16.000000000','RR/MM/DD HH24:MI:SSXFF'),'새우는 살만 발라 다져주세요~','식빵은 모서리 자르기!','새우 살에 달갸르 감자전분,소금, 후추,식용우 넣어 반죽!','식빵은 4등분해주세요 ','식빵사이에 새우 반죽을 넣고 눌러줘요','기름에 튀겨주세요 ',null,null,null,null,21);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (127,'매콤고추장바베큐',4,4,'c488548e-6c38-4f47-bbe5-4ffa5e74bb8e_고추장삼겹살.jfif','고추장 1큰술,삼겹살 300g,',to_timestamp('20/12/08 19:16:15.000000000','RR/MM/DD HH24:MI:SSXFF'),'삼겹살과 고추장을 비벼','그러고 구우면 끝 !',null,null,null,null,null,null,null,null,33);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (125,'불고기',1,1,'235b0d2a-f345-42a1-b25c-de6dcddfd989_불고기.jfif','불고기용 소고기 600g,양파 1/4개,당근 30g,홍고추 반개,청양고추 한개,간장 5큰술,설탕 한큰술,매실액기스 한큰술,배즙 3큰술,다진마늘 한큰술,다진생강 1/4큰술,후추 1/4큰술,식용유 약간,',to_timestamp('20/12/08 01:35:56.000000000','RR/MM/DD HH24:MI:SSXFF'),'양파는 채 썰고, 당근은 얇게 편썰고, 고추는 어슷하게 썰어 준비해주세요.','간장, 설탕, 매실액기스,배즙,  다진마늘,다진 생강, 후추 넣고 골고루 버무려주세요.','팬에 식용유를 약간 두르고 고기를 볶아주세요.','국물이 자작하게 나오면서 고기가 다 익으면 완성!',null,null,null,null,null,null,21);
Insert into RECIPE.USER_RECIPE (USER_RID,NAME,KIND,TASTE,IMG,INGREDIENT,REGDATE,RECIPE_1,RECIPE_2,RECIPE_3,RECIPE_4,RECIPE_5,RECIPE_6,RECIPE_7,RECIPE_8,RECIPE_9,RECIPE_10,USER_ID) values (91,'맛난계란말이           ',3,7,'30ef0040-fd5d-4b1e-b0f9-0b7a12810a1b_계란말이.jfif','계란 8개,파 2개,당근 1개,설탕 2스푼,소금 1스푼',to_timestamp('20/12/08 00:13:57.000000000','RR/MM/DD HH24:MI:SSXFF'),',,,,계란을 후라이팬에 ~~',',,,,소금을 챱~~',',,,,파를 썰고 당근을 썰고 ~~~ ',',,,,후라이팬에 넣고 후루룩 ',',,,,말아주면 끝 ',null,null,null,null,null,3);



SELECT * FROM USER_INFO WHERE USER_ID =1;
DELETE 
--DB 변경사항
-- a_cook_class category -> kind
ALTER TABLE A_COOK_CLASS
RENAME COLUMN CATEGORY TO KIND;

SELECT * FROM A_COOK_CLASS;

--a_cook_class 에는 chk 추가
ALTER TABLE A_COOK_CLASS ADD chk NUMBER NOT NULL;

--a_cook_class랑 cook_class enddate 데이터타입 date로 변경
ALTER TABLE A_COOK_CLASS
MODIFY ENDDATE DATE;

ALTER TABLE COOK_CLASS
MODIFY ENDDATE DATE;

--r_comment user_rid -> rid
ALTER TABLE R_COMMENT
RENAME COLUMN USER_RID TO RID;

SELECT * FROM USER_RECIPE ur ;

SELECT * FROM USER_INFO WHERE EMAIL = 'aaa123@naver.com';