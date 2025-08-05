-- Somando os valores de Litros Abastecidos até hoje por Mês usando o Recalcula HAS_QTD
SELECT 
  monthname(HAS_DATA) AS Mes,
  ROUND(SUM(HAS_ENCERRANTE_DEPOIS - HAS_ENCERRANTE_ANTES), 2) AS RecalculaLitros
FROM 
  fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-01-01 00:00:00'
GROUP BY 
  monthname(HAS_DATA)
  ORDER BY RecalculaLitros DESC
  /* March	3039613.94 */