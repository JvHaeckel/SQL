-- Média QTD abastecimentos 
SELECT 
   ROUND( COUNT(*) * 1.0 / COUNT(DISTINCT PREFIXO),3) AS Media_Abastecimentos
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00';
