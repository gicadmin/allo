CREATE TABLE phenix.credit_types (
  crt_code NUMBER(3) NOT NULL,
  crt_description VARCHAR2(30 BYTE) NOT NULL,
  crt_debit_switch NUMBER(1) NOT NULL CONSTRAINT crt_debit_switch_ck CHECK (CRT_DEBIT_SWITCH IN (0, 1)),
  crt_invoice_required_switch NUMBER(1) NOT NULL CONSTRAINT crt_invoice_required_switch_ck CHECK (CRT_INVOICE_REQUIRED_SWITCH IN (0, 1)),
  crt_override_switch NUMBER(1) NOT NULL CONSTRAINT crt_override_switch_ck CHECK (CRT_OVERRIDE_SWITCH IN (0, 1)),
  crt_same_format_switch NUMBER(1) NOT NULL CONSTRAINT crt_same_format_switch_ck CHECK (CRT_SAME_FORMAT_SWITCH IN (0, 1)),
  crt_same_product_switch NUMBER(1) NOT NULL CONSTRAINT crt_same_product_switch_ck CHECK (CRT_SAME_PRODUCT_SWITCH IN (0, 1)),
  crt_service_charge_switch NUMBER(1) NOT NULL CONSTRAINT crt_service_charge_switch_ck CHECK (CRT_SERVICE_CHARGE_SWITCH IN (0, 1)),
  crt_alt_description VARCHAR2(30 BYTE),
  crt_wms_interface_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT crt_wms_interface_flag_ck CHECK (CRT_WMS_INTERFACE_FLAG IN ('I', 'E', 'N')),
  crt_credit_days NUMBER(3),
  crt_allow_telemarketer_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crt_allow_telemarketer_swit_ck CHECK (CRT_ALLOW_TELEMARKETER_SWITCH IN (0, 1)),
  crt_debit_only_switch NUMBER(1) DEFAULT 0 NOT NULL,
  crt_damaged_goods_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crt_damaged_goods_switch_ck CHECK (CRT_DAMAGED_GOODS_SWITCH IN (0, 1)),
  crt_picker_error_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crt_picker_error_switch_ck CHECK (CRT_PICKER_ERROR_SWITCH IN (0, 1)),
  crt_apply_consignments_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT crt_apply_consign_switch_ck CHECK (CRT_APPLY_CONSIGNMENTS_SWITCH IN (1,0)),
  crt_override_password_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crt_override_psswrd_switch_ck CHECK (CRT_OVERRIDE_PASSWORD_SWITCH IN (0,1)),
  crt_print_rma_flag VARCHAR2(3 BYTE) NOT NULL CONSTRAINT crt_print_rma_flag_ck CHECK (crt_print_rma_flag IN ('NEV','ONE','ALL')),
  crt_return_only_switch NUMBER(1) DEFAULT 0 NOT NULL,
  crt_perishable_return_switch NUMBER(1) DEFAULT 0 NOT NULL,
  crt_allow_cash_n_carry_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crt_allow_cash_n_carry_swi_ck CHECK (crt_allow_cash_n_carry_switch IN (0, 1)),
  CONSTRAINT crt_debit_check_ck CHECK ((CRT_DEBIT_SWITCH = 1 and
 CRT_SAME_PRODUCT_SWITCH = 1) or
(CRT_DEBIT_SWITCH = 1 and
 CRT_SAME_FORMAT_SWITCH = 1) or
(CRT_DEBIT_SWITCH = 1 and
 CRT_SAME_PRODUCT_SWITCH = 0) or
(CRT_DEBIT_SWITCH = 1 and
 CRT_SAME_FORMAT_SWITCH = 0) or
((CRT_DEBIT_SWITCH =0 and
 CRT_SAME_PRODUCT_SWITCH = 0  )and
(CRT_DEBIT_SWITCH = 0 and
 CRT_SAME_FORMAT_SWITCH = 0))),
  CONSTRAINT crt_invoice_req_for_delay_ck CHECK ((CRT_INVOICE_REQUIRED_SWITCH = 0 and
CRT_CREDIT_DAYS is NULL) or
(CRT_INVOICE_REQUIRED_SWITCH = 1)),
  CONSTRAINT crt_perishable_return_swi_ck CHECK ((CRT_PERISHABLE_RETURN_SWITCH = 0) OR (CRT_PERISHABLE_RETURN_SWITCH = 1 AND CRT_INVOICE_REQUIRED_SWITCH = 1 AND CRT_SAME_PRODUCT_SWITCH = 0 AND CRT_SAME_FORMAT_SWITCH = 0 AND CRT_OVERRIDE_SWITCH  = 1
 AND CRT_SERVICE_CHARGE_SWITCH = 0 AND CRT_WMS_INTERFACE_FLAG = 'N' AND CRT_DEBIT_ONLY_SWITCH = 0 AND CRT_APPLY_CONSIGNMENTS_SWITCH = 0 AND CRT_RETURN_ONLY_SWITCH = 0)),
  CONSTRAINT crt_return_only_switch_ck CHECK ((CRT_RETURN_ONLY_SWITCH = 0) OR (CRT_RETURN_ONLY_SWITCH = 1 AND CRT_INVOICE_REQUIRED_SWITCH = 0 AND CRT_SAME_PRODUCT_SWITCH = 0 AND CRT_SAME_FORMAT_SWITCH = 0 AND CRT_OVERRIDE_SWITCH  = 0
 AND CRT_SERVICE_CHARGE_SWITCH = 0 AND CRT_WMS_INTERFACE_FLAG = 'I' AND CRT_DEBIT_ONLY_SWITCH = 0 AND CRT_APPLY_CONSIGNMENTS_SWITCH = 0 AND CRT_PERISHABLE_RETURN_SWITCH = 0)),
  CONSTRAINT crt_pk PRIMARY KEY (crt_code)
);
COMMENT ON TABLE phenix.credit_types IS 'Type de crédit';
COMMENT ON COLUMN phenix.credit_types.crt_code IS 'Numéro du type de crédit';
COMMENT ON COLUMN phenix.credit_types.crt_description IS 'Description';
COMMENT ON COLUMN phenix.credit_types.crt_debit_switch IS 'Indique si on ajoute un ligne de débit';
COMMENT ON COLUMN phenix.credit_types.crt_invoice_required_switch IS 'Indique si un numéro de facture est exigée';
COMMENT ON COLUMN phenix.credit_types.crt_override_switch IS 'Indique si les biens endommagés sont acceptés';
COMMENT ON COLUMN phenix.credit_types.crt_same_format_switch IS 'Indique si la ligne de débit est du même format que celle de crédit';
COMMENT ON COLUMN phenix.credit_types.crt_same_product_switch IS 'Indique si la ligne de débit est du même produit que celle de crédit';
COMMENT ON COLUMN phenix.credit_types.crt_service_charge_switch IS 'Indique si il y a un fras de service';
COMMENT ON COLUMN phenix.credit_types.crt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.credit_types.crt_wms_interface_flag IS 'Indique si le type envoie un record d''interface au WMS pour recevoir la marchandise';
COMMENT ON COLUMN phenix.credit_types.crt_credit_days IS 'Nombre de jour permis entre la facture original et la note de crédit';
COMMENT ON COLUMN phenix.credit_types.crt_allow_telemarketer_switch IS 'Indique si le type peut appliqué si la note de crédit est généré à partir d''un module de Televente';
COMMENT ON COLUMN phenix.credit_types.crt_debit_only_switch IS 'Ce type de crédit insère une ligne de débit seulement (sans avoir une ligne de crédit associée).';
COMMENT ON COLUMN phenix.credit_types.crt_damaged_goods_switch IS 'Indique si le type de crédit concerne des produits endommagés';
COMMENT ON COLUMN phenix.credit_types.crt_picker_error_switch IS 'Indique si c''est une erreur du cueilleur.';
COMMENT ON COLUMN phenix.credit_types.crt_apply_consignments_switch IS 'Indique si la consigne sera créditée lors du crédit de la facture';
COMMENT ON COLUMN phenix.credit_types.crt_override_password_switch IS 'Indique si l''entré du crédit requiert un mot de passe lors d''une modification de prix';
COMMENT ON COLUMN phenix.credit_types.crt_print_rma_flag IS 'Indique la manière que la RMA est imprimée.';
COMMENT ON COLUMN phenix.credit_types.crt_return_only_switch IS 'Indique si le type de crédit est relié à un retour de marchandise avec aucun montant de crédit ou débit';
COMMENT ON COLUMN phenix.credit_types.crt_perishable_return_switch IS 'Indique si le type de crédit est relié à un retour de marchandise périssable';
COMMENT ON COLUMN phenix.credit_types.crt_allow_cash_n_carry_switch IS 'Indique si le type de credit s''applique sur les payer et emporter aussi';