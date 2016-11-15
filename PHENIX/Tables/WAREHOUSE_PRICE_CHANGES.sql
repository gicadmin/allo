CREATE TABLE phenix.warehouse_price_changes (
  wpc_id NUMBER(15) NOT NULL,
  wpc_prw_prd_code VARCHAR2(10 BYTE) NOT NULL,
  wpc_prw_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wpc_effective_date DATE NOT NULL,
  wpc_posted_switch NUMBER(1) NOT NULL CONSTRAINT wpc_posted_switch_ck CHECK (WPC_POSTED_SWITCH IN (0, 1)),
  wpc_added_transp_amount NUMBER(11,6) NOT NULL,
  CONSTRAINT wpc_pk PRIMARY KEY (wpc_id),
  CONSTRAINT wpc_prw_fk FOREIGN KEY (wpc_prw_prd_code,wpc_prw_whs_code) REFERENCES phenix.product_warehouses (prw_prd_code,prw_whs_code)
);
COMMENT ON TABLE phenix.warehouse_price_changes IS 'Table utilisée pour maintenir les changements de prix du transport pour différents entrepôts';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_id IS 'Indique le code unique du changement de prix';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_prw_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_prw_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_effective_date IS 'Indique la date à laquelle le changement sera fait';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_posted_switch IS 'Indique si le changement de prix a été appliqué';
COMMENT ON COLUMN phenix.warehouse_price_changes.wpc_added_transp_amount IS 'Indique le nouveau montant de transport ajouté pour cet entrepôt';