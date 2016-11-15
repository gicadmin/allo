CREATE OR REPLACE FORCE VIEW phenix.v_invoice_report_details (cod_prf_prd_code,cod_prf_prd_original_code,cod_prd_order_code,cod_line_number,cod_order_type,order_line_number,cod_coh_id,cod_selling_retail,cod_original_retail,cod_promotion_amount,cod_pricing_source,cod_surcharge,cod_cod_coh_id,cod_cod_line_number,cod_prebook_method,cod_weight_qty,cot_line_number,cot_weight_qty,cot_inh_id,cot_invoice_weight,cigarettes_shipped,montant,tobacco_tax,total_non_taxable,total_taxable,total_taxable_tps,total_taxable_tvq,total_taxable_tps2,total_taxable_tvq2,prix_unitaire,fmt_short_code,prd_ven_code,ven_section_on_inv_switch,prd_attribute_tri,prd_description,prd_alt_description,prd_ctg_code,prd_catalog_sequence_code,prd_type,prd_fmt_weighted_inv_code,prf_only_one_pick_wght_switch,prd_special_order_switch,pfw_whz_code,whz_description,whz_alt_description,prd_attribute,prf_whz_code_ber,marque_manuf,alt_marque_manuf,prw_federal_display_switch,prw_provincial_display_switch,cot_federal_tax_rate,cot_provincial_tax_rate,ta,tv,prf_description,shr_description,shr_alt_description,psr_price,manufacturer_code,marge_percent,prd_cigar_switch,cod_number_of_cigars,cod_selling_before_tobacco_tax,cod_before_tob_tax_incl_fed_tx,cod_selling_bf_tob_per_cigar,cod_taxable_amount_per_cigar,cod_tobacco_tax_per_cigar,cod_tobacco_markup_rate,cod_tobacco_tax_rate,cod_tobacco_tax,cod_prf_fmt_code,cod_pty_code,cod_desired_qty_weight,cod_royalty_amount,pgr_majeur,pgr_description,pgr_alt_description,prd_pgr_code,prf_upc_code,cod_vsi_original_code,cod_sio_distributed_amount,cus_print_inv_by_line_switch) AS
SELECT     ALL  --SELECT des produits solide, vrac et bacon ('S','F','B')
                    cod.cod_prf_prd_code,
                    cod.cod_prf_prd_original_code,
                    cod.cod_prf_prd_code cod_prd_order_code,
                    cod.cod_line_number,
                    cod.cod_order_type,
                    cod.cod_line_number order_line_number,
                    cod.cod_coh_id,
                    cod.cod_selling_retail,
                    cod.cod_original_retail, --lan452
                    cod.cod_promotion_amount,
                    cod.cod_pricing_source,
                    cod.cod_surcharge,       --cvi90
                    cod.cod_cod_coh_id,      --cvi90
                    cod.cod_cod_line_number, --cvi90
                    cod.cod_prebook_method,  --cvi90
                    (CASE WHEN cod.cod_order_type = 'SP' --CSC1708 la quantité envoyée pour cueillette n'est plus necessairement la quantité commandée
                                 THEN NVL(cot.cot_pick_quantity , cot.cot_pick_weight) --CSC1708
                                 ELSE NVL(cod.cod_order_quantity , cod.cod_order_weight) END) cod_weight_qty, --CSC1708
                    cot.cot_line_number cot_line_number,
                    (CASE WHEN prd.prd_definition = 'F' THEN cot.cot_invoice_weight
                                ELSE cot.cot_invoice_quantity END) cot_weight_qty,
                    cot.cot_inh_id,
                    cot.cot_invoice_weight,
                    pgr.pgr_invoice_counter_switch * NVL(cot.cot_invoice_quantity, 0) cigarettes_shipped,
                    CASE WHEN cod.cod_order_type = 'SP'
                         THEN cot.cot_invoiced_ext_price
                         ELSE cod.cod_invoiced_ext_price END montant, --BER3866
                    (cod.cod_tobacco_tax * cot.cot_invoice_quantity) tobacco_tax,
                    (CASE WHEN cot.cot_federal_tax_rate = 0 AND cot.cot_provincial_tax_rate = 0
                                THEN CASE WHEN cod.cod_order_type = 'SP'
                                          THEN cot.cot_invoiced_ext_price
                                          ELSE cod.cod_invoiced_ext_price END ELSE 0 END) total_non_taxable,    --FRE1114
                    (CASE WHEN cot.cot_federal_tax_rate > 0 AND cot.cot_provincial_tax_rate > 0
                                THEN CASE WHEN cod.cod_order_type = 'SP'
                                          THEN cot.cot_invoiced_ext_price
                                          ELSE cod.cod_invoiced_ext_price END ELSE 0 END) total_taxable,        --BER3866
                    (CASE WHEN cot.cot_federal_tax_rate > 0 AND cot.cot_provincial_tax_rate = 0
                                THEN CASE WHEN cod.cod_order_type = 'SP'
                                          THEN cot.cot_invoiced_ext_price
                                          ELSE cod.cod_invoiced_ext_price END ELSE 0 END) total_taxable_tps,    --BER3866
                    (CASE WHEN cot.cot_federal_tax_rate = 0 AND cot.cot_provincial_tax_rate > 0
                                THEN CASE WHEN cod.cod_order_type = 'SP'
                                          THEN cot.cot_invoiced_ext_price
                                          ELSE cod.cod_invoiced_ext_price END ELSE 0 END) total_taxable_tvq,    --BER3866
                    (CASE WHEN cot.cot_federal_tax_rate > 0
                            THEN CASE WHEN cod.cod_order_type = 'SP'
                                      THEN cot.cot_invoiced_ext_price
                                      ELSE cod.cod_invoiced_ext_price END else 0 END) total_taxable_tps2,       --BER3866
                    (CASE WHEN cot.cot_provincial_tax_rate > 0
                                THEN CASE WHEN cod.cod_order_type = 'SP'
                                          THEN cot.cot_invoiced_ext_price
                                          ELSE cod.cod_invoiced_ext_price END ELSE 0 END) total_taxable_tvq2,   --BER3866
                    (CASE WHEN prd.prd_ATTRIBUTE = 'ALC' AND (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE) > cod.cod_SELLING_RETAIL THEN    (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE)
                            ELSE cod.cod_SELLING_RETAIL END)
                     / PRODUCT_PACK.FORMAT_CONVERSION_FUNC (cod.cod_prf_prd_code,
                                                            cod.cod_prf_fmt_code,
                                                            prd.prd_srp_fmt_code) prix_unitaire, --rol3111
                    fmt_short_code,
                    prd.prd_ven_code,        --brc31
                    ven.ven_section_on_inv_switch,  --cvi2821
                    DECODE(prd.prd_attribute,'COU',2,1) prd_attribute_tri,  --BER227 + GIC3290 (retiré CAI pour Caisson)
                    prd.prd_description,
                    prd.prd_alt_description,
                    prd.prd_ctg_code,
                    prd.prd_catalog_sequence_code,
                    prd.prd_definition prd_type,
                    prd.prd_fmt_weighted_inv_code,
                    prf_only_one_pick_wght_switch,    --ber638 rendu dans PRF plutot que PRD
                    prd.prd_special_order_switch,--rol2760
                    pfw_whz_code, --ber1645 rendu ds PFW
                    whz_description,  --fre1056
                    whz_alt_description, --CSC4626
                    prd.prd_attribute,
                    DECODE(prd.prd_attribute,'COU', 'COURRIERS',pfw_whz_code) prf_whz_code_ber, --ber1645 --BER227 pour afficher ou non la zone du produit (qd courrier et caisson on l'affiche pas) --ber303 entreposage est sur le PFW maintenant (plutot que PRF)
                    NVL(brn_description, ven_short_name) marque_manuf,
                    NVL(NVL(brn_alt_description,brn_description), ven_short_name)  alt_marque_manuf, --FRE3752
                    prw2.prw_federal_display_switch,     -- EFE344
                    prw2.prw_provincial_display_switch,  -- EFE344
                    cot.cot_federal_tax_rate,           --cvi90
                    cot.cot_provincial_tax_rate,        --cvi90
                    DECODE(cot.cot_federal_tax_rate, 0 , '', 'F')||DECODE(cot.cot_provincial_tax_rate, 0, '', 'P') ta,
                    DECODE(prw2.prw_federal_display_switch, 0 , '', 'F')||DECODE(prw2.prw_provincial_display_switch, 0, '', 'P') tv,
                    prf.prf_description prf_description,
                    (CASE WHEN NVL(cot.cot_invoice_quantity, cot.cot_invoice_weight) = 0
                            THEN shr_description ELSE NULL END) shr_description,
                    (CASE WHEN NVL(cot.cot_invoice_quantity, cot.cot_invoice_weight) = 0
                            THEN shr_alt_description ELSE NULL END) shr_alt_description,
                    REPORT_PACK.GET_SRP_FUNC( cod.cod_prf_prd_code,
                                              prd.prd_srp_fmt_code,
                                              cus.cus_srt_code) psr_price,
                    vpd_manufacturer_code manufacturer_code,
                    ((REPORT_PACK.GET_SRP_FUNC(    cod.cod_prf_prd_code,
                                                   prd.prd_srp_fmt_code,
                                                   cus.cus_srt_code)
                                -     (CASE WHEN prd.prd_ATTRIBUTE = 'ALC' AND (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE) > cod.cod_SELLING_RETAIL THEN    (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE)
                                                ELSE cod.cod_SELLING_RETAIL END) --rol3111
                                / PRODUCT_PACK.FORMAT_CONVERSION_FUNC ( cod.cod_prf_prd_code,
                                                                        cod.cod_prf_fmt_code,
                                                                        prd.prd_srp_fmt_code))
                                / REPORT_PACK.GET_SRP_FUNC(cod.cod_prf_prd_code,
                                                           prd.prd_srp_fmt_code,
                                                           cus.cus_srt_code)) * 100 marge_percent,
                    prd.prd_cigar_switch,    --usg323
                    cod.cod_number_of_cigars,    --usg323
                    cod.cod_selling_before_tobacco_tax,    --usg323
                    cod.cod_before_tob_tax_incl_fed_tx,    --usg323
                    cod.cod_selling_bf_tob_per_cigar,    --usg323
                    cod.cod_taxable_amount_per_cigar,    --usg323
                    cod.cod_tobacco_tax_per_cigar,    --usg323
                    cod.cod_tobacco_markup_rate,    --usg323
                    cod.cod_tobacco_tax_rate,    --usg323
                    cod.cod_tobacco_tax,    --usg323
                    cod.cod_prf_fmt_code, -- BER2752
                    cod.cod_pty_code,     --FRE3610
                   (CASE WHEN cod.cod_order_type = 'SP' --CSC1708 la quantité envoyée pour cueillette n'est plus necessairement la quantité commandée
                                 THEN NVL(cot.cot_pick_quantity, cot.cot_pick_weight) --CSC1708
                                 ELSE NVL(cod.cod_desired_quantity, cod.cod_desired_weight) END) cod_desired_qty_weight, --BER4039
                    cod.cod_royalty_amount , --mtp62
                    TRUNC(prd.prd_pgr_code, -3) pgr_majeur, --arm52
                    pgr_maj.pgr_description pgr_description,--arm52
                    pgr_maj.pgr_alt_description pgr_alt_description, --arm52
                    prd.prd_pgr_code prd_pgr_code, --BEA91
                    prf.prf_upc_code prf_upc_code, --BEA91
                    cod.cod_vsi_original_code  cod_vsi_original_code, --BEA90
                    cod.cod_sio_distributed_amount cod_sio_distributed_amount,  --BEA90
                    cus.cus_print_inv_by_line_switch  cus_print_inv_by_line_switch  --BEA278
    FROM    customer_order_transactions cot,
            customer_order_details cod,
            customer_order_headers coh,
            customers cus,
            products prd,
            product_warehouses prw, --GIC3413 remplacer la vue v_purchase_prd_warehouses --BER1461
            product_warehouses prw2, -- EFE344
            product_formats prf,
            product_format_warehouses pfw,        --ber1645
            formats fmt,
            shorted_reasons shr,
            product_groups pgr,
            product_groups pgr_maj, --arm52
            vendors ven,
            brand_names brn,
            vendor_products vpd,
            warehouse_zones whz
      WHERE prd.prd_definition  IN ('S', 'F', 'B')
        AND cod.cod_coh_id = cot.cot_cod_coh_id
        AND cod.cod_line_number = cot.cot_cod_line_number
        AND cod.cod_coh_id = coh.coh_id
        AND coh.coh_cus_code = cus.cus_code
        AND prd.prd_code = cod.cod_prf_prd_code
        AND prf_prd_code = cod.cod_prf_prd_code
        AND prf_fmt_code = cod.cod_prf_fmt_code
        AND fmt_code = prf_fmt_code
        AND prd.prd_pgr_code =  pgr.pgr_code
        AND TRUNC(prd.prd_pgr_code,-3) = pgr_maj.pgr_code --arm52
        AND pfw_whz_code = whz_code                           --ber1645
        AND pfw_prf_prd_code = prf_prd_code                    --ber1645
        AND pfw_prf_fmt_code = prf_fmt_code                    --ber1645
        AND pfw_whs_code          = cod.cod_whs_picking_code    --ber1645
        AND prd.prd_ven_code = ven_code
        AND prd.prd_ven_code = vpd_ven_distributed_by_code
        AND prd.prd_code = vpd_prd_code
        AND prd.prd_brn_code = brn_code (+)
        AND prw.prw_whs_code =  vendor_invoice_pack.find_purchase_warehouse_func(cod.cod_prf_prd_code,cod.cod_whs_picking_code)    --GIC3413 --cod.cod_whs_picking_code                    --BER1461
        AND prw.prw_prd_code = prd.prd_code                    --GIC3413
        AND prw.prw_shr_code = shr_code(+)                --GIC3413
        AND prw2.prw_prd_code = cod.cod_prf_prd_code   -- EFE344
        AND prw2.prw_whs_code = coh.coh_whs_delivery_code   -- EFE344
UNION --SELECT pour un header de 'dinde'
    SELECT     DISTINCT
                    cod.cod_prf_prd_code,
                    cod.cod_prf_prd_original_code,
                    cod.cod_prf_prd_code cod_prd_order_code,
                    cod.cod_line_number,
                    cod.cod_order_type,
                    cod.cod_line_number order_line_number,
                    cod.cod_coh_id,
                    cod.cod_selling_retail,
                    cod.cod_original_retail, --lan452
                    cod.cod_promotion_amount,
                    cod.cod_pricing_source,
                    cod.cod_surcharge,       --cvi90
                    cod.cod_cod_coh_id,      --cvi90
                    cod.cod_cod_line_number, --cvi90
                    cod.cod_prebook_method,  --cvi90
                    (CASE WHEN cod.cod_order_type = 'SP' OR ctr_super_distributor_switch = 0 --CSC1708 la quantité envoyée pour cueillette n'est plus necessairement la quantité commandée
                             THEN SUM(NVL(cot.cot_pick_quantity , cot.cot_pick_weight)) --CSC1708
                             ELSE NVL(cod.cod_order_quantity, cod.cod_order_weight) END) cod_weight_qty, --CSC1708 --BER821enlever le distinct et mettre la somme juste pour les comm spec
                    0 cot_line_number,
                    SUM(cot.cot_invoice_quantity) cot_weight_qty,
                    cot.cot_inh_id cot_inh_id,
                    SUM(cot.cot_invoice_weight) cot_invoice_weight,
                    0 cigarettes_shipped,
                    CASE WHEN cod.cod_order_type = 'SP'
                         THEN SUM(cot.cot_invoiced_ext_price)
                         ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END montant,  --BER3866
                    0 tobacco_tax,
                    (CASE     WHEN cot.cot_federal_tax_rate = 0 AND cot.cot_provincial_tax_rate = 0
                             THEN  CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price) --BER3866
                                        ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                             ELSE 0 END)  total_non_taxable,
                    (CASE      WHEN cot.cot_federal_tax_rate > 0 AND cot.cot_provincial_tax_rate > 0
                               THEN CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price) --BER3866
														             ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                              ELSE 0 END) total_taxable,
                    (CASE     WHEN cot.cot_federal_tax_rate > 0 AND cot.cot_provincial_tax_rate = 0
                              THEN CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price) --BER3866
															          ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                              ELSE 0 END) total_taxable_tps,
                    (CASE     WHEN cot.cot_federal_tax_rate = 0 AND cot.cot_provincial_tax_rate > 0
                                 THEN CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price)
																           ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                                 ELSE 0 END) total_taxable_tvq,
                    (CASE     WHEN cot.cot_federal_tax_rate > 0
                                 THEN CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price)
																			 ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                                 ELSE 0 END) total_taxable_tps2,
                    (CASE     WHEN cot.cot_provincial_tax_rate > 0
                                 THEN CASE WHEN cod.cod_order_type = 'SP' THEN SUM(cot.cot_invoiced_ext_price)
																            ELSE SUM(cod.cod_invoiced_ext_price) / COUNT(cot.cot_line_number) END --BER3866
                                 ELSE 0 END) total_taxable_tvq2,
                    (CASE WHEN prd.prd_ATTRIBUTE = 'ALC' AND (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE) > cod.cod_SELLING_RETAIL THEN    (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE)
                            ELSE cod.cod_SELLING_RETAIL END) --rol3111
                     / PRODUCT_PACK.FORMAT_CONVERSION_FUNC (cod.cod_prf_prd_code,
                                                            cod.cod_prf_fmt_code,
                                                            prd.prd_srp_fmt_code) prix_unitaire,  --rol3111
                    fmt_short_code,
                    prd.prd_ven_code,        --brc31
                    ven.ven_section_on_inv_switch,  --cvi2821
                    DECODE(prd.prd_attribute,'COU',2,1) prd_attribute_tri,  --BER227 + GIC3290 retiré (Caisson)
                    prd.prd_description,
                    prd.prd_alt_description,
                    prd.prd_ctg_code,
                    prd.prd_catalog_sequence_code,
                    prd.prd_definition prd_type,
                    prd.prd_fmt_weighted_inv_code,
                    prf_only_one_pick_wght_switch,    --ber638 rendu dans PRF plutot que PRD
                    prd.prd_special_order_switch,--rol2760
                    pfw_whz_code, --ber1645 rendu ds PFW
                    whz_description,  --fre1056
                    whz_alt_description, --CSC4626
                    prd.prd_attribute prd_attribute,
                    DECODE(prd.prd_attribute,'COU','COURRIERS',pfw_whz_code) prf_whz_code_ber, --ber1645 --BER227 pour afficher ou non la zone du produit (qd courrier et caisson on l'affiche pas) --ber303 entreposage est sur le PRF maintenant (plutot que PRD)
                    NVL(brn_description, ven_short_name) marque_manuf,
                    NVL(NVL(brn_alt_description,brn_description), ven_short_name) alt_marque_manuf, --Ajout d'un NVL FRE3752
                    prw.prw_federal_display_switch,     --cvi90
                    prw.prw_provincial_display_switch,  --cvi90
                    cot.cot_federal_tax_rate,           --cvi90
                    cot.cot_provincial_tax_rate,        --cvi90
                    DECODE(cot.cot_federal_tax_rate, 0 , '', 'F')||DECODE(cot.cot_provincial_tax_rate, 0, '', 'P') TA,
                    DECODE(prw.prw_federal_display_switch, 0 , '', 'F')||DECODE(prw.prw_provincial_display_switch, 0, '', 'P') TV,
                    prf_description,
                    (CASE WHEN SUM(NVL(cot.cot_invoice_weight,0)) = 0
                                THEN shr_description ELSE NULL END) shr_description,
                    (CASE WHEN SUM(NVL(cot.cot_invoice_weight,0)) = 0
                                THEN shr_alt_description ELSE NULL END) shr_alt_description,
                    REPORT_PACK.GET_SRP_FUNC(    cod.cod_prf_prd_code,
                                                prd.prd_srp_fmt_code,
                                                cus.cus_srt_code) psr_price,
                    vpd_manufacturer_code manufacturer_code,
                    ((REPORT_PACK.GET_SRP_FUNC(    cod.cod_prf_prd_code,
                                                   prd.prd_srp_fmt_code,
                                                   cus.cus_srt_code)
                                -     (CASE WHEN prd.prd_ATTRIBUTE = 'ALC' AND (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE) > cod.cod_SELLING_RETAIL THEN    (cod.cod_ORIGINAL_RETAIL + cod.cod_SURCHARGE)
                                                ELSE cod.cod_SELLING_RETAIL END) --rol3111
                                / PRODUCT_PACK.FORMAT_CONVERSION_FUNC (    cod.cod_prf_prd_code,
                                                                           cod.cod_prf_fmt_code,
                                                                           prd.prd_srp_fmt_code))
                                / REPORT_PACK.GET_SRP_FUNC(   cod.cod_prf_prd_code,
                                                              prd.prd_srp_fmt_code,
                                                              cus.cus_srt_code)) * 100 marge_percent,
                    prd.prd_cigar_switch,    --usg323
                    cod.cod_number_of_cigars,    --usg323
                    cod.cod_selling_before_tobacco_tax,    --usg323
                    cod.cod_before_tob_tax_incl_fed_tx,    --usg323
                    cod.cod_selling_bf_tob_per_cigar,    --usg323
                    cod.cod_taxable_amount_per_cigar,    --usg323
                    cod.cod_tobacco_tax_per_cigar,    --usg323
                    cod.cod_tobacco_markup_rate,    --usg323
                    cod.cod_tobacco_tax_rate,    --usg323
                    cod.cod_tobacco_tax,    --usg323
                    cod.cod_prf_fmt_code, -- BER2752
                    cod.cod_pty_code,     --FRE3610
                    (CASE WHEN cod.cod_order_type = 'SP' --CSC1708 la quantité envoyée pour cueillette n'est plus necessairement la quantité commandée
                             THEN SUM(NVL(cot.cot_pick_quantity , cot.cot_pick_weight)) --CSC1708
                             ELSE NVL(cod.cod_desired_quantity, cod.cod_desired_weight) END) cod_desired_qty_weight, --BER4039
                    cod.cod_royalty_amount , --mtp62
                    TRUNC(prd.prd_pgr_code, -3) pgr_majeur, --arm52
                    pgr_maj.pgr_description pgr_description,--arm52
                    pgr_maj.pgr_alt_description pgr_alt_description, --arm52
                    prd.prd_pgr_code prd_pgr_code, --BEA91
                    prf.prf_upc_code prf_upc_code, --BEA91
                    cod.cod_vsi_original_code  cod_vsi_original_code, --BEA90
                    cod.cod_sio_distributed_amount cod_sio_distributed_amount,  --BEA90
                    cus.cus_print_inv_by_line_switch  cus_print_inv_by_line_switch  --BEA278
    FROM     customer_order_transactions cot,
             customer_order_details cod,
             customer_order_headers coh,
             products prd,
             product_warehouses prw, --GIC3413 remplacer la vue v_purchase_prd_warehouses --BER1461
             product_formats prf,
             product_format_warehouses pfw,        --ber1645
             product_groups pgr_maj, --arm52
             formats fmt,
             customers cus,
             vendors ven,
             brand_names brn,
             shorted_reasons shr,
             vendor_products vpd,
             warehouse_zones whz,
             control ctr
      WHERE prd.prd_definition = 'D'
        AND cod.cod_coh_id = cot.cot_cod_coh_id
        AND cod.cod_line_number = cot.cot_cod_line_number
        AND cod.cod_coh_id = coh.coh_id
        AND coh.coh_cus_code = cus.cus_code
        AND prd.prd_code = cod.cod_prf_prd_code
        AND prf_prd_code = cod.cod_prf_prd_code
        AND prf_fmt_code = cod.cod_prf_fmt_code
        AND fmt_code = prf_fmt_code
        AND prd.prd_ven_code = ven_code
        AND prd.prd_ven_code = vpd_ven_distributed_by_code
        AND prd.prd_code = vpd_prd_code
        AND TRUNC(prd.prd_pgr_code,-3) = pgr_maj.pgr_code --arm52
        AND pfw_whz_code = whz_code                           --ber1645
        AND pfw_prf_prd_code = prf_prd_code                    --ber1645
        AND pfw_prf_fmt_code = prf_fmt_code                    --ber1645
        AND pfw_whs_code          = cod.cod_whs_picking_code    --ber1645
        AND prd.prd_brn_code = brn_code (+)
        AND prw_whs_code =  vendor_invoice_pack.find_purchase_warehouse_func(cod.cod_prf_prd_code,cod.cod_whs_picking_code)    --GIC3413 --cod.cod_whs_picking_code                    --BER1461
        AND prw_prd_code = prd.prd_code                    --GIC3413
        AND prw_shr_code = shr_code(+)                --GIC3413
    GROUP BY            cod.cod_prf_prd_code,
                        cod.cod_prf_prd_original_code,
                        cod.cod_line_number,
                        cod.cod_order_type,
                        cod.cod_coh_id,
                        cod.cod_selling_retail,
                        cod.cod_original_retail,
                        cod.cod_promotion_amount,
                        cod.cod_pricing_source,
                        cod.cod_surcharge,
                        cod.cod_cod_coh_id,
                        cod.cod_cod_line_number,
                        cod.cod_prebook_method,
                        cot.cot_inh_id,
                        cod.cod_prf_fmt_code,
                        NVL(cod.cod_order_quantity, cod.cod_order_weight),
                        prd.prd_srp_fmt_code,
                        prd.prd_ven_code,--BRC31
                        ven.ven_section_on_inv_switch,  --cvi2821
                        fmt_short_code,
                        prd.prd_description,
                        DECODE(prd.prd_attribute,'COU',2,1),  --BER227 + GIC3290
                        prd.prd_alt_description,
                        prd.prd_ctg_code,
                        prd.prd_catalog_sequence_code,
                        prd.prd_fmt_weighted_inv_code,
                        whz_description,
                        whz_alt_description,
                        prd.prd_definition,
                        DECODE(prd.prd_attribute,'COU','ZZZ',pfw_whz_code), --ber1645 + GIC3290
                        prf_only_one_pick_wght_switch,     --ber638 rendu dans PRF plutot que PRD
                        prd.prd_special_order_switch,
                        pfw_whz_code, --ber1645
                        prd.prd_attribute,
                        NVL(brn_description, ven_short_name),
                        NVL(NVL(brn_alt_description,brn_description), ven_short_name),
                        cot.cot_federal_tax_rate,
                        cot.cot_provincial_tax_rate,
                        prw.prw_federal_display_switch,
                        prw.prw_provincial_display_switch,
                        prf_description,
                        shr_description,
                        shr_alt_description,
                        cod.cod_price_srp,
                        cus.cus_srt_code,
                        prd.prd_srp_fmt_code,
                        vpd_manufacturer_code,
                        ctr_super_distributor_switch,
                        prd.prd_cigar_switch,
                        cod.cod_number_of_cigars,
                        cod.cod_selling_before_tobacco_tax,
                        cod.cod_before_tob_tax_incl_fed_tx,
                        cod.cod_selling_bf_tob_per_cigar,
                        cod.cod_taxable_amount_per_cigar,
                        cod.cod_tobacco_tax_per_cigar,
                        cod.cod_tobacco_markup_rate,
                        cod.cod_tobacco_tax_rate,
                        cod.cod_tobacco_tax,
                        cod.cod_pty_code,       --FRE3610
                        NVL(cod.cod_desired_quantity, cod.cod_desired_weight), --BER4039
                        cod.cod_royalty_amount  , --mtp62
                        TRUNC(prd.prd_pgr_code, -3) , --arm52
                        pgr_maj.pgr_description ,--arm52
                        pgr_maj.pgr_alt_description, --arm52
                        prd.prd_pgr_code, --BEA91
                        prf.prf_upc_code,  --BEA91
                        cod.cod_vsi_original_code, --BEA90
                        cod.cod_sio_distributed_amount,   --BEA90
                        cus.cus_print_inv_by_line_switch  --BEA278
    UNION ALL --SELECT pour les consignes
    SELECT     ALL
                    coc_prf_prd_code cod_prf_prd_code,
                    NULL cod_prf_prd_original_code,
                    cod.cod_prf_prd_code cod_prd_order_code,
                    cod.cod_line_number,
                    'AA' cod_order_type,        --doit être nimporte kel 2 caracteres sauf 'SP'
                    NULL order_line_number,
                    coc_cot_cod_coh_id cod_coh_id,
                    coc_cost_price cod_selling_retail,
                    coc_cost_price cod_original_retail, --LAN452
                    NULL cod_promotion_amount,
                    NULL cod_pricing_source,
                    NULL cod_surcharge,       --CVI90
                    cod.cod_cod_coh_id cod_cod_coh_id,           --CVI90  --CVI2344
                    cod.cod_cod_line_number cod_cod_line_number, --CVI90  --CVI2344
                    NULL cod_prebook_method,  --CVI90
                    NULL cod_weight_qty,
                    coc_cot_line_number cot_line_number,
                    coc_quantity cot_weight_qty,
                    cot.cot_inh_id,
                    cot.cot_invoice_weight,
                    0 cigarettes_shipped,
                    coc.coc_invoiced_ext_price montant, --BER3866
                    0 tobacco_tax,
                    (CASE WHEN coc_federal_tax_rate = 0 AND coc_provincial_tax_rate = 0
                                THEN coc.coc_invoiced_ext_price ELSE 0 END) total_non_taxable,--fre2459 + BER3866
                    (CASE WHEN coc_federal_tax_rate > 0 AND coc_provincial_tax_rate > 0
                                THEN coc.coc_invoiced_ext_price ELSE 0 END) total_taxable,--fre2459 + BER3866
                    (CASE WHEN coc_federal_tax_rate > 0 AND coc_provincial_tax_rate = 0
                                THEN coc.coc_invoiced_ext_price ELSE 0 END) total_taxable_tps,--fre2459 + BER3866
                    (CASE WHEN coc_federal_tax_rate = 0 AND coc_provincial_tax_rate > 0
                                THEN coc.coc_invoiced_ext_price ELSE 0 END) total_taxable_tvq,--fre2459 + BER3866
                    (CASE WHEN coc_federal_tax_rate > 0
                            THEN coc.coc_invoiced_ext_price else 0 END) total_taxable_tps2,--fre2459 + BER3866
                    (CASE WHEN coc_provincial_tax_rate > 0
                                THEN coc.coc_invoiced_ext_price ELSE 0 END) total_taxable_tvq2,--fre2459 + BER3866
                    NULL prix_unitaire,
                    fmt_short_code fmt_short_code,
                    prd_cns.prd_ven_code,        --brc31
                    ven.ven_section_on_inv_switch,  --cvi2821
                    DECODE(prd.prd_attribute,'COU',2,1) prd_attribute_tri,  --BER227 + GIC3290
                    prd_cns.prd_description prd_description,
                    prd_cns.prd_alt_description prd_alt_description,
                    prd.prd_ctg_code prd_ctg_code,
                    prd.prd_catalog_sequence_code,
                    prd.prd_definition prd_type,
                    prd_cns.prd_fmt_weighted_inv_code prd_fmt_weighted_inv_code,
                    0 prf_only_one_pick_wght_switch,    --ber638 nommé PRF plutot que PRD
                    prd.prd_special_order_switch prd_special_order_switch,  --ROL2760
                --    prf_cod.prf_whz_code prf_whz_code, --ber303 entreposage est sur le PRF maintenant (plutot que PRD)
                    pfw_whz_code, --ber1645 rendu ds PFW
                    whz_description,--fre1056
                    whz_alt_description, --CSC4626
                    prd_cns.prd_attribute prd_attribute,
                    DECODE(prd.prd_attribute,'COU','COURRIERS',pfw_whz_code) prf_whz_code_ber, --ber1645, --ber227 pour afficher ou non la zone du produit (qd courrier et caisson on l'affiche pas)
                    NVL(brn_description, ven_short_name) marque_manuf,
                    NVL(NVL(brn_alt_description,brn_description), ven_short_name) alt_marque_manuf,--FRE3752
                    prw.prw_federal_display_switch, --cvi90       --fre2459
                    prw.prw_provincial_display_switch, --cvi90        --fre2459
                    coc_federal_tax_rate cot_federal_tax_rate,              --fre2459        --cvi90
                    coc_provincial_tax_rate cot_provincial_tax_rate,     --fre2459      --cvi90
                    DECODE(coc_federal_tax_rate, 0 , '', 'F')||DECODE(coc_provincial_tax_rate, 0, '', 'P') ta,    --fre2459
                    DECODE(prw.prw_federal_display_switch, 0 , '', 'F')||DECODE(prw.prw_provincial_display_switch, 0, '', 'P') tv, --fre2459
                    prf_cns.prf_description prf_description,
                    NULL shr_description,
                    NULL shr_alt_description,
                    NULL psr_price,
                    NULL manufacturer_code,
                    NULL marge_percent,
                    0 prd_cigar_switch,    --usg323
                    NULL cod_number_of_cigars,    --usg323
                    NULL cod_selling_before_tobacco_tax,    --usg323
                    NULL cod_before_tob_tax_incl_fed_tx,    --usg323
                    NULL cod_selling_bf_tob_per_cigar,    --usg323
                    NULL cod_taxable_amount_per_cigar,    --usg323
                    NULL cod_tobacco_tax_per_cigar,    --usg323
                    NULL cod_tobacco_markup_rate,    --usg323
                    NULL cod_tobacco_tax_rate,    --usg323
                    NULL cod_tobacco_tax,    --usg323
                    cod.cod_prf_fmt_code, -- BER2752
                    NULL cod_pty_code,     --FRE3610
                    NULL cod_desired_qty_weight, --BER4039
                    0 cod_royalty_amount , --mtp62
                    TRUNC(prd.prd_pgr_code, -3) pgr_majeur, --arm52
                    pgr_maj.pgr_description pgr_description,--arm52
                    pgr_maj.pgr_alt_description pgr_alt_description, --arm52
                    prd.prd_pgr_code prd_pgr_code, --BEA91
                    prf_cns.prf_upc_code prf_upc_code, --BEA91
                    NULL  cod_vsi_original_code, --BEA90
                    NULL  cod_sio_distributed_amount,  --BEA90
                    cus.cus_print_inv_by_line_switch  cus_print_inv_by_line_switch  --BEA278
    FROM        customer_order_transactions cot,
                customer_order_headers coh,
                customer_order_details cod,
                customers cus, --BEA278
                products prd,
                products prd_cns,
                product_warehouses prw,
                product_formats prf_cns,
                formats fmt,
                customer_order_consignments coc,
                vendors ven,
                brand_names brn,
                warehouse_zones whz,
                product_groups pgr_maj, --arm52
                product_format_warehouses pfw,        --ber1645
                product_formats prf_cod
    WHERE prd.prd_definition <> 'D'
      AND cot.cot_cod_coh_id = coc_cot_cod_coh_id
      AND cot.cot_cod_line_number = coc_cot_cod_line_number
      AND cot.cot_line_number = coc_cot_line_number
      AND cod.cod_coh_id = cot.cot_cod_coh_id
      AND cod.cod_line_number = cot.cot_cod_line_number
      AND prd_cns.prd_code = coc_prf_prd_code
      AND cod.cod_prf_prd_code = prd.prd_code
      and prf_cod.prf_prd_code = cod.cod_prf_prd_code
      AND prf_cod.prf_fmt_code = cod.cod_prf_fmt_code
      AND prf_cns.prf_prd_code = coc_prf_prd_code
      AND prf_cns.prf_fmt_code = coc_prf_fmt_code
      AND fmt_code = prf_cns.prf_fmt_code
      AND prw.prw_prd_code = prd.prd_code
      AND prw.prw_whs_code = coh.coh_whs_delivery_code
      AND cod.cod_coh_id = coh.coh_id
      AND coh.coh_cus_code = cus.cus_code --BEA278
      AND TRUNC(prd.prd_pgr_code,-3) = pgr_maj.pgr_code --arm52
      AND pfw_whz_code = whz_code                           --ber1645
      AND pfw_prf_prd_code = prf_cod.prf_prd_code    --ber1645
      AND pfw_prf_fmt_code = prf_cod.prf_fmt_code    --ber1645
      AND pfw_whs_code          = cod.cod_whs_picking_code    --ber1645
      AND prd_cns.prd_ven_code = ven_code
      AND prd_cns.prd_brn_code = brn_code (+)
    UNION ALL --SELECT pour les consignes des dinde ber3866
    SELECT      DISTINCT
                  coc.coc_prf_prd_code cod_prf_prd_code,
                  NULL cod_prf_prd_original_code,
                  cod.cod_prf_prd_code cod_prd_order_code,
                  cod.cod_line_number,
                  'AA' cod_order_type,        --doit être nimporte kel 2 caracteres sauf 'SP'
                  NULL order_line_number,
                  coc_cot_cod_coh_id cod_coh_id,
                  coc_cost_price cod_selling_retail,
                  coc_cost_price cod_original_retail, --LAN452
                  NULL cod_promotion_amount,
                  NULL cod_pricing_source,
                  NULL cod_surcharge,       --CVI90
                  cod.cod_cod_coh_id cod_cod_coh_id,           --CVI90  --CVI2344
                  cod.cod_cod_line_number cod_cod_line_number, --CVI90  --CVI2344
                  NULL cod_prebook_method,  --CVI90
                  NULL cod_weight_qty,
                  0 cot_line_number,
                  SUM(coc_quantity) cot_weight_qty,
                  cot.cot_inh_id,
                  SUM(cot.cot_invoice_weight) cot_invoice_weight ,
                  0 cigarettes_shipped,
                  SUM(coc.coc_invoiced_ext_price) montant, --
                  0 tobacco_tax,
                  (CASE WHEN coc_federal_tax_rate = 0 AND coc_provincial_tax_rate = 0
                              THEN SUM(coc.coc_invoiced_ext_price)
                              ELSE 0 END) total_non_taxable,--fre2459 + BER3866
                  (CASE WHEN coc_federal_tax_rate > 0 AND coc_provincial_tax_rate > 0
                              THEN SUM(coc.coc_invoiced_ext_price)
                              ELSE 0 END) total_taxable,--fre2459 + BER3866
                  (CASE WHEN coc_federal_tax_rate > 0 AND coc_provincial_tax_rate = 0
                              THEN SUM(coc.coc_invoiced_ext_price)
                              ELSE 0 END) total_taxable_tps,--fre2459 + BER3866
                  (CASE WHEN coc_federal_tax_rate = 0 AND coc_provincial_tax_rate > 0
                              THEN SUM(coc.coc_invoiced_ext_price)
                              ELSE 0 END) total_taxable_tvq,--fre2459 + BER3866
                  (CASE WHEN coc_federal_tax_rate > 0
                          THEN SUM(coc.coc_invoiced_ext_price)
                          ELSE 0 END) total_taxable_tps2,--fre2459 + BER3866
                  (CASE WHEN coc_provincial_tax_rate > 0
                              THEN SUM(coc.coc_invoiced_ext_price)
                              ELSE 0 END) total_taxable_tvq2,--fre2459 + BER3866
                  NULL prix_unitaire,
                  fmt_short_code fmt_short_code,
                  prd_cns.prd_ven_code,        --brc31
                  ven.ven_section_on_inv_switch,  --cvi2821
                  DECODE(prd.prd_attribute,'COU',2,1) prd_attribute_tri,  --BER227 + GIC3290
                  prd_cns.prd_description prd_description,
                  prd_cns.prd_alt_description prd_alt_description,
                  prd.prd_ctg_code prd_ctg_code,
                  prd.prd_catalog_sequence_code,
                  prd.prd_definition prd_type,
                  prd_cns.prd_fmt_weighted_inv_code prd_fmt_weighted_inv_code,
                  0 prf_only_one_pick_wght_switch,    --ber638 nommé PRF plutot que PRD
                  prd.prd_special_order_switch prd_special_order_switch,  --ROL2760
              --    prf_cod.prf_whz_code prf_whz_code, --ber303 entreposage est sur le PRF maintenant (plutot qu
                  pfw_whz_code, --ber1645 rendu ds PFW
                  whz_description,--fre1056
                  whz_alt_description, --CSC4626
                  prd_cns.prd_attribute prd_attribute,
                  DECODE(prd.prd_attribute,'COU','COURRIERS',pfw_whz_code) prf_whz_code_ber, --ber1645, --ber227
                  NVL(brn_description, ven_short_name) marque_manuf,
                  NVL(NVL(brn_alt_description,brn_description), ven_short_name) alt_marque_manuf,--FRE3752
                  prw.prw_federal_display_switch, --cvi90       --fre2459
                  prw.prw_provincial_display_switch, --cvi90        --fre2459
                  coc_federal_tax_rate cot_federal_tax_rate,              --fre2459        --cvi90
                  coc_provincial_tax_rate cot_provincial_tax_rate,     --fre2459      --cvi90
                  DECODE(coc_federal_tax_rate, 0 , '', 'F')||DECODE(coc_provincial_tax_rate, 0, '', 'P') ta,    --fre2459
                  DECODE(prw.prw_federal_display_switch, 0 , '', 'F')||DECODE(prw.prw_provincial_display_switch, 0, '', 'P') tv,
                  prf_cns.prf_description prf_description,
                  NULL shr_description,
                  NULL shr_alt_description,
                  NULL psr_price,
                  NULL manufacturer_code,
                  NULL marge_percent,
                  0 prd_cigar_switch,    --usg323
                  NULL cod_number_of_cigars,    --usg323
                  NULL cod_selling_before_tobacco_tax,    --usg323
                  NULL cod_before_tob_tax_incl_fed_tx,    --usg323
                  NULL cod_selling_bf_tob_per_cigar,    --usg323
                  NULL cod_taxable_amount_per_cigar,    --usg323
                  NULL cod_tobacco_tax_per_cigar,    --usg323
                  NULL cod_tobacco_markup_rate,    --usg323
                  NULL cod_tobacco_tax_rate,    --usg323
                  NULL cod_tobacco_tax,    --usg323
                  cod.cod_prf_fmt_code, -- BER2752
                  NULL cod_pty_code,     --FRE3610
                  NULL cod_desired_qty_weight, --BER4039
                  0 cod_royalty_amount , --mtp62
                  TRUNC(prd.prd_pgr_code, -3) pgr_majeur, --arm52
                  pgr_maj.pgr_description pgr_description,--arm52
                  pgr_maj.pgr_alt_description pgr_alt_description, --arm52
                  prd.prd_pgr_code prd_pgr_code, --BEA91
                  prf_cns.prf_upc_code prf_upc_code, --BEA91
                  NULL  cod_vsi_original_code, --BEA90
                  NULL cod_sio_distributed_amount,  --BEA90
                  cus.cus_print_inv_by_line_switch  cus_print_inv_by_line_switch  --BEA278
    FROM      customer_order_transactions cot,
              customer_order_headers coh,
              customer_order_details cod,
              customers cus, --BEA278
              products prd,
              products prd_cns,
              product_warehouses prw,
              product_formats prf_cns,
              formats fmt,
              customer_order_consignments coc,
              vendors ven,
              brand_names brn,
              warehouse_zones whz,
              product_groups pgr_maj, --arm52
              product_format_warehouses pfw,        --ber1645
              product_formats prf_cod
    WHERE prd.prd_definition = 'D'
      AND cot.cot_cod_coh_id = coc_cot_cod_coh_id
      AND cot.cot_cod_line_number = coc_cot_cod_line_number
      AND cot.cot_line_number = coc_cot_line_number
      AND cod.cod_coh_id = cot.cot_cod_coh_id
      AND cod.cod_line_number = cot.cot_cod_line_number
      AND prd_cns.prd_code = coc_prf_prd_code
      /*AND (cod.cod_order_type <> 'SP'  --pr les fusions de commandes (perso CHA et CVI)
      AND cod.cod_cod_coh_id IS NULL)*/
      AND cod_show_spec_prebook_switch = 0   --FRE3914
      AND cod.cod_prf_prd_code = prd.prd_code
      and prf_cod.prf_prd_code = cod.cod_prf_prd_code
      AND prf_cod.prf_fmt_code = cod.cod_prf_fmt_code
      AND prf_cns.prf_prd_code = coc_prf_prd_code
      AND prf_cns.prf_fmt_code = coc_prf_fmt_code
      AND fmt_code = prf_cns.prf_fmt_code
      AND prw.prw_prd_code = prd.prd_code
      AND prw.prw_whs_code = coh.coh_whs_delivery_code
      AND cod.cod_coh_id = coh.coh_id
      AND coh.coh_cus_code = cus.cus_code --bea278
      AND TRUNC(prd.prd_pgr_code,-3) = pgr_maj.pgr_code --arm52
      AND pfw_whz_code = whz_code                           --ber1645
      AND pfw_prf_prd_code = prf_cod.prf_prd_code    --ber1645
      AND pfw_prf_fmt_code = prf_cod.prf_fmt_code    --ber1645
      AND pfw_whs_code          = cod.cod_whs_picking_code    --ber1645
      AND prd_cns.prd_ven_code = ven_code
      AND prd_cns.prd_brn_code = brn_code (+)
    GROUP BY            coc.coc_prf_prd_code,
                        cod.cod_prf_prd_code,
                        cod.cod_line_number,
                        cod.cod_order_type,
                        coc_cot_cod_coh_id,
                        coc_cost_price,
                        cod.cod_cod_coh_id,
                        cod.cod_cod_line_number,
                        cot.cot_inh_id,
                        cod.cod_prf_fmt_code,
                        prd_cns.prd_ven_code,--BRC31
                        ven.ven_section_on_inv_switch,  --cvi2821
                        fmt_short_code,
                        prd_cns.prd_description,
                        prd.prd_attribute,
                        prd_cns.prd_alt_description,
                        prd.prd_ctg_code,
                        prd.prd_catalog_sequence_code,
                        prd_cns.prd_fmt_weighted_inv_code,
                        whz_description,
                        whz_alt_description,
                        prd.prd_definition,
                        prd.prd_special_order_switch,
                        pfw_whz_code, --ber1645
                        prd_cns.prd_attribute,
                        NVL(brn_description, ven_short_name),
                        NVL(NVL(brn_alt_description,brn_description), ven_short_name),
                        coc_federal_tax_rate,
                        coc_provincial_tax_rate,
                        prw.prw_federal_display_switch,
                        prw.prw_provincial_display_switch,
                        prf_cns.prf_description,
                        TRUNC(prd.prd_pgr_code, -3) , --arm52
                        pgr_maj.pgr_description ,--arm52
                        pgr_maj.pgr_alt_description, --arm52
                        prd.prd_pgr_code, --BEA91
                        prf_cns.prf_upc_code,  --BEA91
                        cus.cus_print_inv_by_line_switch --BEA278
    ORDER BY     cot_inh_id,
                 prd_ctg_code,
                 prd_catalog_sequence_code,
                 cod_coh_id,
                 cod_line_number,
                 order_line_number,
                 cot_line_number;