-- Seleciona o total de quilômetros Percorridos até agora por Tipo Frota durante o ano de 2025

SELECT
  TIPO_FROTA AS Frota,                -- Mostra o prefixo do veículo (renomeia apenas para deixar a primeira letra maiúscula)
  SUM(KMPERCORRIDO) AS Km_Percorrido  -- Soma os quilômetros percorridos no mês para cada prefixo e renomeia como "Total_Mensal"

FROM fact_vwpbi_abastecimento_detalhado -- Indica a tabela onde estão os dados
WHERE DATA >= '2025-01-01 00:00:00' AND  DATA < '2026-01-01 00:00:00'        

GROUP BY 
  Frota                             -- Agrupa por prefixo (veículo)
ORDER BY 
  Km_Percorrido   DESC      ;       -- E por último, do menor para o maior valor de quilômetros 