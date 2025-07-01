-- Seleciona valores distintos (sem repetição) do prefixo dos veículos
SELECT DISTINCT f.PREFIXOVEIC       
-- A consulta está baseada na tabela "fact_vwpbi_frota", com alias "f"
FROM fact_vwpbi_frota f             
-- Faz um JOIN com a tabela "fact_vwpbi_abast_gtfrota", apelidada como "a"
JOIN fact_vwpbi_abast_gtfrota a     
  -- A junção ocorre quando o prefixo do veículo em "f" é igual à identificação do veículo na tabela "a"
  ON f.PREFIXOVEIC = a.VEI_IDENTIFICACAO_EMPRESA
-- Filtra para considerar apenas os veículos cuja condição seja 'Vendido'
WHERE f.CONDICAO = 'Vendido';       
