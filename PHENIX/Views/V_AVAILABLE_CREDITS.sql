CREATE OR REPLACE FORCE VIEW phenix.v_available_credits (inh_id,inh_invoice_date,inh_cus_code,amount_due,payment_amount) AS
SELECT inh.inh_id,
       inh.inh_invoice_date,
       inh.inh_cus_code,
       ABS(arobl.amtduehc) amount_due,
       ABS(inh.payment_amount_not_in_accpac) payment_amount
FROM v_invoice_payments inh JOIN
     arobl ON
     (arobl.idinvc = inh.inh_id_accpac AND
      (arobl.idcust = inh.inh_cus_accpac_code OR
       arobl.idnatacct = inh.inh_cus_accpac_code)
     )
WHERE inh.inh_type = 'CN'
  AND arobl.trxtypetxt IN (3, 5)
  AND arobl.amtduehc < 0
  AND (arobl.amtduehc - inh.payment_amount_not_in_accpac) < 0
UNION ALL
SELECT inh.inh_id,
       inh.inh_invoice_date,
       inh.inh_cus_code,
       ABS(inh.invoice_amount) amount_due,
       ABS(inh.payment_amount_not_in_accpac) payment_amount
FROM v_invoice_payments inh
WHERE NOT EXISTS (SELECT 1
                  FROM arobl
                  WHERE arobl.idinvc = inh.inh_id_accpac
                    AND (arobl.idcust = inh.inh_cus_accpac_code OR
                         arobl.idnatacct = inh.inh_cus_accpac_code)
                 )
  AND inh.inh_type = 'CN'
  AND inh.inh_invoice_date > TRUNC(SYSDATE - 7, 'DD')
  AND inh.invoice_amount < 0
  AND (inh.invoice_amount - inh.payment_amount_not_in_accpac) < 0;