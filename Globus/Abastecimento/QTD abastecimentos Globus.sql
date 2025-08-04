-- Contar a quantidade de abastecimentos Totais Globus por Empresa
SELECT 
    EMPRESA, 
    COUNT(*) AS Qtd_Abas

FROM  fact_vwpbi_abastecimento_detalhado WHERE  DATA >= '2025-01-01 00:00:00'
GROUP BY EMPRESA

/* 21	128179
   27	54418*/