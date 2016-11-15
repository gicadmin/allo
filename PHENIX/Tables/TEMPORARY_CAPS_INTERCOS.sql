CREATE TABLE phenix.temporary_caps_intercos (
  tci_tcd_id NUMBER(15) NOT NULL,
  tci_whs_code VARCHAR2(2 BYTE) NOT NULL,
  tci_ordered_quantity NUMBER(7),
  tci_ordered_weight NUMBER(9,3),
  CONSTRAINT tci_tcd_fk FOREIGN KEY (tci_tcd_id) REFERENCES phenix.temporary_caps_details (tcd_id) ON DELETE CASCADE,
  CONSTRAINT tci_whs_fk FOREIGN KEY (tci_whs_code) REFERENCES phenix.warehouses (whs_code) ON DELETE CASCADE
);