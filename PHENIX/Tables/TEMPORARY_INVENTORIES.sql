CREATE TABLE phenix.temporary_inventories (
  tiv_lty_whs_code VARCHAR2(2 BYTE),
  tiv_inv_prf_prd_code VARCHAR2(10 BYTE),
  tiv_inv_prf_fmt_code VARCHAR2(7 BYTE),
  tiv_inv_loc_code VARCHAR2(12 BYTE),
  tiv_prd_to_spec_order_switch NUMBER(1) CONSTRAINT tiv_prd_to_spec_order_swit_ck CHECK (tiv_prd_to_spec_order_switch in (0, 1))
);
COMMENT ON COLUMN phenix.temporary_inventories.tiv_lty_whs_code IS 'Indique le code del''entrepôt';
COMMENT ON COLUMN phenix.temporary_inventories.tiv_inv_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_inventories.tiv_inv_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_inventories.tiv_inv_loc_code IS 'Indique le numéro de la localisation';
COMMENT ON COLUMN phenix.temporary_inventories.tiv_prd_to_spec_order_switch IS 'Indique que le produit deviendra un produit spécial lorsque l''inventaire sera vidé';