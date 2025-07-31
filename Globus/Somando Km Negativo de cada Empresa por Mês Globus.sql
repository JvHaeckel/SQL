/* Somando Km Negativo de cada Empresa por Mês Globus*/
SELECT EMPRESA as Empresa, MONTH(DATA) AS Mês, SUM(HODFINALVELOC - HODINICIALVELOC) AS Km_Negativo
FROM  fact_vwpbi_abastecimento_detalhado

WHERE DATA >= '2025-01-01 00:00:00' AND (HODFINALVELOC - HODINICIALVELOC) < 0

GROUP BY MONTH(DATA),EMPRESA 
ORDER BY EMPRESA, Mês
