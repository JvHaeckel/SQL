-- Soma dos litros por prefixo para os que abasteceram mais de 1 vez sem deslocamento
SELECT 
    EMPRESA,
    PREFIXO,
    COUNT(*) AS Qtd_Abastecimentos,
    ROUND(SUM(LITROS), 2) AS Total_Litros_Abastecidos
FROM 
    fact_vwpbi_abastecimento_detalhado
WHERE 
    DATA >= '2025-01-01 00:00:00'
    AND KMPERCORRIDO <= 0.002
    AND LITROS > 0
GROUP BY 
    EMPRESA, PREFIXO
HAVING 
    COUNT(*) > 3
ORDER BY 
    Total_Litros_Abastecidos DESC;
