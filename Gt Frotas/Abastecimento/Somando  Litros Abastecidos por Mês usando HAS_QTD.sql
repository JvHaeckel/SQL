-- Somando os valores de Litros Abastecidos até hoje por Mês usando o  HAS_QTD_LITROS
SELECT 
  monthname(HAS_DATA) AS Mes,
  ROUND(SUM(HAS_QTD_LITROS), 2) AS RecalculaLitros
FROM 
  fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'
GROUP BY 
  monthname(HAS_DATA)
  ORDER BY RecalculaLitros DESC
  /* March	3051331.83*/