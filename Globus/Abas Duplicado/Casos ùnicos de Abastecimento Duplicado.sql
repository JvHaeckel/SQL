-- Casos ùnicos de Abastecimento Duplicado

SELECT 
  COUNT(*) AS QTD_GRUPOS_DUPLICADOS
FROM (
  SELECT 
    DATE(DATA) AS DATA_SEM_HORA,
    PREFIXO,
    LITROS
  FROM fact_vwpbi_abastecimento_detalhado
  WHERE DATA >= '2025-01-01 00:00:00' AND LITROS >= 0.01
  GROUP BY DATE(DATA), PREFIXO, LITROS
  HAVING COUNT(*) >= 2
) AS GruposDuplicados;
