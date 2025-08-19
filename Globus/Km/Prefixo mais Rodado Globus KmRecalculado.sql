/* Prefixo mais Rodado Globus KmRecalculado */
SELECT PREFIXO,  SUM(HODFINALVELOC - HODINICIALVELOC) AS KmRecalculado  

FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'

GROUP BY PREFIXO 
ORDER BY  KmRecalculado DESC

/* Mais Rodado 0002914	-> 96129 
Menos Rodado   0002321	-> 72426   */
