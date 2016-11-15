CREATE OR REPLACE FORCE VIEW phenix.v_invoice_payments (inh_id,inh_type,inh_cus_code,inh_invoice_date,inh_id_accpac,inh_cus_accpac_code,invoice_amount,payment_amount_not_in_accpac,payment_amount_in_accpac,last_payment_date) AS
WITH payments AS
(
  SELECT srth.srth_inh_id inh_id,
         srtd.srtd_credit_note_reference inh_credit_note_id,
         CASE WHEN srtd.srtd_tty_code = 'ONAC' THEN 0
              ELSE srtd.srtd_amount - srtd.srtd_change_amount - srtd.srtd_rounding_amount END payment_amount,
         srtd.srtd_in_accpac_switch accpac_switch,
         srth.srth_date payment_date
  FROM sales_register_trans_headers srth JOIN
       sales_register_trans_details srtd ON
         (srtd.srtd_srth_id = srth.srth_id)
  WHERE srth.srth_type IN ('P', 'S', 'C')
)
SELECT inh_id,
       inh_type,
       inh_cus_code,
       inh_invoice_date,
       inh_id_accpac,
       inh_cus_accpac_code,
       invoice_amount,
       SUM(CASE WHEN invoice_amount < 0 THEN ABS(payment_amount_not_in_accpac) * -1 ELSE payment_amount_not_in_accpac END) payment_amount_not_in_accpac,
       SUM(CASE WHEN invoice_amount < 0 THEN ABS(payment_amount_in_accpac) * -1 ELSE payment_amount_in_accpac END) payment_amount_in_accpac,
       MAX(payment_date) last_payment_date
FROM
(
  SELECT inh.inh_id,
         inh.inh_type,
         inh.inh_cus_invoiced_code inh_cus_code,
         inh.inh_invoice_date,
         RPAD(TO_CHAR(inh.inh_id), 22) inh_id_accpac,
         RPAD(TO_CHAR(inh.inh_cus_invoiced_code), 12) inh_cus_accpac_code,
         (inh.inh_sale_price_total
          + inh.inh_provincial_tax_total
          + inh.inh_federal_tax_total
          + inh.inh_ticket_charges
          + inh.inh_delivery_charge
          + NVL(inh.inh_surcharge_amount, 0)
          - inh.inh_offinv_vol_reb_amount) invoice_amount,
         DECODE(payments.accpac_switch, 0, payments.payment_amount, 0) payment_amount_not_in_accpac,
         DECODE(payments.accpac_switch, 1, payments.payment_amount, 0) payment_amount_in_accpac,
         payments.payment_date
  FROM invoice_headers inh LEFT JOIN
       payments ON
         (payments.inh_id = inh.inh_id OR
          payments.inh_credit_note_id = inh.inh_id)
)
GROUP BY inh_id,
         inh_type,
         inh_cus_code,
         inh_invoice_date,
         inh_id_accpac,
         inh_cus_accpac_code,
         invoice_amount;