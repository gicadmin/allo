CREATE TABLE phenix.hold_asn_headers (
  hah_id NUMBER(15) NOT NULL,
  hah_ccr_code NUMBER(5),
  hah_purch_ven_code NUMBER(5),
  hah_purch_vendor_code VARCHAR2(15 BYTE),
  hah_input_date VARCHAR2(8 BYTE),
  hah_date DATE,
  hah_reference_number VARCHAR2(15 BYTE),
  hah_whs_member_id VARCHAR2(15 BYTE),
  hah_whs_code VARCHAR2(2 BYTE),
  hah_is_part_transfered_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT hah_is_part_transfered_swit_ck CHECK (HAH_IS_PART_TRANSFERED_SWITCH IN (0,1)),
  CONSTRAINT hah_id_pk PRIMARY KEY (hah_id)
);
COMMENT ON TABLE phenix.hold_asn_headers IS 'Contient les avis de réception reçus par EDI qui sont en train d''entrer dans le système mais on peut-être encore des erreurs.';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_id IS 'Indique le ID de la transaction (numéro séquentiel interne)';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_purch_ven_code IS 'Indique le code du fournisseur à l''achat';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_purch_vendor_code IS 'Indique le code du fournisseur à l''achat tel que lu dans le fichier';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_input_date IS 'Indique la date de l''avis de réception telle que lu dans le fichier';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_date IS 'Indique la date de l''avis de réception';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_reference_number IS 'Indique le numéro de référence de l''avis de réception';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_whs_member_id IS 'Indique le numéro de membre tel que lu dans le fichier EDI';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_whs_code IS 'Indique l''entrepôt concerné par ce ASN';
COMMENT ON COLUMN phenix.hold_asn_headers.hah_is_part_transfered_switch IS 'Indique si le HAH est partiellement transféré';