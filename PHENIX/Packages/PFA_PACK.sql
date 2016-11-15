CREATE OR REPLACE PACKAGE phenix.PFA_PACK IS

PROCEDURE LOG(
          P_WHS_CODE                   IN PFQ_AUDIT.PFA_WHS_CODE%TYPE,
          P_PRF_PRD_CODE               IN PFQ_AUDIT.PFA_PRF_PRD_CODE%TYPE,
          P_PRF_FMT_CODE               IN PFQ_AUDIT.PFA_PRF_FMT_CODE%TYPE,
          P_TYPE                       IN PFQ_AUDIT.PFA_TYPE%TYPE,
          P_MESSAGE                    IN PFQ_AUDIT.PFA_MESSAGE%TYPE,
          P_SALES_TYPE                 IN PFQ_AUDIT.PFA_SALES_TYPE%TYPE
          );

END PFA_PACK;
/