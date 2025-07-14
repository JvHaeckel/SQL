-- Exibir Prefixo que mais abasteceu sem deslocamento e o menos
SELECT 
   PREFIXO,
    SUM(LITROS) AS Total_Litros
FROM fact_vwpbi_abastecimento_detalhado
WHERE 
    DATA >= '2025-01-01 00:00:00' && KMPERCORRIDO = 0 && LITROS > 0
GROUP BY PREFIXO

