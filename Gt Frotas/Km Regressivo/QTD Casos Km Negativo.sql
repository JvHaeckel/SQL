-- QTD Casos Km Negativo 
-- Se quiser saber os casos de cada estado basta colocar o resto que está comentado abaixo
SELECT 
  COUNT(*) AS Qtd_Negativo
FROM fact_vwpbi_abast_gtfrota
WHERE 
  KM_PERCO < 0
  AND HAS_DATA >= '2025-01-01 00:00:00'
 /* AND EMPRESA = 27  /*AND EMPRESA = 27 */