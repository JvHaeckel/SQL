/* Mês mais Rodado Globus KmPercorrido */
SELECT 
    DATE_FORMAT(DATA, '%m') AS Mes,  
    SUM(KMPERCORRIDO) AS KmPercorrido
FROM fact_vwpbi_abastecimento_detalhado WHERE DATA >= '2025-01-01 00:00:00'
GROUP BY DATE_FORMAT(DATA, '%m')
ORDER BY KmPercorrido ASC

