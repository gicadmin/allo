CREATE TABLE phenix.match_detail_rebills (
  mdr_id NUMBER(15) NOT NULL,
  mdr_mad_ap_invoice_number NUMBER(15) NOT NULL,
  mdr_mad_line_number NUMBER(6) NOT NULL,
  mdr_pod_poh_id NUMBER(15) NOT NULL,
  mdr_pod_line_number NUMBER(4) NOT NULL,
  mdr_pdi_dit_code NUMBER(3),
  mdr_pdi_ven_code NUMBER(5),
  mdr_billback_type NUMBER(1) CONSTRAINT mdr_billback_type_ck CHECK ( MDR_BILLBACK_TYPE IN (1,2,3)),
  CONSTRAINT mdr_pod_pdi_ck CHECK (MDR_BILLBACK_TYPE IS NOT NULL OR (MDR_PDI_DIT_CODE IS NOT NULL AND MDR_PDI_VEN_CODE IS NOT NULL)),
  CONSTRAINT mdr_pk PRIMARY KEY (mdr_id) USING INDEX (CREATE INDEX phenix.mdr_pk ON phenix.match_detail_rebills(mdr_id)    ),
  CONSTRAINT mdr_mad_fk FOREIGN KEY (mdr_mad_ap_invoice_number,mdr_mad_line_number) REFERENCES phenix.match_details (mad_mah_ap_invoice_number,mad_line_number),
  CONSTRAINT mdr_pdi_fk FOREIGN KEY (mdr_pod_poh_id,mdr_pod_line_number,mdr_pdi_dit_code,mdr_pdi_ven_code) REFERENCES phenix.purchase_order_discounts (pdi_pod_poh_id,pdi_pod_line_number,pdi_dit_code,pdi_ven_code),
  CONSTRAINT mdr_pod_fk FOREIGN KEY (mdr_pod_poh_id,mdr_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number)
);