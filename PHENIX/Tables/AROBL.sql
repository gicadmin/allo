CREATE TABLE phenix.arobl (
  idcust VARCHAR2(12 BYTE) NOT NULL,
  idinvc VARCHAR2(22 BYTE) NOT NULL,
  audtorg VARCHAR2(6 BYTE) NOT NULL,
  audtdate NUMBER(9) NOT NULL,
  datedue NUMBER(9) NOT NULL,
  idnatacct VARCHAR2(12 BYTE) NOT NULL,
  trxtypetxt NUMBER(*,0) NOT NULL,
  codeterm VARCHAR2(6 BYTE) NOT NULL,
  amtduehc NUMBER(19,3) NOT NULL,
  amtinvchc NUMBER(19,3) NOT NULL,
  amttax1hc NUMBER(19,3) NOT NULL,
  amttax2hc NUMBER(19,3) NOT NULL,
  swpaid NUMBER(*,0) NOT NULL,
  dateinvc NUMBER(9) NOT NULL,
  amttxblhc NUMBER(19,3) NOT NULL,
  amtnontxhc NUMBER(19,3) NOT NULL,
  codeslsp1 VARCHAR2(8 BYTE) NOT NULL,
  CONSTRAINT arobl_pk PRIMARY KEY (idinvc,idcust,audtorg)
);