-- Contar prefixos distintos Globus = 959 no mês de Julho
SELECT COUNT(DISTINCT PREFIXO) AS Prefixo 
FROM fact_vwpbi_abastecimento_detalhado 
WHERE DATA >= '2025-07-01' AND DATA < '2025-08-01';