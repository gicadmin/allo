CREATE TABLE phenix.arcuso (
  idcust VARCHAR2(12 BYTE) NOT NULL,
  optfield VARCHAR2(12 BYTE) NOT NULL,
  audtdate NUMBER(9) NOT NULL,
  audttime NUMBER(9) NOT NULL,
  audtuser VARCHAR2(8 BYTE) NOT NULL,
  audtorg CHAR(6 BYTE) NOT NULL,
  "VALUE" CHAR(60 BYTE) NOT NULL,
  "TYPE" NUMBER(*,0) NOT NULL,
  "LENGTH" NUMBER(*,0) NOT NULL,
  decimals NUMBER(*,0) NOT NULL,
  allownull NUMBER(*,0) NOT NULL,
  "VALIDATE" NUMBER(*,0) NOT NULL,
  swset NUMBER(*,0) NOT NULL,
  CONSTRAINT arcuso_pk PRIMARY KEY (idcust,optfield,audtorg)
);