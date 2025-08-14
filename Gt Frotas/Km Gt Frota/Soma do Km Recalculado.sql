-- Soma do Km Recalculado

SELECT 
SUM(HAS_ODOMETRO - KM_ANT)  AS Soma_KmRecalculado               -- Soma todos os valores  KM_PERCO 
FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   
                
