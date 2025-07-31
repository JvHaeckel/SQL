--  Km Negativo por Mês

SELECT 
MONTH(HAS_DATA) AS Mes, 
SUM(KM_PERCO) AS Soma_Km_Negativo

FROM       fact_vwpbi_abast_gtfrota
WHERE    HAS_DATA >= '2025-01-01 00:00:00'   AND KM_PERCO < 0

GROUP BY  MONTH(HAS_DATA)
ORDER BY    Mes;
