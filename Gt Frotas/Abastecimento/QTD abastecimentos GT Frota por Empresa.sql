-- Contar a quantidade de abastecimentos Totais Gt Frota por Empresa
SELECT 
    EMPRESA, 
    COUNT(*) AS Qtd_Abas

FROM  fact_vwpbi_abast_gtfrota WHERE  HAS_DATA >= '2025-01-01 00:00:00'
GROUP BY EMPRESA

/* 21	128179
   27	54418*/