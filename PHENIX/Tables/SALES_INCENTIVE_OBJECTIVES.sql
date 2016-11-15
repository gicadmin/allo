CREATE TABLE phenix.sales_incentive_objectives (
  sio_vsi_code NUMBER(10) NOT NULL,
  sio_min_objective NUMBER(7,2) NOT NULL,
  sio_distributed_amount NUMBER(7,2),
  sio_collected_amount NUMBER(7,2),
  sio_freegood_quantity NUMBER(7),
  sio_id NUMBER(5) NOT NULL,
  CONSTRAINT sio_quantity_or_amount_ck CHECK ((SIO_FREEGOOD_QUANTITY IS NULL AND SIO_DISTRIBUTED_AMOUNT IS NOT NULL) OR (SIO_FREEGOOD_QUANTITY IS NOT NULL AND SIO_DISTRIBUTED_AMOUNT IS NULL)),
  CONSTRAINT sio_pk PRIMARY KEY (sio_id),
  CONSTRAINT sio_vsi_fk FOREIGN KEY (sio_vsi_code) REFERENCES phenix.vendor_sales_incentives (vsi_code)
);
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_vsi_code IS 'Indique le code de la prime à la vente';
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_min_objective IS 'Indique la valeur minimale comme quantité du produit vendu';
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_distributed_amount IS 'Indique le montant en dollars qui sera accordé pour la quantité entre le minimum et le maximum';
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_collected_amount IS 'Indique le montant en dollars qui sera reclamé pour la quantité entre le minimum et le maximum';
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_freegood_quantity IS 'Indique la quantité du produit de gratuité qui sera accordé pour l''échelle';
COMMENT ON COLUMN phenix.sales_incentive_objectives.sio_id IS 'Indique l''identifiant de la table';