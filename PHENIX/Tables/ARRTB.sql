CREATE TABLE phenix.arrtb (
  codeterm VARCHAR2(6 BYTE) NOT NULL,
  cntpaym NUMBER(5) NOT NULL,
  audtdate NUMBER(9) NOT NULL,
  audttime NUMBER(9) NOT NULL,
  audtuser VARCHAR2(8 BYTE) NOT NULL,
  audtorg VARCHAR2(6 BYTE) NOT NULL,
  datemntn NUMBER(9) NOT NULL,
  pctdue NUMBER(9,5) NOT NULL,
  disctype NUMBER(*,0) NOT NULL,
  pctdisc NUMBER(9,5) NOT NULL,
  numdays NUMBER(3) NOT NULL,
  discday NUMBER(3) NOT NULL,
  duetype NUMBER(*,0) NOT NULL,
  duedays NUMBER(3) NOT NULL,
  dueday NUMBER(3) NOT NULL,
  CONSTRAINT arrtb_pk PRIMARY KEY (codeterm,cntpaym)
);