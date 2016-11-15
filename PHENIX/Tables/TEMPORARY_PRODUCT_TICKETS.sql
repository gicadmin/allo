CREATE GLOBAL TEMPORARY TABLE phenix.temporary_product_tickets (
  trt_times NUMBER(10)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_product_tickets IS 'Table temporaire pour le rapport RAP_ETIQUETTE';
COMMENT ON COLUMN phenix.temporary_product_tickets.trt_times IS 'Pour controler le nombre de fois qu''on affichera un produit dans le rapport';