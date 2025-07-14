-- Quantidade de Abastecimentos sem deslocamento
SELECT 
    EMPRESA,
    VEI_IDENTIFICACAO_EMPRESA,
    COUNT(*) AS QtdeAbastecimentos,
    SUM(CASE WHEN KM_PERCO = 0 THEN 1 ELSE 0 END) AS QtdeSemDeslocamento
FROM fact_vwpbi_abast_gtfrota
WHERE 
    HAS_DATA >= '2025-01-01 00:00:00'
    AND HAS_QTD_LITROS > 0
GROUP BY 
    EMPRESA,
    VEI_IDENTIFICACAO_EMPRESA
HAVING 
    COUNT(*) >= 3 AND
    SUM(CASE WHEN KM_PERCO = 0 THEN 1 ELSE 0 END) >= 2
ORDER BY 
    QtdeSemDeslocamento DESC
