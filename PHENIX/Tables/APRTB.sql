CREATE TABLE phenix.aprtb (
  termscode VARCHAR2(6 BYTE) NOT NULL,
  paymnbr NUMBER(5) NOT NULL,
  audtdate NUMBER(9) NOT NULL,
  audttime NUMBER(9) NOT NULL,
  audtuser VARCHAR2(8 BYTE) NOT NULL,
  audtorg VARCHAR2(6 BYTE) NOT NULL,
  datelastmn NUMBER(9) NOT NULL,
  pctpaymdue NUMBER(9,5) NOT NULL,
  disctype NUMBER(*,0) NOT NULL,
  pctdisc NUMBER(9,5) NOT NULL,
  disnbrdays NUMBER(3) NOT NULL,
  discday NUMBER(3) NOT NULL,
  duetype NUMBER(*,0) NOT NULL,
  duenbrdays NUMBER(3) NOT NULL,
  dueday NUMBER(3) NOT NULL,
  CONSTRAINT aprtb_pk PRIMARY KEY (termscode,paymnbr)
);