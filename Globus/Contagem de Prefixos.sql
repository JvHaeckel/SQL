-- Mostrar os Prefixos distintos na Tabela de Abastecimento Detalhado
-- select distinct PREFIXO FROM fact_vwpbi_abastecimento_detalhado;

-- Contar a quantidade de prefixos distintos
-- SELECT COUNT(DISTINCT PREFIXO) AS Quantidade_Prefixos 
-- FROM fact_vwpbi_abastecimento_detalhado;

-- Contar a quantidade de prefixos 
 -- SELECT COUNT(PREFIXO) AS Prefixos FROM fact_vwpbi_abastecimento_detalhado;

-- Juntando as duas
SELECT  
COUNT( Distinct PREFIXO) AS Quantidade_Prefixos,
COUNT(PREFIXO) AS Prefixos

FROM fact_vwpbi_abastecimento_detalhado;