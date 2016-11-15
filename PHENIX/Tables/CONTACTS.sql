CREATE TABLE phenix.contacts (
  "CON_ID" NUMBER(5) NOT NULL,
  con_cty_code VARCHAR2(3 BYTE) NOT NULL,
  con_first_name VARCHAR2(30 BYTE) NOT NULL,
  con_last_name VARCHAR2(30 BYTE) NOT NULL,
  con_cus_code NUMBER(10),
  con_ven_code NUMBER(5),
  con_email VARCHAR2(80 BYTE),
  con_extension NUMBER(5),
  con_extension_2 NUMBER(5),
  con_fax NUMBER(11),
  con_remark VARCHAR2(200 BYTE),
  con_telephone NUMBER(11),
  con_telephone_2 NUMBER(11),
  con_password VARCHAR2(30 BYTE),
  con_print_badge_report_switch NUMBER(1) DEFAULT 0 CONSTRAINT con_print_badge_report_swi_ck CHECK (con_print_badge_report_switch IN (0, 1)),
  CONSTRAINT con_telephone_2_ck CHECK ((CON_TELEPHONE_2 is NULL and
CON_EXTENSION_2 is NULL) or
(CON_TELEPHONE_2 is not NULL and
CON_EXTENSION_2 is NULL) or
(CON_TELEPHONE_2 is not NULL and
CON_EXTENSION_2 is not NULL)),
  CONSTRAINT con_telephone_ck CHECK ((CON_TELEPHONE is NULL and
CON_EXTENSION is NULL) or
(CON_TELEPHONE is not NULL and
CON_EXTENSION is NULL) or
(CON_TELEPHONE is not NULL and
CON_EXTENSION is not NULL)),
  CONSTRAINT con_vendor_customer_code_ck CHECK ((CON_VEN_CODE is not NULL and
 CON_CUS_CODE is NULL) or
(CON_VEN_CODE is  NULL and
 CON_CUS_CODE is not NULL)),
  CONSTRAINT con_pk PRIMARY KEY ("CON_ID"),
  CONSTRAINT con_cty_fk FOREIGN KEY (con_cty_code) REFERENCES phenix.contact_types (cty_code),
  CONSTRAINT con_cus_fk FOREIGN KEY (con_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT con_ven_fk FOREIGN KEY (con_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.contacts IS 'Le contact est une personne qui est le lien entre la compagnie, des fournisseurs ou des clients';
COMMENT ON COLUMN phenix.contacts."CON_ID" IS 'Indique le numéro d''identification unique (ID) du contact';
COMMENT ON COLUMN phenix.contacts.con_cty_code IS 'Indique le code du type de contact';
COMMENT ON COLUMN phenix.contacts.con_first_name IS 'Indique le prénom du contact';
COMMENT ON COLUMN phenix.contacts.con_last_name IS 'Indique le nom de famille du contact';
COMMENT ON COLUMN phenix.contacts.con_cus_code IS 'Indique le code du client auquel est rattaché ce contact';
COMMENT ON COLUMN phenix.contacts.con_ven_code IS 'Indique le code du fournisseur auquel est rattaché ce contact';
COMMENT ON COLUMN phenix.contacts.con_email IS 'Indique l''adresse de courriel du contact';
COMMENT ON COLUMN phenix.contacts.con_extension IS 'Indique l''extension du numéro de téléphone du contact';
COMMENT ON COLUMN phenix.contacts.con_extension_2 IS 'Indique l''extension du numéro de téléphone 2 du contact';
COMMENT ON COLUMN phenix.contacts.con_fax IS 'Indique le numéro de télécopieur du contact';
COMMENT ON COLUMN phenix.contacts.con_remark IS 'Indique les commentaires sur le contact';
COMMENT ON COLUMN phenix.contacts.con_telephone IS 'Indique le numéro de téléphone du contact';
COMMENT ON COLUMN phenix.contacts.con_telephone_2 IS 'Indique le numéro de téléphone 2 du contact';
COMMENT ON COLUMN phenix.contacts.con_password IS 'Indique le mot de passe du contact ';
COMMENT ON COLUMN phenix.contacts.con_print_badge_report_switch IS 'Indique si le contact sera imprimé sur le rapport des badges';