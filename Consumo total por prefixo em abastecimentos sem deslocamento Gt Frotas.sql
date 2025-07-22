-- Consumo total por prefixo em abastecimentos sem deslocamento
SELECT 
    VEI_IDENTIFICACAO_EMPRESA AS PREFIXO,  
    ROUND(SUM(HAS_QTD_LITROS), 2) AS Litros
FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00' AND KM_PERCO = 0 AND HAS_QTD_LITROS >= 0.01
GROUP BY VEI_IDENTIFICACAO_EMPRESA
ORDER BY Litros DESC;
