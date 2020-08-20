--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_EXERCISENO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_EXERCISENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FIELDNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_FIELDNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_IMGNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_IMGNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_INBODYNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_INBODYNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_INTERESTNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_INTERESTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PTNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_PTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RECORDNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_RECORDNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEWNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_REVIEWNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SCHEDULENO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_SCHEDULENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERNO
--------------------------------------------------------

   CREATE SEQUENCE  "MANAGER"."SEQ_USERNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADDRESS
--------------------------------------------------------

  CREATE TABLE "MANAGER"."ADDRESS" 
   (	"EMT" VARCHAR2(100 BYTE), 
	"PROVINCE" VARCHAR2(100 BYTE), 
	"CITY" VARCHAR2(100 BYTE), 
	"REGION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CAREER_LIST
--------------------------------------------------------

  CREATE TABLE "MANAGER"."CAREER_LIST" 
   (	"USERNO" NUMBER, 
	"RECORDINFO" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EXERCISE
--------------------------------------------------------

  CREATE TABLE "MANAGER"."EXERCISE" 
   (	"EXERCISENO" NUMBER, 
	"TRAINERNO" NUMBER, 
	"EXERCISENAME" VARCHAR2(50 BYTE), 
	"EXERCISEPART" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INBODY
--------------------------------------------------------

  CREATE TABLE "MANAGER"."INBODY" 
   (	"INBODYNO" NUMBER, 
	"PTNO" NUMBER, 
	"MEASUREDATE" DATE, 
	"WEIGHT" NUMBER(20,4), 
	"PERCENTFAT" NUMBER(20,4), 
	"MUSCLEMASS" NUMBER(20,4), 
	"BMI" NUMBER(20,4)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INTEREST_FIELD
--------------------------------------------------------

  CREATE TABLE "MANAGER"."INTEREST_FIELD" 
   (	"FIELDNO" NUMBER(5,0), 
	"FIELDNAME" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INTEREST_LIST
--------------------------------------------------------

  CREATE TABLE "MANAGER"."INTEREST_LIST" 
   (	"USERNO" NUMBER, 
	"FIELDNO" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PT
--------------------------------------------------------

  CREATE TABLE "MANAGER"."PT" 
   (	"PTNO" NUMBER, 
	"USERNO" NUMBER, 
	"TRAINERNO" NUMBER, 
	"STARTDATE" DATE, 
	"ENDDATE" DATE, 
	"REGCOUNT" NUMBER(10,0), 
	"MEMO" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RECORDS
--------------------------------------------------------

  CREATE TABLE "MANAGER"."RECORDS" 
   (	"RECORDNO" NUMBER, 
	"SCHEDULENO" NUMBER, 
	"EXERCISENO" NUMBER, 
	"WEIGHT" NUMBER(12,0), 
	"COUNT" NUMBER(8,0), 
	"TIME" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "MANAGER"."REVIEW" 
   (	"REVIEWNO" NUMBER, 
	"PTNO" NUMBER, 
	"REGDATE" DATE, 
	"SCORE" NUMBER(8,4), 
	"CONTENT" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REVIEW_IMG
--------------------------------------------------------

  CREATE TABLE "MANAGER"."REVIEW_IMG" 
   (	"REIMGNO" NUMBER, 
	"REVIEWNO" NUMBER, 
	"FILEPATH" VARCHAR2(500 BYTE), 
	"SAVENAME" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "MANAGER"."SCHEDULE" 
   (	"SCHEDULENO" NUMBER, 
	"PTNO" NUMBER, 
	"DATETIME" DATE, 
	"STATE" VARCHAR2(20 BYTE), 
	"MEMO" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "MANAGER"."USERS" 
   (	"USERNO" NUMBER, 
	"USERID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"AGE" NUMBER, 
	"USERTYPE" VARCHAR2(20 BYTE), 
	"PROFILEIMG" VARCHAR2(200 BYTE), 
	"INTRODUCTION" VARCHAR2(2000 BYTE), 
	"CAREER" NUMBER(4,0), 
	"LOCATION" VARCHAR2(100 BYTE), 
	"COMPANY" VARCHAR2(200 BYTE), 
	"PRICE" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into MANAGER.ADDRESS
SET DEFINE OFF;
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','강남구','개포1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','전주시 덕진구','노송동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','부천시','대산동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','강동구','고덕제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','전주시 완산구','동서학동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','동두천시','송내동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','남양주시','화도읍동부출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','강북구','월곡제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','정읍시','고부면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','강서구','가양제3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','김포시','하성면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','관악구','남현동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','진안군','동향면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','군포시','수리동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','광진구','광장동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','구리시','수택3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'제주특별자치도','서귀포시','남원읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','광주시','퇴촌면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','구로구','개봉제3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','광명시','하안4동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','금천구','가산동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','과천시','부림동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','고양시 일산서구','탄현동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','노원구','공릉1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','고양시 일산동구','중산동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','도봉구','도봉제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'제주특별자치도','제주시','구좌읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','고양시 덕양구','화정2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','동대문구','답십리제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','가평군','청평면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','동작구','노량진제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','횡성군','횡성읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','마포구','청파동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','화천군','화천읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','계룡시','금암동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','홍천군','화촌면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','공주시','계룡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','서대문구','남가좌제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','평창군','평창읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','서초구','반포2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','금산군','군북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','태백시','황지동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','춘천시','궁내동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','성동구','금호2.3가동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','논산시','광석면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','성북구','돈암제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','철원군','철원읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','정선군','화암면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','당진시','대호지면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','송파구','가락본동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','인제군','인제읍귀둔출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','원주시','흥업면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','양천구','목1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','보령시','대천2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','영등포구','당산제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','부여군','구룡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','영월군','한반도면쌍용출장');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','용산구','용문동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','양양군','현북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','서산시','고북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','양구군','해안면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','은평구','이태원제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','속초시','조양동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','삼척시','하장면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','서천군','마산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','종로구','명륜3가동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','동해시','천곡동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','고성군','현내면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','아산시','도고면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','중구','동화동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'강원도','강릉시','포남1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','예산군','고덕면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'서울특별시','중랑구','망우제3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','성남시 분당구','구미동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','성남시 수정구','금광2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','장수군','장수읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','임실군','지사면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','성남시 중원구','금광2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','익산시','황등면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','수원시 권선구','구운동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'광주광역시','광산구','신창동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','수원시 영통구','망포2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','수원시 장안구','송죽동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','수원시 팔달구','매교동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','시흥시','광명6동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','완주군','화산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','안산시 단원구','중앙동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','순창군','적성면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','안산시 상록구','본오3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','부안군','행안면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','안성시','고삼면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','무주군','적상면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','남원시','주천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','안양시 동안구','부림동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','안양시 만안구','박달1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','김제시','황산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','양주시','광적면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','양평군','강상면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','군산시','회현면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','여주시','강천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라북도','고창군','해리면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','연천군','군남면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','오산시','서탄면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','용인시 기흥구','기흥동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','화순군','청풍면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','용인시 수지구','구미1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','함평군','해보면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','용인시 처인구','남사면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','해남군','화산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','의왕시','내손1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','진도군','조도면거차출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','의정부시','가능2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','이천시','대월면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','장흥군','회진면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','장성군','황룡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','파주시','광탄면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','완도군','완도읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','영암군','학산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','평택시','고덕면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','영광군','법성면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','여수시','화정면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','포천시','관인면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','하남시','감일동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','신안군','흑산면홍도출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경기도','화성시','동탄3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','순천시','황전면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','보성군','회천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','거제시','거제면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','무안군','현경면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','거창군','가북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','목포시','이로동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','담양군','창평면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','김해시','대동면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','나주시','송월동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','구례군','용방면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','남해군','고현면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','광양시','태인동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','밀양시','교동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','곡성군','옥과면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','고흥군','풍양면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','사천시','곤명면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'전라남도','강진군','작천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','산청군','금서면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','옹진군','자월면이작출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','양산시','동면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','연수구','송도동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','서구','청라2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','의령군','가례면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','부평구','청천2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','진주시','금곡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','미추홀구','학익2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창녕군','계성면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','동구','송현1...2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','남동구','장수서창동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창원시 마산합포구','가포동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','계양구','효성2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'인천광역시','강화군','양사면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창원시 마산회원구','팔룡동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창원시 성산구','팔룡동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'울산광역시','울주군','청량읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창원시 의창구','대산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'울산광역시','북구','염포동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','창원시 진해구','웅동1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'울산광역시','남구','수암동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','통영시','광도면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','새롬동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','소담동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','산울동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','보람동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','도담동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','반곡동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','나성동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','대평동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','다정동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','하동군','고전면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','해운대구','중제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','함안군','가야읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','영도구','청학제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','함양군','마천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','연제구','안락제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상남도','합천군','가야면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','수영구','수영동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','경산시','남산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','사하구','장림제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','경주시','감포읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','사상구','학장동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','부산진구','초읍동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','고령군','다산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','동래구','온천제2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','구미시','공단1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','군위군','고로면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','김천시','감문면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','기장군','철마면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'부산광역시','금정구','장전제1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','문경시','가은읍북부출장소');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','봉화군','명호면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','상주시','공검면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'대전광역시','유성구','원신흥동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','성주군','가천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','안동시','단밀면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'대전광역시','대덕구','오정동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','영덕군','강구면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'대구광역시','수성구','황금1동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','영양군','석보면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','영주시','단산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','영천시','고경면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','예천군','감천면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','울릉군','북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','울진군','근남면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'대구광역시','달성군','내당2.3동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','의성군','가음면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'대구광역시','달서구','용산2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','청도군','각남면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','청송군','부남면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','칠곡군','가산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','포항시 남구','구룡포읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'경상북도','포항시 북구','기계면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','천안시 동남구','광덕면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','천안시 서북구','배방읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','청양군','남양면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','태안군','남면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청남도','홍성군','갈산면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','괴산군','감물면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','단양군','가곡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','보은군','내북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','영동군','매곡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','옥천군','군북면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','음성군','감곡면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','제천시','금성면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','증평군','도안면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','진천군','광혜원면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','청주시 상당구','가덕면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','청주시 서원구','남이면');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','청주시 청원구','내수읍');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','청주시 흥덕구','가경동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'충청북도','충주시','교현2동');
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','종촌동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','집현동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','한솔동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','합강동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','해밀동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','아름동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','어진동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','가람동',null);
Insert into MANAGER.ADDRESS (EMT,PROVINCE,CITY,REGION) values (null,'세종특별자치시','고운동',null);
REM INSERTING into MANAGER.CAREER_LIST
SET DEFINE OFF;
REM INSERTING into MANAGER.EXERCISE
SET DEFINE OFF;
REM INSERTING into MANAGER.INBODY
SET DEFINE OFF;
REM INSERTING into MANAGER.INTEREST_FIELD
SET DEFINE OFF;
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (1,'기초체력향상');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (2,'근력향상');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (3,'체중감량');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (4,'대회준비');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (5,'프로필촬영');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (6,'체형교정');
Insert into MANAGER.INTEREST_FIELD (FIELDNO,FIELDNAME) values (7,'재활');
REM INSERTING into MANAGER.INTEREST_LIST
SET DEFINE OFF;
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (13,1);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (13,2);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (14,3);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (17,1);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (17,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (17,7);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (18,4);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,1);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,1);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,4);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,4);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,1);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,4);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (95,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (96,2);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (96,3);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (96,5);
Insert into MANAGER.INTEREST_LIST (USERNO,FIELDNO) values (96,5);
REM INSERTING into MANAGER.PT
SET DEFINE OFF;
REM INSERTING into MANAGER.RECORDS
SET DEFINE OFF;
REM INSERTING into MANAGER.REVIEW
SET DEFINE OFF;
REM INSERTING into MANAGER.REVIEW_IMG
SET DEFINE OFF;
REM INSERTING into MANAGER.SCHEDULE
SET DEFINE OFF;
REM INSERTING into MANAGER.USERS
SET DEFINE OFF;
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (13,'hipm','1234','박명수','male','010-1234-5678',25,'trainer',null,'정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다.',12,'서울특별시 강남구 세곡동','무한도전 피트니스짐','10회 이상 신청시 회당 5만원 20회 이상 신청시 회당 4만원 30회 이상 신청 시 회당 3만원');
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (14,'pmpm','1111','김피트','female','010-1111-1111',25,'trainer',null,'믿고 맡겨주세요.회원님 한분한분 끝까지 포기하지 않습니다.',3,'서울특별시 강남구 수서동','하이미디어 피트니스','1회 신청시 회당 6만원 3회 이상 신청시 회당 5만원');
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (95,'trainer01','1234','김이름','male','010-0000-0000',28,'trainer',null,'안녕하세요',3,'서울특별시 강동구 강일동','좋은헬스 강일지점','별도 문의 바랍니다');
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (26,'id01','1234','김회원','male','010-0000-0000',0,'normal',null,null,1,null,null,null);
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (17,'pm44','4444','이니트','male','010-4444-4444',40,'trainer',null,'정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다.',5,'서울특별시 강남구 수서동','운동운동 피트니스','트레이너와 협의 후 결정');
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (18,'oioi','5555','오잉','male','010-5555-5555',60,'trainer',null,null,5,'경기도 군포시 수리동',null,null);
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (96,'trainer02','1234','이이름','female','010-1111-0000',27,'trainer',null,'안녕하세요 이이름 트레이너 입니다',4,'경기도 성남시 수정구 복정동','횐님오늘오시죠','문의 바랍니다');
Insert into MANAGER.USERS (USERNO,USERID,PASSWORD,NAME,GENDER,PHONE,AGE,USERTYPE,PROFILEIMG,INTRODUCTION,CAREER,LOCATION,COMPANY,PRICE) values (99,'trainer02','1234','이이름','female','010-1111-0000',0,'trainer',null,null,1,null,null,null);
--------------------------------------------------------
--  Constraints for Table REVIEW_IMG
--------------------------------------------------------

  ALTER TABLE "MANAGER"."REVIEW_IMG" ADD PRIMARY KEY ("REIMGNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."REVIEW_IMG" MODIFY ("REVIEWNO" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."REVIEW_IMG" MODIFY ("REIMGNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INTEREST_FIELD
--------------------------------------------------------

  ALTER TABLE "MANAGER"."INTEREST_FIELD" ADD PRIMARY KEY ("FIELDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."INTEREST_FIELD" MODIFY ("FIELDNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECORDS
--------------------------------------------------------

  ALTER TABLE "MANAGER"."RECORDS" ADD PRIMARY KEY ("RECORDNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."RECORDS" MODIFY ("RECORDNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "MANAGER"."USERS" ADD PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."USERS" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."USERS" MODIFY ("USERNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PT
--------------------------------------------------------

  ALTER TABLE "MANAGER"."PT" ADD PRIMARY KEY ("PTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."PT" MODIFY ("USERNO" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."PT" MODIFY ("PTNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "MANAGER"."REVIEW" ADD PRIMARY KEY ("REVIEWNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."REVIEW" MODIFY ("PTNO" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."REVIEW" MODIFY ("REVIEWNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "MANAGER"."SCHEDULE" ADD PRIMARY KEY ("SCHEDULENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."SCHEDULE" MODIFY ("PTNO" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."SCHEDULE" MODIFY ("SCHEDULENO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXERCISE
--------------------------------------------------------

  ALTER TABLE "MANAGER"."EXERCISE" ADD PRIMARY KEY ("EXERCISENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."EXERCISE" MODIFY ("TRAINERNO" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."EXERCISE" MODIFY ("EXERCISENO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INBODY
--------------------------------------------------------

  ALTER TABLE "MANAGER"."INBODY" ADD PRIMARY KEY ("INBODYNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MANAGER"."INBODY" MODIFY ("INBODYNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CAREER_LIST
--------------------------------------------------------

  ALTER TABLE "MANAGER"."CAREER_LIST" ADD CONSTRAINT "FK_CAREER_USERNO" FOREIGN KEY ("USERNO")
	  REFERENCES "MANAGER"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EXERCISE
--------------------------------------------------------

  ALTER TABLE "MANAGER"."EXERCISE" ADD CONSTRAINT "FK_EXERCISE_TRAINERNO" FOREIGN KEY ("TRAINERNO")
	  REFERENCES "MANAGER"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INBODY
--------------------------------------------------------

  ALTER TABLE "MANAGER"."INBODY" ADD CONSTRAINT "FK_INBODY_PTNO" FOREIGN KEY ("PTNO")
	  REFERENCES "MANAGER"."PT" ("PTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INTEREST_LIST
--------------------------------------------------------

  ALTER TABLE "MANAGER"."INTEREST_LIST" ADD CONSTRAINT "FK_INTEREST_FIELDNO" FOREIGN KEY ("FIELDNO")
	  REFERENCES "MANAGER"."INTEREST_FIELD" ("FIELDNO") ENABLE;
  ALTER TABLE "MANAGER"."INTEREST_LIST" ADD CONSTRAINT "FK_INTEREST_USERNO" FOREIGN KEY ("USERNO")
	  REFERENCES "MANAGER"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PT
--------------------------------------------------------

  ALTER TABLE "MANAGER"."PT" ADD CONSTRAINT "FK_PT_TRAINERNO" FOREIGN KEY ("TRAINERNO")
	  REFERENCES "MANAGER"."USERS" ("USERNO") ENABLE;
  ALTER TABLE "MANAGER"."PT" ADD CONSTRAINT "FK_PT_USERNO" FOREIGN KEY ("USERNO")
	  REFERENCES "MANAGER"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECORDS
--------------------------------------------------------

  ALTER TABLE "MANAGER"."RECORDS" ADD CONSTRAINT "FK_RECORDS_EXERCISE" FOREIGN KEY ("EXERCISENO")
	  REFERENCES "MANAGER"."EXERCISE" ("EXERCISENO") ENABLE;
  ALTER TABLE "MANAGER"."RECORDS" ADD CONSTRAINT "FK_RECORDS_SCHEDULENO" FOREIGN KEY ("SCHEDULENO")
	  REFERENCES "MANAGER"."SCHEDULE" ("SCHEDULENO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "MANAGER"."REVIEW" ADD CONSTRAINT "FK_REVIEW_PTNO" FOREIGN KEY ("PTNO")
	  REFERENCES "MANAGER"."PT" ("PTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW_IMG
--------------------------------------------------------

  ALTER TABLE "MANAGER"."REVIEW_IMG" ADD CONSTRAINT "FK_REVIEWIMG_REVIEWNO" FOREIGN KEY ("REVIEWNO")
	  REFERENCES "MANAGER"."REVIEW" ("REVIEWNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "MANAGER"."SCHEDULE" ADD CONSTRAINT "FK_SCHEDULE_PTNO" FOREIGN KEY ("PTNO")
	  REFERENCES "MANAGER"."PT" ("PTNO") ENABLE;
