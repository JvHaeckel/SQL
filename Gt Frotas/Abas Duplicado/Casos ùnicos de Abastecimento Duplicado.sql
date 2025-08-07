-- Casos únicos de Abastecimento Duplicado
SELECT 
  COUNT(*) AS QTD_Abas_Duplicado
FROM (
  SELECT 
    DATE(HAS_DATA) AS Data, 
    VEI_IDENTIFICACAO_EMPRESA AS Prefixo, 
    HAS_QTD_LITROS AS LITROS
  FROM fact_vwpbi_abast_gtfrota  WHERE HAS_DATA >= '2025-01-01 00:00:00' 
  GROUP BY DATE(HAS_DATA), VEI_IDENTIFICACAO_EMPRESA, HAS_QTD_LITROS
  HAVING COUNT(*) >= 2
) AS GruposDuplicados;

