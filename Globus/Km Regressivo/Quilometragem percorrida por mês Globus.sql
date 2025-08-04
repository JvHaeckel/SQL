-- somando os valores de quilometragem percorrida por mês no ano de 2025

SELECT 
  DATE_FORMAT(DATA, '%Y-%m') AS Mes,      -- Formata a data como "2025-01"
  SUM(KMPERCORRIDO) AS Total_KM
FROM fact_vwpbi_abastecimento_detalhado
WHERE DATA >= '2025-01-01' AND DATA < '2026-01-01'  -- Apenas ano de 2025
GROUP BY DATE_FORMAT(DATA, '%Y-%m')
ORDER BY Mes;
