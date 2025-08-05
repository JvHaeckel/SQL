-- Média QTD abastecimentos GT Frota
SELECT 
   ROUND( COUNT(*) * 1.0 / COUNT(DISTINCT VEI_IDENTIFICACAO_EMPRESA),3) AS Media_Abastecimentos
FROM fact_vwpbi_abast_gtfrota
WHERE HAS_DATA >= '2025-01-01 00:00:00';
