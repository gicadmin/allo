CREATE OR REPLACE PACKAGE phenix.EBC_OPERATION_PACK AS

FUNCTION DECODE_BARCODE_FUNC(
  p_barcode           IN  VARCHAR2,
  p_est_code          IN  establishments.est_code%TYPE,
  p_sscc              OUT NUMBER,
  p_gtin              OUT NUMBER,
  p_content           OUT NUMBER,
  p_lot_number        OUT VARCHAR2,
  p_prod_date         OUT DATE,
  p_due_date          OUT DATE,
  p_pack_date         OUT DATE,
  p_best_before_date  OUT DATE,
  p_expiry_date       OUT DATE,
  p_product_variant   OUT NUMBER,
  p_serial            OUT VARCHAR2,
  p_addtional_id      OUT VARCHAR2,
  p_cus_part_number   OUT VARCHAR2,
  p_secondary_serial  OUT VARCHAR2,
  p_ref_to_source     OUT VARCHAR2,
  p_doc_id            OUT NUMBER,
  p_var_count         OUT NUMBER,
  p_net_weight        OUT NUMBER,
  p_po_number         OUT VARCHAR2,
  p_consignment       OUT VARCHAR2,
  p_shipment_number   OUT NUMBER,
  p_ship_to           OUT NUMBER,
  p_bill_to           OUT NUMBER,
  p_purchase_from     OUT NUMBER,
  p_loc_number        OUT NUMBER,
  p_pay_to            OUT NUMBER,
  p_meat_cut          OUT VARCHAR2,
  p_production_time   OUT NUMBER
)
RETURN BOOLEAN;

END EBC_OPERATION_PACK;
/