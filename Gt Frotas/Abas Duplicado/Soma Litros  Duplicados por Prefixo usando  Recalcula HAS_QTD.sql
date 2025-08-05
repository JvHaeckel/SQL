-- Somando os valores de Litros Duplicados por cada Prefixo até hoje usando o Recalcula HAS_QTD

SELECT 
    EMPRESA AS Empresa, DATE(HAS_DATA) AS Data, VEI_IDENTIFICACAO_EMPRESA AS Prefixo, 
    SUM(ROUND((HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES),1))  AS Total_Litros,COUNT(*) AS QTD
FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00' AND HAS_QTD_LITROS >= 0.01
GROUP BY EMPRESA, DATE(HAS_DATA), VEI_IDENTIFICACAO_EMPRESA
HAVING QTD >= 2
ORDER BY Total_Litros DESC;

 /* Prefixo Mais Abastecido: 0063035 - 802.74
   Prefixo Menos Abastecido: NULL - 0064460	0064463	0064467	0064237	0064300	
0.2 - 0063094	   */
