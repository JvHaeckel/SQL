-- Contar a quantidade de abastecimentos Totais Gt Frota (194434)
SELECT 
    
    COUNT(*) AS Qtd_Abas

FROM  fact_vwpbi_abast_gtfrota WHERE  HAS_DATA >= '2025-01-01 00:00:00'