/*Somando Km Negativo de cada Prefixo até agora Globus :*/
SELECT PREFIXO,  SUM(HODFINALVELOC - HODINICIALVELOC) AS Km_Negativo

FROM fact_vwpbi_abastecimento_detalhado where data >= '2025-01-01 00:00:00'
AND (HODFINALVELOC - HODINICIALVELOC) < 0

GROUP BY PREFIXO, (HODFINALVELOC - HODINICIALVELOC)
order by  Km_Negativo ASC

