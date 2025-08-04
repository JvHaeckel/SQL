-- Exibir linhas com Abastecimento Duplicado Globus

SELECT 
     DATE(DATA), PREFIXO, LITROS, 
    COUNT(*) AS QTD
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00' AND LITROS >= 0.01
GROUP BY  DATE(DATA), PREFIXO, LITROS
HAVING QTD >= 2
ORDER BY LITROS DESC