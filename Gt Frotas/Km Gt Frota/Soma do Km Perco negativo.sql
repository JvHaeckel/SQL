-- Soma do Km Perco neg

SELECT 
SUM(KM_PERCO) AS Soma_Km               -- Soma todos os valores  KM_PERCO 
FROM  fact_vwpbi_abast_gtfrota   WHERE  HAS_DATA >= '2025-01-01 00:00:00'   AND KM_PERCO < 0
                
