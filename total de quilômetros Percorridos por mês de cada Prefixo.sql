-- Seleciona o total de Litros por frota a cada Mês durante o ano de 2025

SELECT 
  month(DATA) as Mês,
  year(DATA) as Ano,
  SUM(LITROS) AS Total,        -- Soma os Litros no mês para cada prefixo e renomeia como "Total_Mensal"
  TIPO_FROTA as Frota
FROM fact_vwpbi_abastecimento_detalhado -- Indica a tabela onde estão os dados
WHERE DATA >= '2025-01-01 00:00:00' AND  DATA < '2026-01-01 00:00:00'        

 GROUP BY

TIPO_FROTA,
year(DATA), 
month(DATA)

ORDER BY 
  Ano, Mês, Total   DESC , Frota;               -- E por último, do menor para o maior valor de quilômetros (se quiser do maior pro menor, adicione DESC aqui)