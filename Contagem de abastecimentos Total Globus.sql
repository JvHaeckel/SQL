-- Contar a quantidade de abastecimentos Totais Globus por Prefixo
SELECT 
    EMPRESA, PREFIXO,
    COUNT(*) AS Qtd_Abas

FROM  fact_vwpbi_abastecimento_detalhado

WHERE  DATA >= '2025-01-01 00:00:00'
   
GROUP BY EMPRESA, PREFIXO
ORDER BY EMPRESA, Qtd_Abas DESC;