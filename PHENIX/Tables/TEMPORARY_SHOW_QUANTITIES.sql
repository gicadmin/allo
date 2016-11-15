CREATE TABLE phenix.temporary_show_quantities (
  tsq_cus_code NUMBER(10),
  tsq_ven_code NUMBER(5),
  tsq_prf_prd_code VARCHAR2(10 BYTE),
  tsq_prf_fmt_code VARCHAR2(7 BYTE),
  tsq_quantity_original NUMBER(6),
  tsq_quantity NUMBER(6),
  tsq_cod_coh_id NUMBER(15),
  tsq_cod_line_number NUMBER(4)
);
COMMENT ON TABLE phenix.temporary_show_quantities IS 'Table utilisée pour le rapport des quantités modifiées du show';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_ven_code IS 'Indique le code fournisseur';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_prf_prd_code IS 'Indique si le code produit';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_prf_fmt_code IS 'Indique si le format du produit';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_quantity_original IS 'Indique la quantité originale commandée';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_quantity IS 'Indique la quantité modifiée';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_cod_coh_id IS 'Indique le numéro de la commande';
COMMENT ON COLUMN phenix.temporary_show_quantities.tsq_cod_line_number IS 'Indique le numéro de ligne de la commande';