CREATE OR REPLACE FORCE VIEW phenix.v_invoice_report_headers (ctr_federal_tax_number,ctr_provincial_tax_number,ctr_tobacco_tax_number,ctr_base_invoice_message,ctr_alt_base_message,ctr_seasonal_invoice_message,ctr_alt_seasonal_message,ctr_company_name,ctr_toll_free_telephone,ctr_nir_number,ctr_web_address,ctr_telephone_number,ctr_fax_number,ctr_company_postal_code,ctr_company_address,ctr_prv_code,ctr_company_city,cus_inv_address,cus_inv_city,cus_inv_name,cus_inv_alt_name,cus_inv_postal_code,cus_inv_telephone,cus_inv_prv_resides_in_code,cus_inv_del_to_address,cus_inv_del_to_city,cus_inv_del_to_name,cus_inv_del_to_postal_code,cus_inv_prv_del_in_code,cus_inv_terms,cus_inv_terms_description,cus_inv_fed_tax_exempt_switch,cus_inv_prv_tax_exempt_switch,cus_corporate_name,cus_ship_address,cus_ship_city,cus_ship_name,cus_ship_alt_name,cus_ship_postal_code,cus_ship_telephone,cus_ship_prv_resides_in_code,cus_ship_del_to_address,cus_ship_del_to_city,cus_ship_del_to_name,cus_ship_del_to_postal_code,cus_ship_prv_del_in_code,cus_ship_federal_tax_number,cus_ship_provincial_tax_number,cus_ship_alcohol_permit,cus_ship_trt_code,cus_ship_store_num,cus_use_code,cus_use_telemark_code,cus_tobacco_permit,inh_id,inh_type,inh_ven_invoice_for_code,inh_ven_code,inh_cus_invoiced_code,inh_cus_code,inh_invoice_date,inh_cigarette_shipped,inh_provincial_tax_total,inh_federal_tax_total,inh_delivery_charge,inh_ticket_charges,inh_sale_price_total,inh_package_total,plh_id,plh_delivery_rou_code,plh_position,whs_prv_code,whs_address,whs_city,whs_name,whs_postal_code,whs_telephone,whs_email,whs_fax_number,whs_toll_free_telephone,whs_web_address,whs_federal_tax_number,whs_provincial_tax_number,whs_tobacco_tax_number,whs_nir_number,whs_code,whs_tabacco_identification,inh_surcharge_amount,cus_ship_deliver_telephone,cus_ship_dairy_permit,cus_ship_cus_code,cus_ship_vendor_identification,cus_print_inv_by_line_switch,cus_pty_code,cus_xrg_code,cus_interest,inh_cash_and_carry_switch,inh_offinv_vol_reb_amount,inh_offinv_vol_reb_percent,inh_bf_flip_switch,inh_route_date) AS
SELECT ALL control.ctr_federal_tax_number ctr_federal_tax_number
             ,control.ctr_provincial_tax_number ctr_provincial_tax_number
             ,control.ctr_tobacco_tax_number ctr_tobacco_tax_number
             ,control.ctr_base_invoice_message ctr_base_invoice_message
             ,control.ctr_alt_base_message ctr_alt_base_message
             ,CASE WHEN control.ctr_seasonal_message_date > SYSDATE THEN control.ctr_seasonal_invoice_message
                   ELSE NULL
              END ctr_seasonal_invoice_message
             ,CASE WHEN control.ctr_seasonal_message_date > SYSDATE THEN control.ctr_alt_seasonal_message
                   ELSE NULL
              END ctr_alt_seasonal_message
             ,control.ctr_company_name
             ,control.ctr_toll_free_telephone  --brc31
             ,control.ctr_nir_number  --fre1873
             ,control.ctr_web_address ctr_web_address
             ,control.ctr_telephone_number ctr_telephone_number
             ,control.ctr_fax_number ctr_fax_number
             ,control.ctr_company_postal_code ctr_company_postal_code
             ,control.ctr_company_address ctr_company_address
             ,control.ctr_prv_code ctr_prv_code
             ,control.ctr_company_city ctr_company_city
             ,cus_inv.cus_address cus_inv_address
             ,cus_inv.cus_city cus_inv_city
             ,cus_inv.cus_name cus_inv_name
             ,cus_inv.cus_alt_name cus_inv_alt_name
             ,cus_inv.cus_postal_code cus_inv_postal_code
             ,cus_inv.cus_telephone cus_inv_telephone
             ,cus_inv.cus_prv_resides_in_code cus_inv_prv_resides_in_code
             ,cus_inv.cus_deliver_to_address cus_inv_del_to_address
             ,cus_inv.cus_deliver_to_city cus_inv_del_to_city
             ,cus_inv.cus_deliver_to_name cus_inv_del_to_name
             ,cus_inv.cus_deliver_to_postal_code cus_inv_del_to_postal_code
             ,cus_inv.cus_prv_delivers_in_code cus_inv_prv_del_in_code
             ,cus_inv.cus_terms cus_inv_terms
             ,null cus_inv_terms_description --FRE1381 car quand AAPAC est down la vue ne compile plus et erreur de communication àl'execution ds factures
             ,cus_inv.cus_federal_tax_exempt_switch cus_inv_fed_tax_exempt_switCH
             ,cus_inv.cus_province_tax_exempt_switch cus_inv_prv_tax_exempt_swiTCH
             ,cus_inv.cus_corporate_name cus_corporate_name--fre2321
             ,cus_ship.cus_address cus_ship_address
             ,cus_ship.cus_city cus_ship_city
             ,cus_ship.cus_name cus_ship_name
             ,cus_ship.cus_alt_name cus_ship_alt_name
             ,cus_ship.cus_postal_code cus_ship_postal_code
             ,cus_ship.cus_telephone cus_ship_telephone
             ,cus_ship.cus_prv_resides_in_code cus_ship_prv_resides_in_code
             ,cus_ship.cus_deliver_to_address cus_ship_del_to_address
             ,cus_ship.cus_deliver_to_city cus_ship_del_to_city
             ,cus_ship.cus_deliver_to_name cus_ship_del_to_name
             ,cus_ship.cus_deliver_to_postal_code cus_ship_del_to_postal_code
             ,cus_ship.cus_prv_delivers_in_code cus_ship_prv_del_in_code  --arm218
             ,cus_ship.cus_federal_tax_number cus_ship_federal_tax_number
             ,cus_ship.cus_provincial_tax_number cus_ship_provincial_tax_number
             ,cus_ship.cus_alcohol_permit cus_ship_alcohol_permit
             ,cus_ship.cus_trt_code cus_ship_trt_code
             ,cus_ship.cus_store_num cus_ship_store_num
             ,cus_ship.cus_use_code cus_use_code
             ,cus_ship.cus_use_telemark_code cus_use_telemark_code --ber732
             ,cus_ship.cus_tobacco_permit cus_tobacco_permit--clc632
             ,invoice_headers.inh_id inh_id
             ,invoice_headers.inh_type inh_type
             ,invoice_headers.inh_ven_invoice_for_code inh_ven_invoice_for_code
             ,invoice_headers.inh_ven_code inh_ven_code --brc31
             ,invoice_headers.inh_cus_invoiced_code inh_cus_invoiced_code
             ,invoice_headers.inh_cus_code inh_cus_code
             ,invoice_headers.inh_invoice_date inh_invoice_date
             ,invoice_headers.inh_cigarette_shipped inh_cigarette_shipped
             ,invoice_headers.inh_provincial_tax_total inh_provincial_tax_total
             ,invoice_headers.inh_federal_tax_total inh_federal_tax_total
             ,invoice_headers.inh_delivery_charge inh_delivery_charge
             ,invoice_headers.inh_ticket_charges inh_ticket_charges
             ,invoice_headers.inh_sale_price_total inh_sale_price_total
             ,invoice_headers.inh_package_total inh_package_total --cvi90
             ,pick_list_headers.plh_id plh_id
             ,pick_list_headers.plh_delivery_rou_code plh_delivery_rou_code
             ,pick_list_headers.plh_position plh_position
             ,whs.whs_prv_code whs_prv_code
             ,whs.whs_address whs_address
             ,whs.whs_city whs_city
             ,whs.whs_name whs_name
             ,whs.whs_postal_code whs_postal_code
             ,whs.whs_telephone whs_telephone
             ,whs.whs_email whs_email
             ,whs.whs_fax_number whs_fax_number
             ,whs.whs_toll_free_telephone whs_toll_free_telephone
             ,whs.whs_web_address whs_web_address
             ,whs.whs_federal_tax_number whs_federal_tax_number         -- EFE344
             ,whs.whs_provincial_tax_number whs_provincial_tax_number   -- EFE344
             ,whs.whs_tobacco_tax_number whs_tobacco_tax_number         -- EFE344
             ,whs.whs_nir_number whs_nir_number                         -- EFE344
             ,whs.whs_code                                              --ARM52
             ,whs_tabacco_identification                                --ARM128
             ,invoice_headers.inh_surcharge_amount inh_surcharge_amount -- rol3234
             ,cus_ship.cus_deliver_telephone cus_ship_deliver_telephone -- CVI1663
             ,cus_ship.cus_dairy_permit cus_ship_dairy_permit --usg714
             ,cus_ship.cus_cus_code cus_ship_cus_code --cha1189
             ,cus_ship.cus_vendor_identification cus_ship_vendor_identification --cha1189
             ,cus_inv.cus_print_inv_by_line_switch -- BER2752
             ,cus_ship.cus_pty_code  --mtp62
             ,cus_ship.cus_xrg_code  --BEA91
             ,cus_inv.cus_interest --BEA91
             ,invoice_headers.inh_cash_and_carry_switch --BEA91
             ,invoice_headers.inh_offinv_vol_reb_amount  -- EFE56
             ,invoice_headers.inh_offinv_vol_reb_percent --FRE3610
             ,invoice_headers.inh_bf_flip_switch         --BEA89
             ,inh_route_date                             --BER8889
FROM   invoice_headers
      ,control
      ,warehouses whs
      ,customers cus_ship
      ,customers cus_inv
      ,pick_list_headers
WHERE  whs.whs_code = plh_whs_delivery_code /*ber1436*/
AND    cus_ship.cus_code = invoice_headers.inh_cus_code
AND    cus_inv.cus_code = invoice_headers.inh_cus_invoiced_code
AND    invoice_headers.inh_type IN ('IN', 'BF')
AND    plh_id = (SELECT MAX(customer_order_transactions.cot_plh_id)
                 FROM   customer_order_transactions
                 WHERE  customer_order_transactions.cot_inh_id = invoice_headers.inh_id)
ORDER BY inh_id;