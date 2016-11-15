CREATE OR REPLACE FORCE VIEW phenix.v_daily_reception_volume (drv_whs_code,drv_reception_date,drv_use_code,drv_total_items) AS
(
  SELECT poh_whs_code                        drv_whs_code,
         poh_expected_recep_date             drv_reception_date,
         poh_use_code                        drv_use_code,
         SUM( NVL(pod_quantity_ordered, 1) ) drv_total_items
  FROM purchase_order_details,
       purchase_order_headers
  WHERE pod_poh_id = poh_id
    AND poh_expected_recep_date >= SYSDATE
    AND poh_indirect_delivery_switch = 0
    AND poh_status = 'ST'
    AND poh_prebook_switch = 0
  GROUP BY poh_whs_code,
           poh_use_code,
           poh_expected_recep_date
)
 ;
COMMENT ON TABLE phenix.v_daily_reception_volume IS 'Représente le total des quantités achetés pour un entrepôt donné';
COMMENT ON COLUMN phenix.v_daily_reception_volume.drv_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.v_daily_reception_volume.drv_reception_date IS 'Indique la date de réception attendue';
COMMENT ON COLUMN phenix.v_daily_reception_volume.drv_use_code IS 'Indique le numéro de l''usager (Acheteur)';
COMMENT ON COLUMN phenix.v_daily_reception_volume.drv_total_items IS 'Indique la quantité totale à réceptionner';