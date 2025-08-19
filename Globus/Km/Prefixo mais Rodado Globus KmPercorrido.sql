/* Prefixo mais Rodado Globus KmPercorrido */
SELECT PREFIXO,  SUM(KMPERCORRIDO) AS KmPercorrido 

FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'

GROUP BY PREFIXO 
ORDER BY  KmPercorrido DESC

/* Mais Rodado 0002914	-> 96129 
Menos Rodado   0006340	-> 0   */
