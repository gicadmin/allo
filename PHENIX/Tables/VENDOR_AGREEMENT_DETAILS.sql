CREATE TABLE phenix.vendor_agreement_details (
  ved_id NUMBER(15) NOT NULL,
  ved_vsa_code NUMBER(10) NOT NULL,
  ved_agreement_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT ved_agreement_type_ck CHECK (VED_AGREEMENT_TYPE IN ('GC', 'GP', 'VO', 'VP')),
  ved_cost_used NUMBER(1) NOT NULL CONSTRAINT ved_cost_used_ck CHECK (VED_COST_USED IN (1, 2, 3, 4, 5, 6, 7, 8, 9)),
  ved_bill_to_vendor_switch NUMBER(1) NOT NULL CONSTRAINT ved_bill_to_vendor_switch_ck CHECK (VED_BILL_TO_VENDOR_SWITCH IN (0, 1)),
  ved_pgr_code NUMBER(5),
  ved_prf_prd_code VARCHAR2(10 BYTE),
  ved_prf_fmt_code VARCHAR2(7 BYTE),
  ved_agreement_amount NUMBER(7,2),
  ved_agreement_percent NUMBER(6,3),
  ved_end_date DATE,
  ved_start_date DATE,
  ved_guaranteed_cost NUMBER(7,2),
  ved_exclude_in_selling_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ved_exclude_in_selling_swi_ck CHECK (VED_EXCLUDE_IN_SELLING_SWITCH IN (0, 1)),
  ved_exclude_in_qtd_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ved_exclude_in_qtd_switch_ck CHECK (VED_EXCLUDE_IN_QTD_SWITCH IN (0, 1)),
  ved_creation_date DATE DEFAULT SYSDATE NOT NULL,
  ved_modification_date DATE DEFAULT SYSDATE NOT NULL,
  ved_use_modification_code NUMBER(5),
  CONSTRAINT ved_amount_percent_ck CHECK ((VED_AGREEMENT_AMOUNT is not NULL and
VED_AGREEMENT_PERCENT is NULL and
VED_GUARANTEED_COST is NULL) or
(VED_AGREEMENT_AMOUNT is NULL and
VED_AGREEMENT_PERCENT is not NULL and
VED_GUARANTEED_COST is NULL) or
(VED_AGREEMENT_AMOUNT is NULL and
VED_AGREEMENT_PERCENT is NULL and
VED_GUARANTEED_COST is not NULL)),
  CONSTRAINT ved_product_group_ck CHECK ((VED_PRF_PRD_CODE is not NULL and
VED_PRF_FMT_CODE is not NULL and
VED_PGR_CODE is NULL) or
(VED_PRF_PRD_CODE is NULL and
VED_PRF_FMT_CODE is NULL and
VED_PGR_CODE is not NULL)),
  CONSTRAINT ved_pk PRIMARY KEY (ved_id),
  CONSTRAINT ved_pgr_fk FOREIGN KEY (ved_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT ved_prf_fk FOREIGN KEY (ved_prf_prd_code,ved_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT ved_use_modification_code_fk FOREIGN KEY (ved_use_modification_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ved_vsa_fk FOREIGN KEY (ved_vsa_code) REFERENCES phenix.vendor_sales_agreements (vsa_code)
);
COMMENT ON TABLE phenix.vendor_agreement_details IS 'Détails des ententes pour les ventes des fournisseurs';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_id IS 'Indique l''identifiant unique (ID) de l''enregistrement';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_vsa_code IS 'Indique le code de l''entente fournisseur à la vente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_agreement_type IS 'Indique le type d''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_cost_used IS 'Indique le coûtant utilisé pour l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_bill_to_vendor_switch IS 'Indique si l''entente est du type rachat de facture (facturé au fournisseur)';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_prf_fmt_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_agreement_amount IS 'Indique le montant de l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_agreement_percent IS 'Indique le pourcentage de l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_end_date IS 'Indique la date de fin de l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_start_date IS 'Indique la date de début de l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_guaranteed_cost IS 'Indique le coûtant garanti par le manufacturier';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_exclude_in_selling_switch IS 'Indique si l''entente est volontairement excluse du calcul de prix de vente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_exclude_in_qtd_switch IS 'Indique si l''entente est exclue des soumissions ';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_creation_date IS 'Indique la date de création de la ligne de détail de l''entente';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_modification_date IS 'Indique la date à laquelle la ligne de détail de l''entente a été modifiée';
COMMENT ON COLUMN phenix.vendor_agreement_details.ved_use_modification_code IS 'Indique le code de l''utilisateur ayant effectué la dernière modification ou la création de la ligne de détail de l''entente';