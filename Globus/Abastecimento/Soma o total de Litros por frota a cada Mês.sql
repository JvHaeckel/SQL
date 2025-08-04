-- Seleciona o total de quilômetros Percorridos até agora por Tipo Frota durante o ano de 2025

SELECT
  TIPO_FROTA AS Frota,                
  SUM(LITROS) AS Litros 

FROM fact_vwpbi_abastecimento_detalhado 
WHERE DATA >= '2025-01-01 00:00:00' AND  DATA < '2026-01-01 00:00:00'        

GROUP BY 
  Frota                             -- Agrupa por prefixo (veículo)
ORDER BY 
  LITROS   DESC      ;       -- E por último, do menor para o maior valor de quilômetros 