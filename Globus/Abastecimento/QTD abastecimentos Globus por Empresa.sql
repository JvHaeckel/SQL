-- Contar a quantidade de abastecimentos Totais Globus (182597)
SELECT 
    
    COUNT(*) AS Qtd_Abas

FROM  fact_vwpbi_abastecimento_detalhado WHERE  DATA >= '2025-01-01 00:00:00'