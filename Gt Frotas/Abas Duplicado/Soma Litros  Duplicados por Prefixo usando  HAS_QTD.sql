-- Somando os valores de Litros Duplicados por cada Prefixo até hoje usando o  HAS_QTD

SELECT 
    EMPRESA AS Empresa, DATE(HAS_DATA) AS Data, VEI_IDENTIFICACAO_EMPRESA AS Prefixo, 
    ROUND(SUM(HAS_QTD_LITROS),2) AS Total_Litros, COUNT(*) AS QTD
FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' AND HAS_QTD_LITROS >= 0.01
GROUP BY EMPRESA, DATE(HAS_DATA), VEI_IDENTIFICACAO_EMPRESA
HAVING QTD >= 2
ORDER BY Total_Litros DESC;

 /* Prefixo Mais Abastecido: 0063035 - 802.74
   Prefixo Menos Abastecido: 0063653 - 0.2   */
