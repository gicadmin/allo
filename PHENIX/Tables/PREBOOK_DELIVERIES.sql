CREATE TABLE phenix.prebook_deliveries (
  pbd_id NUMBER(15) NOT NULL,
  pbd_cpr_id NUMBER(15),
  pbd_delivery_date DATE NOT NULL,
  pbd_vpr_id NUMBER(15),
  CONSTRAINT pbd_cpr_vpr_ck CHECK ((PBD_VPR_ID is not NULL and
PBD_CPR_ID is  NULL) or
(PBD_VPR_ID is NULL and
PBD_CPR_ID is not NULL)),
  CONSTRAINT pbd_pk PRIMARY KEY (pbd_id),
  CONSTRAINT pbd_cpr_fk FOREIGN KEY (pbd_cpr_id) REFERENCES phenix.customer_promotions (cpr_id) ON DELETE CASCADE,
  CONSTRAINT pbd_vpr_fk FOREIGN KEY (pbd_vpr_id) REFERENCES phenix.vendor_promotions (vpr_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.prebook_deliveries IS 'Date de livraison rélié au commandes bulletins';
COMMENT ON COLUMN phenix.prebook_deliveries.pbd_id IS 'Numéro d''identifiant de livraison de bulletin';
COMMENT ON COLUMN phenix.prebook_deliveries.pbd_cpr_id IS 'Numéro du type de la promotion client';
COMMENT ON COLUMN phenix.prebook_deliveries.pbd_delivery_date IS 'Date de livraison du bulletin';
COMMENT ON COLUMN phenix.prebook_deliveries.pbd_vpr_id IS 'Numéro du type de la promotion fournisseur';