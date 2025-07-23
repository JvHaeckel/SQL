-- Calcular a quantidade de veículos Vendidos, Ativos e Inativos
SELECT 
  CONDICAO,
  COUNT(DISTINCT PREFIXOVEIC) AS QTD
FROM fact_vwpbi_frota
WHERE CONDICAO IN ('Ativo', 'Inativo', 'Vendido')
GROUP BY CONDICAO;