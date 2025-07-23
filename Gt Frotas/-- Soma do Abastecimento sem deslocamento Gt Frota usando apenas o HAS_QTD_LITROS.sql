-- Soma do Abastecimento sem deslocamento Gt Frota usando apenas o HAS_QTD_LITROS
SELECT 
    ROUND(SUM(HAS_QTD_LITROS ), 2) AS SOMA_Litros_Abas_SemDesloc
FROM fact_vwpbi_abast_gtfrota
WHERE 
    HAS_DATA >= '2025-01-01 00:00:00'
    AND KM_PERCO = 0 
    AND (HAS_QTD_LITROS) IS NOT NULL
    AND (HAS_QTD_LITROS) > 0
