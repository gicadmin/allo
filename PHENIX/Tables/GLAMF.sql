CREATE TABLE phenix.glamf (
  acctid VARCHAR2(45 BYTE) NOT NULL,
  audtdate NUMBER(9) NOT NULL,
  audttime NUMBER(9) NOT NULL,
  audtuser VARCHAR2(8 BYTE) NOT NULL,
  audtorg VARCHAR2(6 BYTE) NOT NULL,
  createdate NUMBER(9) NOT NULL,
  acctdesc VARCHAR2(60 BYTE) NOT NULL,
  accttype VARCHAR2(1 BYTE) NOT NULL,
  acctbal VARCHAR2(1 BYTE) NOT NULL,
  activesw NUMBER(*,0) NOT NULL,
  consldsw NUMBER(*,0) NOT NULL,
  qtysw NUMBER(*,0) NOT NULL,
  uom VARCHAR2(6 BYTE) NOT NULL,
  allocsw NUMBER(*,0) NOT NULL,
  acctofset VARCHAR2(45 BYTE) NOT NULL,
  acctsrty VARCHAR2(2 BYTE) NOT NULL,
  mcsw NUMBER(*,0) NOT NULL,
  specsw NUMBER(*,0) NOT NULL,
  acctgrpcod VARCHAR2(12 BYTE) NOT NULL,
  ctrlacctsw NUMBER(*,0) NOT NULL,
  srceldgid VARCHAR2(2 BYTE) NOT NULL,
  alloctot NUMBER(15,7) NOT NULL,
  abrkid VARCHAR2(6 BYTE) NOT NULL,
  yracctclos NUMBER(7) NOT NULL,
  acctfmttd VARCHAR2(45 BYTE) NOT NULL,
  acsegval01 VARCHAR2(15 BYTE) NOT NULL,
  acsegval02 VARCHAR2(15 BYTE) NOT NULL,
  acsegval03 VARCHAR2(15 BYTE) NOT NULL,
  acsegval04 VARCHAR2(15 BYTE) NOT NULL,
  acsegval05 VARCHAR2(15 BYTE) NOT NULL,
  acsegval06 VARCHAR2(15 BYTE) NOT NULL,
  acsegval07 VARCHAR2(15 BYTE) NOT NULL,
  acsegval08 VARCHAR2(15 BYTE) NOT NULL,
  acsegval09 VARCHAR2(15 BYTE) NOT NULL,
  acsegval10 VARCHAR2(15 BYTE) NOT NULL,
  acctsegval VARCHAR2(15 BYTE) NOT NULL,
  acctgrpscd VARCHAR2(12 BYTE) NOT NULL,
  postosegid VARCHAR2(6 BYTE) NOT NULL,
  defcurncod VARCHAR2(3 BYTE) NOT NULL,
  ovalues NUMBER(*,0) NOT NULL,
  tovalues NUMBER(*,0) NOT NULL,
  rollupsw NUMBER(*,0) NOT NULL,
  PRIMARY KEY (acctid) USING INDEX (CREATE UNIQUE INDEX phenix.glamf_pk ON phenix.glamf(acctid)    )
);