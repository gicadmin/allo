CREATE OR REPLACE FORCE VIEW phenix.v_formats_edi_lov (v_fmt_edi_short_code,v_edi_description,v_edi_alt_description) AS
SELECT 'BA'  CODE, 'Botte'                    DESCRIPTION,
                   'Bale'                     ALT_DESCRIPTION FROM  dual UNION
SELECT 'BG'  CODE, 'Sac'                      DESCRIPTION,
                   'Bag'                      ALT_DESCRIPTION FROM  dual UNION
SELECT 'BO'  CODE, 'Bouteille'                DESCRIPTION,
                   'Bottle'                   ALT_DESCRIPTION FROM  dual UNION
SELECT 'BR'  CODE, 'Baril'                    DESCRIPTION,
                   'Barrel'                   ALT_DESCRIPTION FROM  dual UNION
SELECT 'BX'  CODE, 'Boite'                    DESCRIPTION,
                   'Box'                      ALT_DESCRIPTION FROM  dual UNION
SELECT 'CA'  CODE, 'Caisse'                   DESCRIPTION,
                   'Case'                     ALT_DESCRIPTION FROM  dual UNION
SELECT 'CT'  CODE, 'Carton'                   DESCRIPTION,
                   'Carton'                   ALT_DESCRIPTION FROM  dual UNION
SELECT 'DS'  CODE, 'Présentoir'               DESCRIPTION,
                   'Display'                  ALT_DESCRIPTION FROM  dual UNION
SELECT 'DZ'  CODE, 'Douzaine'                 DESCRIPTION,
                   'Dozen'                 		ALT_DESCRIPTION FROM  dual UNION
SELECT 'EA'  CODE, 'Unité'                    DESCRIPTION,
                   'Each'                     ALT_DESCRIPTION FROM  dual UNION
SELECT 'FT'  CODE, 'Pied'                     DESCRIPTION,
                   'Foot'                     ALT_DESCRIPTION FROM  dual UNION
SELECT 'GA'  CODE, 'Gallon'                   DESCRIPTION,
                   'Gallon'                   ALT_DESCRIPTION FROM  dual UNION
SELECT 'LB'  CODE, 'Livre'                    DESCRIPTION,
                   'Pound'                    ALT_DESCRIPTION FROM  dual UNION
SELECT 'KG'  CODE, 'Kilogramme'               DESCRIPTION,
                   'Kilogram'                 ALT_DESCRIPTION FROM  dual UNION
SELECT 'OZ'  CODE, 'Once'                     DESCRIPTION,
                   'Ounce - Av'               ALT_DESCRIPTION FROM  dual UNION
SELECT 'PC'  CODE, 'Pièce'                    DESCRIPTION,
                   'Piece'                    ALT_DESCRIPTION FROM  dual UNION
SELECT 'PL'  CODE, 'Palette'                  DESCRIPTION,
                   'Pallet/Unit Load'         ALT_DESCRIPTION FROM  dual UNION
SELECT 'PK'  CODE, 'Paquet'                   DESCRIPTION,
                   'Package'                  ALT_DESCRIPTION FROM  dual UNION
SELECT 'PT'  CODE, 'Chopine'                  DESCRIPTION,
                   'Pint'                     ALT_DESCRIPTION FROM  dual UNION
SELECT 'QT'  CODE, 'Quart'                    DESCRIPTION,
                   'Quart'                    ALT_DESCRIPTION FROM  dual UNION
SELECT 'ZZ'  CODE, 'Demi caisse'              DESCRIPTION,
                   'half of Case'             ALT_DESCRIPTION FROM  dual UNION
SELECT 'UN'  CODE, 'Unitaire'                 DESCRIPTION,
                   'Unitary'                  ALT_DESCRIPTION FROM  dual;