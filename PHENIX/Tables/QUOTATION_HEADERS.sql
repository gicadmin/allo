CREATE TABLE phenix.quotation_headers (
  qth_id NUMBER(8) NOT NULL,
  qth_end_date DATE NOT NULL,
  qth_price_change_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  qth_promotion_percent NUMBER(6,3) NOT NULL,
  qth_start_date DATE NOT NULL,
  qth_cus_code NUMBER(10),
  qth_qty_code NUMBER(5),
  qth_interval NUMBER(6),
  qth_renewal_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT qth_renewal_flag_ck CHECK (QTH_RENEWAL_FLAG IN ('R', 'E', 'M', 'T')),
  qth_recalc_lead_days NUMBER(3),
  qth_recalculated_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qth_recalculated_switch_ck CHECK (QTH_RECALCULATED_SWITCH IN (0, 1)),
  qth_agreement_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  qth_naz_nac_code NUMBER(4),
  qth_naz_zone_code NUMBER(3),
  qth_synchronization_id NUMBER(15),
  qth_recalculate_promo_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qth_recalculate_promo_swi_ck CHECK (QTH_RECALCULATE_PROMO_SWITCH in (0, 1)),
  qth_external_identifier VARCHAR2(15 BYTE),
  qth_description VARCHAR2(30 BYTE) NOT NULL,
  qth_contract_start_date DATE NOT NULL,
  qth_contract_end_date DATE NOT NULL,
  qth_display_in_caps_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qth_display_in_caps_switch_ck CHECK (QTH_DISPLAY_IN_CAPS_SWITCH IN (0,1)),
  qth_id_origin NUMBER(8),
  CONSTRAINT qth_national_account_ck CHECK ((QTH_NAZ_NAC_CODE IS NULL AND QTH_NAZ_ZONE_CODE IS NULL) OR
(QTH_NAZ_NAC_CODE IS NOT NULL AND QTH_NAZ_ZONE_CODE IS NOT NULL)),
  CONSTRAINT qth_recalcutlation_ck CHECK ((QTH_RECALC_LEAD_DAYS is NULL and
QTH_RENEWAL_FLAG in ('E', 'T')) or
(QTH_RECALC_LEAD_DAYS is not NULL and
QTH_RENEWAL_FLAG not in ('E', 'T')) or
(QTH_RECALC_LEAD_DAYS is NULL and
QTH_RENEWAL_FLAG not in ('E', 'T'))),
  CONSTRAINT qth_validation_ck CHECK ((QTH_CUS_CODE IS NOT NULL AND QTH_NAZ_NAC_CODE IS NULL AND QTH_NAZ_ZONE_CODE IS NULL AND QTH_QTY_CODE is null)
 	OR
	(QTH_CUS_CODE IS NULL AND QTH_NAZ_NAC_CODE IS NOT NULL AND QTH_NAZ_ZONE_CODE IS NOT NULL AND QTH_QTY_CODE is null)
	OR
	(QTH_CUS_CODE IS NULL AND QTH_NAZ_NAC_CODE IS NULL AND QTH_NAZ_ZONE_CODE IS NULL AND QTH_QTY_CODE is NOT null)),
  CONSTRAINT qth_pk PRIMARY KEY (qth_id),
  CONSTRAINT qth_cus_fk FOREIGN KEY (qth_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT qth_naz_fk FOREIGN KEY (qth_naz_nac_code,qth_naz_zone_code) REFERENCES phenix.national_account_zones (naz_nac_code,naz_zone_code),
  CONSTRAINT qth_qty_fk FOREIGN KEY (qth_qty_code) REFERENCES phenix.quotation_types (qty_code)
);
COMMENT ON TABLE phenix.quotation_headers IS 'Entête des soumissions';
COMMENT ON COLUMN phenix.quotation_headers.qth_id IS 'Numéro d''entête de soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_end_date IS 'Date de fin';
COMMENT ON COLUMN phenix.quotation_headers.qth_price_change_percent IS 'Pourcentage de temps alloué pour un changement de prix';
COMMENT ON COLUMN phenix.quotation_headers.qth_promotion_percent IS 'Pourcentage de temps alloué pour qu''une promotion soit allouée';
COMMENT ON COLUMN phenix.quotation_headers.qth_start_date IS 'Date de début';
COMMENT ON COLUMN phenix.quotation_headers.qth_cus_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.quotation_headers.qth_qty_code IS 'Numéro de type de soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_interval IS 'Indique l''intervalle de séquence dans le bottin';
COMMENT ON COLUMN phenix.quotation_headers.qth_renewal_flag IS 'Extension de la soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_recalc_lead_days IS 'Le nombre de jours avant la fin de la soumission, lorsque la nouvelle soumission sera calculé';
COMMENT ON COLUMN phenix.quotation_headers.qth_recalculated_switch IS 'Indique si la soumission est recalculé';
COMMENT ON COLUMN phenix.quotation_headers.qth_agreement_percent IS 'Pourcentage accordé selon un accord de vente';
COMMENT ON COLUMN phenix.quotation_headers.qth_naz_nac_code IS 'Indique le compte national de la soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_naz_zone_code IS 'Indique la zone du compte national de la soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.quotation_headers.qth_recalculate_promo_switch IS 'Indique si la soumission sera recalculée quotidiennement pour tenir compte des nouvelles promotions';
COMMENT ON COLUMN phenix.quotation_headers.qth_external_identifier IS 'Indique l''identifiant de la soumission pour les ententes de Coke';
COMMENT ON COLUMN phenix.quotation_headers.qth_description IS 'Indique la description de la soumission';
COMMENT ON COLUMN phenix.quotation_headers.qth_contract_start_date IS 'Indique la date de début du contrat';
COMMENT ON COLUMN phenix.quotation_headers.qth_contract_end_date IS 'Indique la date de fin du contrat';
COMMENT ON COLUMN phenix.quotation_headers.qth_display_in_caps_switch IS 'Indique si cette soumission est affichée dans CAPS';
COMMENT ON COLUMN phenix.quotation_headers.qth_id_origin IS 'Indique le ID de la soumission d’origine lorsque la soumission est créee par tâche colabor';