CREATE OR REPLACE PACKAGE phenix.STAT_JTI_PACK IS

PROCEDURE CREATE_JTI_PROC(
 P_JSC_ID IN NUMBER
 );

PROCEDURE EXTRACT_WHS_JTI_PROC(
  p_ven_code    IN NUMBER,
  p_whs_code    IN VARCHAR2,
  p_date_debut  IN DATE,
  p_date_fin    IN DATE,
  p_ship_to_id  IN VARCHAR2,  --GCL10623
  p_stt_code    IN VARCHAR2
);

FUNCTION GET_HID_LINE_FUNC(
  p_date          IN DATE,
  p_v_line_number IN NUMBER,
  p_whs_code      IN VARCHAR2,
  p_stt_code      IN VARCHAR2   --GCL10623
) RETURN VARCHAR2;

FUNCTION GET_BID_LINE_FUNC(
  p_v_file_in     IN OUT UTL_FILE.FILE_TYPE,
  p_v_line_number IN OUT NUMBER,
  p_measure_bid   OUT NUMBER,
  p_whs_code      IN VARCHAR2,
  p_ven_code      IN NUMBER
) RETURN NUMBER;

FUNCTION GET_SID_LINE_FUNC(
  p_v_file_in         IN UTL_FILE.FILE_TYPE,
  p_v_line_number     IN NUMBER,
  v_total_number_pur  OUT NUMBER,
  v_total_number_tot  OUT NUMBER,
  p_dat_debut         IN DATE,
  p_dat_fin           IN DATE,
  p_whs_code          IN VARCHAR2,
  p_ven_code          IN NUMBER
) RETURN NUMBER;

FUNCTION GET_PUR_LINE_FUNC(
  p_v_file_in     IN UTL_FILE.FILE_TYPE,
  p_v_line_number IN OUT NUMBER,
  v_number_tot    OUT NUMBER,
  v_measure_tot   OUT NUMBER,
  p_dat_debut     IN DATE,
  p_dat_fin       IN DATE,
  p_cus_code      IN NUMBER,
  p_ven_code      IN NUMBER,
  p_type_call     IN NUMBER
) RETURN NUMBER;

FUNCTION GET_TOT_LINE_FUNC(
  p_bid_tot       IN NUMBER,
  p_sid_tot       IN NUMBER,
  p_pur_tot       IN NUMBER,
  p_pur_sum       IN NUMBER,
  p_bid_sum       IN NUMBER,
  p_date          IN DATE,
  p_v_line_number IN NUMBER,
  p_whs_code      IN VARCHAR2,  --BER3396
  p_ship_to_id    IN VARCHAR2  --GCL10623
) RETURN VARCHAR2;

END STAT_JTI_PACK;
/