/* Casos de Km negativo Globus*/
SELECT COUNT(*) AS Qtd_Negativos  -- Conta o número total de linhas que atendem à condição abaixo
FROM  fact_vwpbi_abastecimento_detalhado  
WHERE 
DATA >= '2025-01-01 00:00:00'      -- Considera apenas registros a partir de 1º de janeiro de 2025
  AND HODFINALVELOC - HODINICIALVELOC < 0  -- Apenas linhas onde o hodômetro final é menor que o inicial (KM negativo)
 
 /* AND EMPRESA = 27  -- Se quiser saber de cada empresa basta colocar esse trecho */