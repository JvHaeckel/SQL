-- Casos de Abastecimento Duplicado 

WITH Duplicados AS (
  SELECT 
    DATE(DATA) AS DATA_SEM_HORA,
    PREFIXO,
    LITROS
  FROM fact_vwpbi_abastecimento_detalhado
  WHERE DATA >= '2025-01-01 00:00:00' AND LITROS >= 0.01
  GROUP BY DATE(DATA), PREFIXO, LITROS
  HAVING COUNT(*) >= 2
)
SELECT 
  COUNT(*) AS QTD_DUPLICADOS
FROM fact_vwpbi_abastecimento_detalhado f
JOIN Duplicados d
  ON DATE(f.DATA) = d.DATA_SEM_HORA
  AND f.PREFIXO = d.PREFIXO
  AND f.LITROS = d.LITROS
WHERE f.DATA >= '2025-01-01 00:00:00' AND f.LITROS >= 0.01;
