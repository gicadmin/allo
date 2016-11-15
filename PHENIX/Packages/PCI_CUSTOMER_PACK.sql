CREATE OR REPLACE PACKAGE phenix.PCI_CUSTOMER_PACK IS

FUNCTION GET_NEXT_DELIVERY_DATE_FUNC(
  p_cus_code           IN customers.cus_code%TYPE,
  p_start_date         IN DATE,
  p_delivery_type_flag IN customer_order_headers.coh_delivery_type_flag%TYPE
)
RETURN DATE;

END PCI_CUSTOMER_PACK;
/