-- Contar a quantidade de prefixos distintos GT Frotas = 922 no mês de Julho
 SELECT COUNT(DISTINCT VEI_IDENTIFICACAO_EMPRESA) AS Prefixos 
 FROM fact_vwpbi_abast_gtfrota WHERE HAS_DATA >= '2025-07-01' AND HAS_DATA < '2025-08-01';