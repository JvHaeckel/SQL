-- Km Negativo de cada Empresa
-- Soma Km negativo de cada empresa
SELECT  EMPRESA,  
  SUM(KM_PERCO) AS Soma_Km_Negativo

FROM  fact_vwpbi_abast_gtfrota
WHERE   HAS_DATA >= '2025-01-01 00:00:00' AND KM_PERCO < 0

GROUP BY    EMPRESA