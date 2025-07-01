/* Somando Km Negativo de cada Prefixo Mês: Globus */
SELECT  
  PREFIXO AS Prefixo,
  MONTH(DATA) AS Mês,  -- Extrai o número do mês da coluna DATA (1 a 12)
  SUM(HODFINALVELOC - HODINICIALVELOC) AS Km_Negativo
  
FROM  fact_vwpbi_abastecimento_detalhado  -- Tabela com dados de abastecimento, contendo data e hodômetros

WHERE  DATA >= '2025-01-01 00:00:00'  -- Considera apenas registros a partir de 1º de janeiro de 2025
AND (HODFINALVELOC - HODINICIALVELOC) < 0  -- Filtra apenas as linhas em que o hodômetro final é menor que o inicial (diferença negativa)

GROUP BY  PREFIXO, MONTH(DATA) -- Agrupa os dados pelo número do mês
ORDER BY  Mês;  -- Ordena os resultados de janeiro (1) a dezembro (12)