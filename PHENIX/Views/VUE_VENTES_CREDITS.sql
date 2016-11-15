CREATE OR REPLACE FORCE VIEW phenix.vue_ventes_credits ("CLIENT",nom_du_client,grille_escompte,rabais_volume,groupe_produit,marque_deposee,marque_deposee_description,vendeur_route,no_de_facture,date_facture,ligne_facture,type_facture,no_commande,ligne_commande,code_produit,description_produit,manufacturier,nom_du_manufacturier,"FORMAT",empaquetage,qte_facture,poids_facture,prix_du_format,extension,televendeur_client,nom_du_televendeur_client,televendeur_ligne_cod,nom_du_televendeur_ligne_cod,groupe_client,desc_groupe_client,type_soumission,desc_soumission,coutant,profit,payer_et_emporter,code_region,description_region) AS
SELECT ALL inh.inh_cus_code client,
  cus.cus_name nom_du_client,
  cus.cus_dgt_code Grille_escompte,
  cus.cus_vrg_code Rabais_volume,
  prd.prd_pgr_code Groupe_produit,
  prd.prd_brn_code Marque_deposee,
  brn.brn_description Marque_deposee_description,   --CVI2379
  cus.cus_use_code Vendeur_route,
  inh.inh_id no_de_facture,
  inh.inh_invoice_date date_facture,
  cot.cot_invoice_line_number ligne_facture,
  'VENTES' type_facture,
  cod.cod_coh_id no_commande,
  cod.cod_line_number ligne_commande,
  cod.cod_prf_prd_code code_produit,
  prd.prd_description description_produit,
  prd.prd_ven_code manufacturier,
  ven.ven_name nom_du_manufacturier,
  cod.cod_prf_fmt_code format,
  prf.prf_description empaquetage,
  cot.cot_invoice_quantity qte_facture,
  cot.cot_invoice_weight poids_facture,
  cod.cod_selling_retail prix_du_format,
  nvl(cot.cot_invoice_weight, cot.cot_invoice_quantity) * cod.cod_selling_retail extension,
  cus.cus_use_telemark_code televendeur_client,
  (select use.use_first_name||' '||use.use_last_name from users use
                  where use.use_code = cus.cus_use_telemark_code) nom_du_televendeur_client,
  cod.cod_use_telemark_code televendeur_ligne_cod,
  (select use1.use_first_name||' '||use1.use_last_name from users use1
                  where use1.use_code = cod.cod_use_telemark_code) nom_du_televendeur_ligne_cod,
  cus.cus_cgr_code groupe_client,
  cgr.cgr_description desc_groupe_client,
  cus.cus_qty_code type_soumission,
  (select qty.qty_description from quotation_types qty
                  where qty.qty_code = cus.cus_qty_code) desc_soumission,
  cod.cod_cost_price coutant,
  (nvl(cot.cot_invoice_weight, cot.cot_invoice_quantity) * cod.cod_selling_retail) -
      (nvl(cot.cot_invoice_weight, cot.cot_invoice_quantity) * cod.cod_cost_price) profit,
  inh.inh_cash_and_carry_switch payer_et_emporter,
  trt.trt_code code_region,
  trt.trt_description description_region
from invoice_headers inh,
     customer_order_transactions cot,
     customer_order_details cod,
     product_formats prf,
     products prd,
     vendors ven,
     customers cus,
     customer_groups cgr,
     territories trt,
     brand_names brn    --CVI2379
where inh.inh_type in ('BF', 'IN')
  and inh.inh_id = cot.cot_inh_id
  and cot.cot_cod_coh_id = cod.cod_coh_id
  and cot.cot_cod_line_number = cod.cod_line_number
  and cod.cod_prf_prd_code = prf.prf_prd_code
  and cod.cod_prf_fmt_code = prf.prf_fmt_code
  and cod.cod_prf_prd_code = prd.prd_code
  and prd.prd_ven_code = ven.ven_code
  and inh.inh_cus_code = cus.cus_code
  and cus.cus_cgr_code = cgr.cgr_code(+) -- CVI2058
  and cus.cus_trt_code = trt.trt_code(+) -- CVI2058
  and prd.prd_brn_code = brn.brn_code(+) -- CVI2379
UNION ALL
select inh.inh_cus_code client,
  cus.cus_name nom_du_client,
  cus.cus_dgt_code Grille_escompte,
  cus.cus_vrg_code Rabais_volume,
  prd.prd_pgr_code Groupe_produit,
  prd.prd_brn_code Marque_deposee,
  brn.brn_description Marque_deposee_description,
  cus.cus_use_code Vendeur_route,
  inh.inh_id no_de_facture,
  inh.inh_invoice_date date_facture,
  cad.cad_line_number ligne_facture,
  decode(cad.cad_debit_switch, 1, 'DÉBIT', 'CRÉDIT') type_facture,
  cad.cad_cah_id no_commande,
  cad.cad_line_number ligne_commande,
  cad.cad_prf_prd_code code_produit,
  prd.prd_description description_produit,
  prd.prd_ven_code manufacturier,
  ven.ven_name nom_du_manufacturier,
  cad.cad_prf_fmt_code format,
  prf.prf_description empaquetage,
  cad.cad_adjusted_quantity qte_facture,
  cad.cad_adjusted_weight poids_facture,
  cad.cad_adjusted_retail * decode(cad.cad_debit_switch, 1, 1, -1) prix_du_format,
  nvl(cad.cad_adjusted_weight, cad.cad_adjusted_quantity) * cad.cad_adjusted_retail * decode(cad.cad_debit_switch, 1, 1, -1) extension,
  cus.cus_use_telemark_code televendeur_client,
  (select use.use_first_name||' '||use.use_last_name from users use
                  where use.use_code = cus.cus_use_telemark_code) nom_du_televendeur_client,
  NULL televendeur_ligne_cod,
  'aucun télévendeur sur les crédits' nom_du_televendeur_ligne_cod,
  cus.cus_cgr_code groupe_client,
  cgr.cgr_description desc_groupe_client,
  cus.cus_qty_code type_soumission,
  (select qty.qty_description from quotation_types qty
                  where qty.qty_code = cus.cus_qty_code) desc_soumission,
  cad.cad_invoice_cost coutant, -- CVI2058
  (nvl(cad.cad_adjusted_weight, cad.cad_adjusted_quantity) * cad.cad_adjusted_retail * decode(cad.cad_debit_switch, 1, 1, -1)) -
    (nvl(cad.cad_adjusted_weight, cad.cad_adjusted_quantity) * cad.cad_cost_price * decode(cad.cad_debit_switch, 1, 1, -1)) profit,
  inh.inh_cash_and_carry_switch payer_et_emporter,
  trt.trt_code code_region,
  trt.trt_description description_region
from invoice_headers inh,
     customer_adjustment_details cad,
     product_formats prf,
     products prd,
     vendors ven,
     customers cus,
     customer_groups cgr,
     territories trt,
     brand_names brn   --CVI2379
where inh.inh_type in ('CN', 'CF') -- CVI2058
  and inh.inh_id = cad.cad_inh_id
  and cad.cad_prf_prd_code = prf.prf_prd_code
  and cad.cad_prf_fmt_code = prf.prf_fmt_code
  and cad.cad_prf_prd_code = prd.prd_code
  and prd.prd_ven_code = ven.ven_code
  and inh.inh_cus_code = cus.cus_code
  and cus.cus_cgr_code = cgr.cgr_code(+) -- CVI2058
  and cus.cus_trt_code = trt.trt_code(+) -- CVI2058
  and prd.prd_brn_code = brn.brn_code(+) -- CVI2379
;