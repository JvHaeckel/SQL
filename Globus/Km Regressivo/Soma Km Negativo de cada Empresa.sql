/* Soma Km Negativo de cada Empresa */
SELECT EMPRESA as Empresa,  SUM(HODFINALVELOC - HODINICIALVELOC) AS Km_Negativo
FROM  fact_vwpbi_abastecimento_detalhado

WHERE DATA >= '2025-01-01 00:00:00' AND (HODFINALVELOC - HODINICIALVELOC) < 0

GROUP BY EMPRESA 