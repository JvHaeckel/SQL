-- Soma de litros abastecidos por data sem deslocamento por PREFIXO 
SELECT 
    EMPRESA ,DATA,PREFIXO, SUM(LITROS) AS Litros
FROM 
    fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00' AND KMPERCORRIDO = 0 AND LITROS > 0
GROUP BY EMPRESA, DATA, PREFIXO

ORDER BY  Litros DESC;