/* Mês mais Rodado Globus KmRecalculado */
/* Mês mais Rodado Globus KmRecalculado */
SELECT 
    DATE_FORMAT(DATA, '%Y-%m') AS MesAno,  
    SUM(HODFINALVELOC - HODINICIALVELOC) AS KmRecalculado
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00'
GROUP BY DATE_FORMAT(DATA, '%Y-%m')
ORDER BY KmRecalculado DESC



