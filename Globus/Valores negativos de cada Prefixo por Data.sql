/* Valores negativos de cada Prefixo por Data */

SELECT DATA, PREFIXO,
  SUM(HODFINALVELOC - HODINICIALVELOC) AS Km_Negativo
FROM  fact_vwpbi_abastecimento_detalhado

WHERE  DATA >= '2025-01-01 00:00:00' 
GROUP BY PREFIXO, DATA 
order by Km_Negativo ASC