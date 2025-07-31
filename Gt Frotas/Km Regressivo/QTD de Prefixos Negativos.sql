-- QTD de Prefixos Negativos (374)

SELECT 
COUNT(DISTINCT VEI_IDENTIFICACAO_EMPRESA ) AS QTD_Prefixos_Negativos

FROM  fact_vwpbi_abast_gtfrota

WHERE KM_PERCO < 0  AND HAS_DATA >= '2025-01-01 00:00:00'     