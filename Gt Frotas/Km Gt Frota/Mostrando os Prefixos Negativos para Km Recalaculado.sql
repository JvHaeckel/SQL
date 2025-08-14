-- Mostrando os Prefixos Negativos para Km Recalaculado

SELECT VEI_IDENTIFICACAO_EMPRESA AS Prefixo, KM_ANT, HAS_ODOMETRO,
(HAS_ODOMETRO - KM_ANT)  AS KmRecalculado                    
FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   AND (HAS_ODOMETRO - KM_ANT) < 0