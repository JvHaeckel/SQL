-- Soma de litros abastecidos sem deslocamento Globus
SELECT 
     SUM(LITROS) AS Litros
FROM  fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01 00:00:00' AND KMPERCORRIDO <= 0.002 AND LITROS > 0


