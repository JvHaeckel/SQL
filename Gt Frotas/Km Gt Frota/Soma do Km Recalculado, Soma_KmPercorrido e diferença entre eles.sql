-- Soma do Km Recalculado, Soma_KmPercorrido e diferença entre eles
SELECT 
    SUM(HAS_ODOMETRO - KM_ANT) AS Soma_KmRecalculado,   -- Soma todos os valores de Km Recalculado
    SUM(KM_PERCO) AS Soma_KmPercorrido,                -- Soma todos os Km Percorrido
    SUM(HAS_ODOMETRO - KM_ANT) - SUM(KM_PERCO) AS Diferenca  -- Diferença entre eles
FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00'
