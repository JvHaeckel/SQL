-- Mostrando os Prefixos Negativos

SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo, KM_ANT, HAS_ODOMETRO,
KM_PERCO              
FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   AND KM_PERCO < 0