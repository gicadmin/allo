CREATE GLOBAL TEMPORARY TABLE phenix.temporary_vendor_benefits (
  tvb_dvn_code NUMBER(3) NOT NULL,
  tvb_dvn_description VARCHAR2(30 BYTE) NOT NULL,
  tvb_ven_code NUMBER(5) NOT NULL,
  tvb_ven_name VARCHAR2(30 BYTE) NOT NULL,
  tvb_prd_code VARCHAR2(10 BYTE),
  tvb_list_price NUMBER(7,2),
  tvb_affect_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_no_affect_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_terms_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_avr_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_transport_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_member_coop_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_case_amount_w NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_affect_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_no_affect_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_terms_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_avr_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_transport_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_member_coop_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL,
  tvb_case_amount_d NUMBER(12,4) DEFAULT 0 NOT NULL
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_vendor_benefits IS 'Table utilisée pour la génération d''un fichier .CSV pour le calcul de la rentabilité fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_dvn_code IS 'Indique la division comptable du fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_dvn_description IS 'Indique la description de la division comptable du fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_ven_code IS 'Indique le code du fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_ven_name IS 'Indique le nom du fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_prd_code IS 'Indique le code du produit.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_list_price IS 'Indique le prix de liste du fournisseur.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_affect_amount_w IS 'Indique le montant de l''entente affectant la marge d''escompte - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_no_affect_amount_w IS 'Indique le montant de l''entente fournisseur - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_terms_amount_w IS 'Indique le montant des termes - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_avr_amount_w IS 'Indique le montant d''AVR - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_transport_amount_w IS 'Indique le montant des allocations de transport - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_member_coop_amount_w IS 'Indique le montant des membres COOP - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_case_amount_w IS 'Indique le montant de la provision pour l''entente sur la base de caisse - Entrepôt.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_affect_amount_d IS 'Indique le montant de l''entente affectant la marge d''escompte - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_no_affect_amount_d IS 'Indique le montant de l''entente fournisseur - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_terms_amount_d IS 'Indique le montant des termes - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_avr_amount_d IS 'Indique le montant d''AVR - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_transport_amount_d IS 'Indique le montant des allocations de transport - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_member_coop_amount_d IS 'Indique le montant des membres COOP - Drop.';
COMMENT ON COLUMN phenix.temporary_vendor_benefits.tvb_case_amount_d IS 'Indique le montant de la provision pour l''entente sur la base de caisse - Drop.';