CREATE TABLE phenix.formulas (
  for_id NUMBER(15) NOT NULL,
  for_name VARCHAR2(64 BYTE) NOT NULL,
  for_visible_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT for_visible_ck CHECK (FOR_VISIBLE_SWITCH IN (0,1)),
  CONSTRAINT for_pk PRIMARY KEY (for_id),
  CONSTRAINT for_uk UNIQUE (for_name)
);