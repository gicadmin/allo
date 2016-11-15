CREATE OR REPLACE PACKAGE phenix.WMS_PALLET_PACK IS
FUNCTION CREATE_PALLET_TRANSACTION_FUNC
(
  p_customer_code    	IN 	NUMBER,
	p_vendor_code      	IN 	NUMBER,
  p_carrier_code     	IN 	NUMBER,
  p_trans_date       	IN 	DATE,
  p_reference_number 	IN 	VARCHAR2,
  p_pallet_type      	IN 	NUMBER ,
  p_quantity         	IN 	NUMBER,
  p_transaction_type 	IN 	VARCHAR2,
  p_ccr_code 					OUT NUMBER,
	p_use_code					IN 	NUMBER, --BER1422
	p_shh_id					  IN 	NUMBER --CSC3739
 )
 RETURN PLS_INTEGER   ;
END WMS_PALLET_PACK;
 
/