CREATE TABLE phenix.vendor_sales_incentives (
  vsi_code NUMBER(10) NOT NULL,
  vsi_start_date DATE,
  vsi_end_date DATE,
  vsi_creation_date DATE NOT NULL,
  vsi_description VARCHAR2(30 BYTE) NOT NULL,
  vsi_alt_description VARCHAR2(30 BYTE),
  vsi_billing_method VARCHAR2(1 BYTE) DEFAULT 'C' NOT NULL CONSTRAINT vsi_billing_method_ck CHECK (VSI_BILLING_METHOD IN ('C','N','M')),
  vsi_billing_cycle NUMBER(3),
  vsi_date_last_billed DATE,
  vsi_refund_type_flag VARCHAR2(2 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT vsi_refund_type_flag_ck CHECK (VSI_REFUND_TYPE_FLAG IN ('R','P')),
  vsi_points_switch NUMBER(1) DEFAULT 0 NOT NULL,
  vsi_freegood_prf_prd_code VARCHAR2(10 BYTE),
  vsi_freegood_prf_fmt_code VARCHAR2(10 BYTE),
  vsi_freegood_replaced_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT vsi_billing_cycle_ck CHECK ((VSI_BILLING_METHOD = 'C' AND VSI_BILLING_CYCLE > 0) OR VSI_BILLING_CYCLE IS  NULL ),
  CONSTRAINT vsi_pk PRIMARY KEY (vsi_code),
  CONSTRAINT vsi_freegood_prf_fk FOREIGN KEY (vsi_freegood_prf_prd_code,vsi_freegood_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_code IS 'Indique le code de la prime fournisseur à la vente';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_start_date IS 'Indique la date début de la prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_end_date IS 'Indique la date fin de la prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_creation_date IS 'Indique la date de la création';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_description IS 'Indique la description de la prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_alt_description IS 'Indique la description alternative de la prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_billing_method IS 'Indique la méthode des refacturations en mois ou selon le cycle C: cycle, N: aucun, M: mensuelle';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_billing_cycle IS 'Indique la fréquence des refacturations en jours si la méthode est selon le cycle';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_date_last_billed IS 'Indique la dernière date de refacturation';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_refund_type_flag IS 'Indique le type de remboursement P: à payer, R: à recevoir';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_points_switch IS 'Indique si le montant qui sera accordé pour la prime s''afichera en points';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_freegood_prf_prd_code IS 'Indique le produit de gratuité qui sera accordé pour cette prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_freegood_prf_fmt_code IS 'Indique le format de gratuité qui sera accordé pour cette prime';
COMMENT ON COLUMN phenix.vendor_sales_incentives.vsi_freegood_replaced_switch IS 'Indique si la gratuité peut être remplacée par un des produits participants à la prime au cas ou il n''est pas disponible';