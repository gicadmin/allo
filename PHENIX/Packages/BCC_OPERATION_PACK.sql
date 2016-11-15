CREATE OR REPLACE PACKAGE phenix.BCC_OPERATION_PACK AS

PROCEDURE GET_COMPONENT_VALUE_PROC(
  p_bcc_code          IN     barcode_components.bcc_code%TYPE,
  p_bcc_value         IN     VARCHAR2,
  p_sscc              IN OUT NUMBER,
  p_gtin              IN OUT NUMBER,
  p_content           IN OUT NUMBER,
  p_lot_number        IN OUT VARCHAR2,
  p_prod_date         IN OUT DATE,
  p_due_date          IN OUT DATE,
  p_pack_date         IN OUT DATE,
  p_best_before_date  IN OUT DATE,
  p_expiry_date       IN OUT DATE,
  p_product_variant   IN OUT NUMBER,
  p_serial            IN OUT VARCHAR2,
  p_addtional_id      IN OUT VARCHAR2,
  p_cus_part_number   IN OUT VARCHAR2,
  p_secondary_serial  IN OUT VARCHAR2,
  p_ref_to_source     IN OUT VARCHAR2,
  p_doc_id            IN OUT NUMBER,
  p_var_count         IN OUT NUMBER,
  p_net_weight        IN OUT NUMBER,
  p_po_number         IN OUT VARCHAR2,
  p_consignment       IN OUT VARCHAR2,
  p_shipment_number   IN OUT NUMBER,
  p_ship_to           IN OUT NUMBER,
  p_bill_to           IN OUT NUMBER,
  p_purchase_from     IN OUT NUMBER,
  p_loc_number        IN OUT NUMBER,
  p_pay_to            IN OUT NUMBER,
  p_meat_cut          IN OUT VARCHAR2,
  p_production_time   IN OUT NUMBER
);

END BCC_OPERATION_PACK;
/